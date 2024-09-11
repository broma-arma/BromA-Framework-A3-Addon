params ["_group", "_unitClass", "_startPos", "_skill", "_loadout", ["_unitIndex", "x"]];

private _unit = _group createUnit [_unitClass, _startPos, [], 0, "FORM"];
_unit setSkill _skill;

[_unit, _loadout] call BRM_FMK_fnc_initAI;

if (is3DENPreview) then {
	private _color = ["colorOPFOR", "colorIndependent", "colorBLUFOR"] select ([OPFOR, INDEPENDENT, BLUFOR] find (_unit call BIS_fnc_objectSide));
	private _marker = ["local", getPos _unit, "hd_dot", _color, "", [1, 1], 0, 1] call BRM_FMK_fnc_newMarkerIcon;

	[{
		params ["_args", "_handle"];
		_args params ["_unit", "_marker"];

		if (!alive _unit) exitWith {
			deleteMarker _marker;
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
		_marker setMarkerPos getPos _unit;
	}, 0.1, [_unit, _marker]] call CBA_fnc_addPerFrameHandler;
};

["LOCAL", "CHAT", format ["Created unit %1 at %2 (%3)", _unitClass, _startPos, _unitIndex]] call BRM_FMK_fnc_doLog;

_unit
