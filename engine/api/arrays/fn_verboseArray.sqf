/*
================================================================================

NAME:
    BRM_FMK_fnc_verboseArray

AUTHOR(s):
    Nife

DESCRIPTION:
    Converts an array into an english reading format.

PARAMETERS:
    0+ - Item (ANY)

USAGE:
    ["Nife", "Royal", "Knite"] call BRM_FMK_fnc_verboseArray; // "Nife, Royal and Knite"

RETURNS:
    Verbosed array (STRING)

================================================================================
*/

if (count _this == 1 && { _this select 0 isEqualType [] }) then { _this = _this select 0; }; // Backward compatibility

private _length = count _this;
if (_length > 1) then {
	(_this select [0, _length - 1] joinString ", ") + " and " + (_this select -1)
} else {
	_this joinString ""
}
