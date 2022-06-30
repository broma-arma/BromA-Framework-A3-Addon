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

if (!isNil "BRM_version") then { // Mission uses Broma Mission Framework
	if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare > 0) then { // > v0.7.5
		[] call BRM_FMK_fnc_logPlugins;
		[] call BRM_FMK_fnc_warnConflict;
		[] call BRM_FMK_fnc_defineGroups;
		[] call BRM_FMK_fnc_createPlayerVehicles;
		[] call BRM_FMK_fnc_readExtraction;
		[] call BRM_FMK_fnc_initPlayer;
		[] call BRM_FMK_fnc_loadBriefing;
	};

	[] call BRM_FMK_OCAP_fnc_init;

	enableSentences false; // Hacky shit to try to stop low FPS
};
