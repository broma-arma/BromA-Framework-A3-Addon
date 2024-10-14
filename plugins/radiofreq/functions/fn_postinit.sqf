if !(isMultiplayer && hasInterface && isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

private _sideID = player call BIS_fnc_objectSide call BIS_fnc_sideID;
if (_sideID > 3) exitWith {};

private _lrChannels = ["Infantry", "Support/Logistics"];

str player splitString "_" params ["", "_squadIndex", "_groupIndex"];
_squadIndex = parseNumber _squadIndex;
_groupIndex = parseNumber _groupIndex;

private _radioNets = BRM_FMK_Plugin_RadioFreq_radioNets select _sideID;

private _defaultCallsigns = [[OPFOR, BLUFOR, INDEPENDENT, CIVILIAN] select _sideID, "callsigns"] call BRM_FMK_fnc_getSideInfo;

{
	private _squadIndex = _forEachIndex;
	{
		private _groupIndex = _forEachIndex - 1;
		if (!isNil "_x") then {
			_x params ["_name", ""];

			if (_name == "") then {
				if (_defaultCallsigns isEqualType []) then {
					private _groupName = _defaultCallsigns param [_squadIndex, ""];
					if (_groupIndex > 0 && _groupName != "") then {
						_groupName = format ["%1 %2", _groupName, _groupIndex];
					};
					_x set [0, if (_groupIndex == -1) then {
						_groupName splitString " " param [0, ""]
					} else {
						_groupName
					}];
				} else {
					_x set [0, _defaultCallsigns];
				};
			};
		};
	} forEach _x;
} forEach _radioNets#0;

str player splitString "_" params ["", "_squadIndex", "_groupIndex"];
[parseNumber _squadIndex, parseNumber _groupIndex, true] call BRM_FMK_Plugin_RadioFreq_fnc_switchGroup;

["group", {
    params ["_unit", "_oldGroup", "_newGroup"];

	if (_unit == player) then {
		private _groupVar = _newGroup getVariable "BRM_FMK_Engine_fnc_groupVar";
		if (!isNil "_groupVar") then {
			_groupVar splitString "_" params ["", "_squadIndex", "_groupIndex"];
			[parseNumber _squadIndex, parseNumber _groupIndex, false] call BRM_FMK_Plugin_RadioFreq_fnc_switchGroup;
		};
	};
}] call CBA_fnc_addPlayerEventHandler;
