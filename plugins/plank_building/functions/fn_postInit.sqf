private _objectsSideA = [];
private _objectsSideB = [];
private _objectsSideC = [];
private _fortifications = [
	// Action text                          Classname                               Distance        Direction      Direction Range    Code   Delay in seconds to place
	["Small bunker",                        "Land_BagBunker_Small_F",               3,              180,           360,               {},     20],
	["Bunker",                              "Land_BagBunker_Large_F",               8,              180,           60,                {},     35],
	["Wide Sandbag fence",                  "Land_BagFence_Long_F",                 2,              0,             360,               {},     8],
	["H-Barrier watch tower",               "Land_HBarrierTower_F",                 7,              180,           360,               {},     100],
	["Short Sandbag fence",                 "Land_BagFence_Short_F",                2,              0,             360,               {},     4],
	["Razor Wire",                          "Land_Razorwire_F",                     4,              0,             360,               {},     10],
	["Concrete wall long",                  "Land_CncWall4_F",                      8,              0,             360,               {},     60],
	["Bunker Tower",                        "Land_BagBunker_Tower_F",               7,              90,            360,               {},     60]
];
private _counts = [1, 0, 10, 0, 15, 5, 0, 0];
private _countsOfficer = [5, 3, 20, 5, 20, 10, 0, 5];
private _countsFTL = [3, 1, 20, 1, 15, 10, 0, 1];
private _countsSL = [5, 2, 20, 3, 15, 10, 0, 2];
private _countsSpecialist = [25, 15, 100, 25, 100, 50, 0, 25];
private _buildSpeedMultiplier = 1;

if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "plank_objects_side_a") then { _objectsSideA = plank_objects_side_a; };
	if (!isNil "plank_objects_side_b") then { _objectsSideB = plank_objects_side_b; };
	if (!isNil "plank_objects_side_c") then { _objectsSideC = plank_objects_side_c; };
	if (!isNil "plank_deploy_fortData") then { _fortifications = plank_deploy_fortData; };
	if (!isNil "PLANK_Player_Objects") then { _counts = PLANK_Player_Objects; };
	if (!isNil "PLANK_Officer_Objects") then { _countsOfficer = PLANK_Officer_Objects; };
	if (!isNil "PLANK_FTL_Objects") then { _countsFTL = PLANK_FTL_Objects; };
	if (!isNil "PLANK_SL_Objects") then { _countsSL = PLANK_SL_Objects; };
	if (!isNil "PLANK_Specialist_Objects") then { _countsSpecialist = PLANK_Specialist_Objects; };
	if (!isNil "PLANK_FMK_buildSpeed") then { _buildSpeedMultiplier = PLANK_FMK_buildSpeed; };
} else {
	if (fileExists "mission\settings\plugins\plank_building.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\plank_building.sqf";
	};
};

BRM_FMK_Plugin_PlankBuilding_objectsSideA = _objectsSideA;
BRM_FMK_Plugin_PlankBuilding_objectsSideB = _objectsSideB;
BRM_FMK_Plugin_PlankBuilding_objectsSideC = _objectsSideC;
BRM_FMK_Plugin_PlankBuilding_fortifications = _fortifications;
BRM_FMK_Plugin_PlankBuilding_counts = _counts;
BRM_FMK_Plugin_PlankBuilding_countsOfficer = _countsOfficer;
BRM_FMK_Plugin_PlankBuilding_countsFTL = _countsFTL;
BRM_FMK_Plugin_PlankBuilding_countsSL = _countsSL;
BRM_FMK_Plugin_PlankBuilding_countsSpecialist = _countsSpecialist;
BRM_FMK_Plugin_PlankBuilding_buildSpeedMultiplier = _buildSpeedMultiplier;

[{(time > 1)}, {
    plank_isInitialized = false;

    waitUntil {
        !(isNil {BIS_fnc_init} && {BIS_fnc_init});
    };

    [] call BRM_FMK_Plugin_PlankBuilding_fnc_deployFunctions;
    [] call BRM_FMK_Plugin_PlankBuilding_fnc_uiFunctions;
    [] call BRM_FMK_Plugin_PlankBuilding_fnc_apiFunctions;

    plank_isInitialized = true;
}, []] call CBA_fnc_waitUntilAndExecute;

if (hasInterface) then {
	[] call BRM_FMK_Plugin_PlankBuilding_fnc_playerPostInit;
};
