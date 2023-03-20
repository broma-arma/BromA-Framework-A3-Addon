diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_unit", "_cache"];

[_cache, {
	_unit enableSimulationGlobal !_this;
	_unit hideObjectGlobal _this;
}] remoteExec ["call", 2];

if (!_cache && isNull objectParent _unit) then {
	private _pos = formationPosition _unit;
	_pos set [2, 0];
	_unit setPosATL _pos; // TODO ATL would result in unit being placed inside rocks?
};

_unit setVariable ["BRM_FMK_AIS_isCached", _cache];
