_unit = _this select 0;
_basics = _this select 1;
[_unit,[[_bandage, _basics select 0],[_morphine, _basics select 1],[_epi, _basics select 2]]] call BRM_FMK_fnc_addToUniform;
