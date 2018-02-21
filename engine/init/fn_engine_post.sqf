/*
================================================================================

NAME:
    BRM_fnc_engine_post

AUTHOR(s):
    Nife

DESCRIPTION:
    Is called every mission on post-init.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_fnc_engine_post

RETURNS:
    Nothing.

================================================================================
*/

[] call BRM_FMK_OCAP_fnc_init;

// Hacky shit to try to stop low FPS. ==========================================

enableSentences false;
