#include "script_component.hpp"
[{(time > 1)}, {
	if (fileExists "settings\plugins\plank_building.sqf") then {
		call compile preprocessFileLineNumbers "settings\plugins\plank_building.sqf" params ["_speed", "_objects", "_fortifications"];

		PLANK_FMK_buildSpeed = _speed;

		_objects params ["_objectsA", "_objectsB", "_objectsC"];
		plank_objects_side_a = _objectsA;
		plank_objects_side_b = _objectsB;
		plank_objects_side_c = _objectsC;

		PLANK_Player_Objects = [];
		PLANK_Officer_Objects = [];
		PLANK_SL_Objects = [];
		PLANK_FTL_Objects = [];
		PLANK_Specialist_Objects = [];
		plank_deploy_fortData = [];

		{
			plank_deploy_fortData pushBack (_x select [0, 7]);
			_x select 7 params ["_other", "_officer", "_squadLeader", "_teamLeader", "_repairSpecialist"];
			PLANK_Player_Objects pushBack _other;
			PLANK_Officer_Objects pushBack _officer;
			PLANK_SL_Objects pushBack _squadLeader;
			PLANK_FTL_Objects pushBack _teamLeader;
			PLANK_Specialist_Objects pushBack _repairSpecialist;
		} forEach _fortifications;
	};

	if (isNil "plank_objects_side_a") then { plank_objects_side_a = []; };
	if (isNil "plank_objects_side_b") then { plank_objects_side_b = []; };
	if (isNil "plank_objects_side_c") then { plank_objects_side_c = []; };

	if (isNil "PLANK_Player_Objects") then { PLANK_Player_Objects = [1,0,10,0,15,5,0,0]; };
	if (isNil "PLANK_Officer_Objects") then { PLANK_Officer_Objects = [5,3,20,5,20,10,0,5]; };
	if (isNil "PLANK_FTL_Objects") then { PLANK_FTL_Objects = [3,1,20,1,15,10,0,1]; };
	if (isNil "PLANK_SL_Objects") then { PLANK_SL_Objects = [5,2,20,3,15,10,0,2]; };
	if (isNil "PLANK_Specialist_Objects") then { PLANK_Specialist_Objects = [25,15,100,25,100,50,0,25]; };

	if (isNil "PLANK_FMK_buildSpeed") then { PLANK_FMK_buildSpeed = 1; };

	if (isNil "plank_deploy_fortData") then {
		plank_deploy_fortData = [
			["Small bunker", "Land_BagBunker_Small_F", 3, 180, 360, {}, 20],
			["Bunker", "Land_BagBunker_Large_F", 8, 180, 60, {}, 35],
			["Wide Sandbag fence", "Land_BagFence_Long_F", 2, 0, 360, {}, 8],
			["H-Barrier watch tower", "Land_HBarrierTower_F", 7, 180, 360, {}, 100],
			["Short Sandbag fence", "Land_BagFence_Short_F", 2, 0, 360, {}, 4],
			["Razor Wire", "Land_Razorwire_F", 4, 0, 360, {}, 10],
			["Concrete wall long", "Land_CncWall4_F", 8, 0, 360, {}, 60],
			["Bunker Tower", "Land_BagBunker_Tower_F", 7, 90, 360, {}, 60]
		];
	};

	plank_isInitialized = false;

	waitUntil {
		!(isNil {BIS_fnc_init} && {BIS_fnc_init});
	};

	[] call FUNC(deployFunctions);
	[] call FUNC(uiFunctions);
	[] call FUNC(apiFunctions);

	plank_isInitialized = true;
}, []] call CBA_fnc_waitUntilAndExecute;
