/*
================================================================================

DEPRECATED:
    Remove usage.

NAME:
    BRM_FMK_fnc_addMedicBasics

AUTHOR(s):
    Nife

DESCRIPTION:
    Add basic medical items to a Man object.

PARAMETERS:
    0 - Man object to add the item to. (OBJECT)
    1 - Array of amounts. (ARRAY)
        0 - Amount to bandage to add. (NUMBER)
        1 - Amount to morphine to add. (NUMBER)
        2 - Amount to epinephrine to add. (NUMBER)

USAGE:
    [player, [10, 4, 2]] call BRM_FMK_fnc_addMedicBasics;

RETURNS:
    Nothing

================================================================================
*/

["Deprecated, remove usage"] call BIS_fnc_error;

params ["_unit", "_basics"];
_basics params ["_bandageCount", "_morphineCount", "_epiCount"];

[_unit, [
	[_bandage, _bandageCount],
	[_morphine, _morphineCount],
	[_epi, _epiCount]
]] call BRM_FMK_fnc_addToUniform;
