#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_getSpawnerSettings

Description:
	Get spawner settings.

Parameters:
	_settings - Setting ID [STRING/ARRAY]

Returns:
	Settings, nil if setting doesn't exist [ARRAY/NIL]
		_cleanup - minimum distance from players to delete AI, when spawner is deleted. -1 to never delete, 0 to instant delete [NUMBER]
		_safeSpawnDistance - minimum distance from players to allow spawning [NUMBER]
		_disableLAMBS - disable LAMBS [BOOLEAN]
		_aiAggressive - disable suppresion and autocombat and make ai keep moving charge position [BOOLEAN]
		_cachingDistances - Unit cache distances, false to disable caching [ARRAY/BOOLEAN]
			_infantryDistance - Not in a vehicle, false to disable caching [NUMBER/BOOLEAN]
			_vehicleDistance - In a vehicle, false to disable caching [NUMBER/BOOLEAN]
		_aiSkill - AI Skills setting [STRING]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_id"];

if (_id isEqualType []) exitWith { _id };

BRM_FMK_Plugin_AIS_spawnerSettings get _id
// [ID, [cleanup ai when deactivated, minimum player distance to allow spawning, disable LAMBS, disable suppresion, [infantry cache distance (-1 to use global setting, 0 to disable), vehicle cache distance (-1 to use global setting, 0 to disable)], AI Skills setting]
//["DEFAULT", [true, 150, false, false, [-1, -1], "REGULAR"]],
