[
	"ai_spawner",
	[true, [true]], // aiDeathSounds
	[true, [true]], // aiInfiniteAmmo
	[[], [[]], [ // aiSettingsAllMap
		[false, [true]], // caching
		[true, [true]], // death sounds
		[true, [true]], // infinite ammo
		[true, [true]], // garbage collector
		[true, [true]] // debug markers
	]],
	[650, [0]], // cleanUpPlayerRadius
	[1500, [0]], // stalkMaximumDistance
	[[], [[]], [ // garbageCollector
		[90, [0]], // time delete body no players around
		[50, [0]], // distance to keep body with players nearby
		[180, [0]] // maximum time to remove bodies (even if players are around)
	]],
	[[], [[]], [ // garbageCollectorVehicle
		[120, [0]], // time delete wreck no players around
		[100, [0]], // distance to keep wreck with players nearby
		[210, [0]] // maximum time to remove wreck (even if players are around)
	]],
	[650, [0]], // infantryCacheDistance
	[1000, [0]], // vehicleCacheDistance
	[[], [[]]], // spawnerSettings
	[[], [[]]], // waypointSettings
	[[], [[]]], // groupTypes
	[[], [[]]], // aiSkills
	[[], [[]]] // aiSpawners
] call BRM_FMK_fnc_getPluginSettings
