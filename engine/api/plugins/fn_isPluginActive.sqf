/*
================================================================================

NAME:
    BRM_FMK_fnc_isPluginActive

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Check if a framework plugin is active.

PARAMETERS:
    0 - Plugin class name (STRING)

USAGE:
    [] call BRM_FMK_fnc_isPluginActive

RETURNS:
    true if plugin is active, otherwise false. (BOOLEAN)

================================================================================
*/

params ["_plugin"];

_plugin in BRM_FMK_Engine_activePlugins
