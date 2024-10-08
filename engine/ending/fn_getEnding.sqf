if (BRM_FMK_Engine_compatVersion == 0) exitWith {
	_this call compile preprocessFile "mission\settings\endings.sqf";
	mission_ending_details
};

params ["_ending"];

private _title = "Mission over";
private _reason = format ["'%1', unconfigured ending. (%2)", _ending, "%1, %2, %3"];
private _winningSides = ["a"];
private _losingSides = ["b", "c"];
private _showStats = true;

private _cfgEnding = [["BRM_FMK", "Endings", _ending], configNull] call BIS_fnc_loadClass;
if (isClass _cfgEnding) then {
	_title = getText (_cfgEnding >> "title");
	_reason = getText (_cfgEnding >> "reason");
	_winningSides = getArray (_cfgEnding >> "winningSides") apply { missionNamespace getVariable format ["side_%1_side", _x] };
	_losingSides = getArray (_cfgEnding >> "losingSides") apply { missionNamespace getVariable format ["side_%1_side", _x] };
	if (isNumber (_cfgEnding >> "showStats")) then {
		_showStats = getNumber (_cfgEnding >> "showStats") > 0;
	};
};

if (!mission_enable_side_c) then {
	_winningSides = _winningSides - [side_c_side];
	_losingSides = _losingSides - [side_c_side];
};

[_winningSides, _losingSides, _showStats, _title, _reason, 1]
