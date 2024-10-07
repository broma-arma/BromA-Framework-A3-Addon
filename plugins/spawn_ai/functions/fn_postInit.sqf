private _caching = true;
private _distance = 1500;

if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "AI_spawn_enable_caching") then { _caching = AI_spawn_enable_caching; };
	if (!isNil "AI_spawn_cache_distance") then { _distance = AI_spawn_cache_distance; };
} else {
	if (fileExists "mission\settings\plugins\spawn_ai.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\spawn_ai.sqf";
	};
};

BRM_FMK_Plugin_SpawnAI_caching = _caching;
BRM_FMK_Plugin_SpawnAI_cacheDistance = _distance;
