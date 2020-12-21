if (!isPlayer _unit) then {
	private _voice = selectRandom selectRandom _defaultVoice;
	private _face = selectRandom selectRandom _defaultFace;
	private _name = if (!isNil "_defaultName") then {
		selectRandom _defaultName params ["_firstNames", "_lastNames"];
		format ["%1 %2", selectRandom _firstNames, selectRandom _lastNames];
	} else {
		""
	};

	[_unit, _voice, _face, _name] remoteExecCall ["BRM_FMK_fnc_setUnitIdentity", 0];
};

if (_defaultInsignia != "" && { !isNull ([["CfgUnitInsignia", _defaultInsignia], configNull] call BIS_fnc_loadClass) }) then {
	[_unit, _defaultInsignia] call BIS_fnc_setUnitInsignia;
};
