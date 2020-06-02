/*
================================================================================

NAME:
   BRM_FMK_ACE3_fnc_ACE_RevivePlayer

AUTHOR(s):
    Nife

DESCRIPTION:
    Revives a unit's ACE parameters.

PARAMETERS:
    0 - Player (OBJECT)

USAGE:
    [player] spawn BRM_FMK_ACE3_fnc_ACE_RevivePlayer;

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit"];

_unit setVariable ["ace_medical_triageLevel", 0, true];
[_unit] call ace_medical_treatment_fnc_fullHealLocal;
_unit switchMove "";
