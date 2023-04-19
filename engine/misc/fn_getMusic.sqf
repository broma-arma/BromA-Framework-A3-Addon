#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_getMusic

AUTHOR(s):
    Nife

DESCRIPTION:
    Returns available music.

PARAMETERS:
    None.

USAGE:
    call BRM_FMK_fnc_getMusic;

RETURNS:
    Available music. (ARRAY)

================================================================================
*/

"getText (_x >> 'type') == 'soundtrack'" configClasses (configFile >> "CfgMusic") apply { configName _x }
