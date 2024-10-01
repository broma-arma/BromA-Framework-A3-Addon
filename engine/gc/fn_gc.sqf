/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_gc

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Start garbage collection.

PARAMETERS:
    None.

USAGE:
    call BRM_FMK_Engine_fnc_gc;

RETURNS:
    Nothing.

================================================================================
*/

if (!isServer || !isNil "BRM_FMK_Engine_fnc_gc_queue") exitWith {};

private _corpseManagerMode = getMissionConfigValue ["CorpseManagerMode", parseNumber isMultiplayer * 2];
if (_corpseManagerMode == /*All*/1 || _corpseManagerMode == /*Non-respawnable*/3) exitWith {};

BRM_FMK_Engine_fnc_gc_distanceSqr = 50 ^ 2; // Distance squared, in meters, that a player has to be from an object for it to be cleaned up.
BRM_FMK_Engine_fnc_gc_limit = 10; // Limit of queue size needed for objects to be cleaned up after time.
BRM_FMK_Engine_fnc_gc_time = 120; // Time, in seconds, for objects to be cleaned up, when queue size is greater than limit.
BRM_FMK_Engine_fnc_gc_maxLimit = 30; // Maximum limit of queue size for distance to be ignored.
BRM_FMK_Engine_fnc_gc_maxTime = 300; // Time, in seconds, for objects to be cleaned up, when queue size is less than or equal to limit.

// Same as above, but for vehicles
BRM_FMK_Engine_fnc_gc_distanceSqrVehicle = 100 ^ 2;
BRM_FMK_Engine_fnc_gc_limitVehicle = 5;
BRM_FMK_Engine_fnc_gc_timeVehicle = 300;
BRM_FMK_Engine_fnc_gc_maxLimitVehicle = 15;
BRM_FMK_Engine_fnc_gc_maxTimeVehicle = 600;

BRM_FMK_Engine_fnc_gc_queue = [];
BRM_FMK_Engine_fnc_gc_queueVehicle = [];

addMissionEventHandler ["EntityKilled", {
	params ["_killed"];

	[BRM_FMK_Engine_fnc_gc_queueVehicle, BRM_FMK_Engine_fnc_gc_queue] select (_killed isKindOf "CAManBase") pushBack [time, _killed];
}];

[{
	if (isGamePaused) exitWith {};

	[
		BRM_FMK_Engine_fnc_gc_queue, { hideBody _this }, BRM_FMK_Engine_fnc_gc_distanceSqr,
		BRM_FMK_Engine_fnc_gc_limit, BRM_FMK_Engine_fnc_gc_time,
		BRM_FMK_Engine_fnc_gc_maxLimit, BRM_FMK_Engine_fnc_gc_maxTime
	] call BRM_FMK_Engine_fnc_gcProcess;

	[
		BRM_FMK_Engine_fnc_gc_queueVehicle, { deleteVehicle _this }, BRM_FMK_Engine_fnc_gc_distanceSqrVehicle,
		BRM_FMK_Engine_fnc_gc_limitVehicle, BRM_FMK_Engine_fnc_gc_timeVehicle,
		BRM_FMK_Engine_fnc_gc_maxLimitVehicle, BRM_FMK_Engine_fnc_gc_maxTimeVehicle
	] call BRM_FMK_Engine_fnc_gcProcess;
}, 1] call CBA_fnc_addPerFrameHandler;
