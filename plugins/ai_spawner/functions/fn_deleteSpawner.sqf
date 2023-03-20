diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_id"];

!isNil { BRM_FMK_AIS_spawners deleteAt _id }
