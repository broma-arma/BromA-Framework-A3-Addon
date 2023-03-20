diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_stalker", "_stalked"];

// TODO Might be better to just use own custom code for this 
[_stalker, _stalked] spawn BIS_fnc_stalk;
