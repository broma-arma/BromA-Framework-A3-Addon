/*
================================================================================

NAME:
    BRM_FMK_fnc_verboseArray
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Converts an array into an english reading format.
    
PARAMETERS:
    0 - Array (ARRAY)

USAGE:
    myReadArray = [["Nife","Royal","Knite"]] call BRM_FMK_fnc_verboseArray
    >> "Nife, Royal and Knite"
    
RETURNS:
    Verbosed array (STRING)    

================================================================================
*/

params [["_array", [], [[]]]];

private _length = count _array;
if (_length > 1) then {
	(_array select [0, _length - 1] joinString ", ") + " and " + (_array select _length - 1)
} else {
	_array joinString ""
}
