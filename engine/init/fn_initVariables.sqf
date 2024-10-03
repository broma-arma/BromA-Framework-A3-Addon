/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_initVariables

AUTHOR(s):
    Nife

DESCRIPTION:
    Initializes all environment variables related to the Framework, such as
    units, groups, object arrays and settings.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_Engine_fnc_initVariables;

RETURNS:
    Nothing.

================================================================================
*/

{
	_x params ["_var", "_default"];
	if (isNil _var) then {
		missionNamespace setVariable [_var, call _default];
	};
} forEach [
	["mission_running", { true }],

	//["mission_AI_controller", { false }],

	["BRM_FMK_frameworkMission",   { true }],
	["BRM_FMK_initialized",        { false }],
	["BRM_FMK_Engine_initialized", { false }],
	["pluginsLoaded", { false }], // Backward compatibility, use BRM_FMK_initialized event or var instead (Used by dac_config_creator in missions)

	["mission_AGM_enabled",   { isClass (configFile >> "CfgPatches" >> "AGM_CORE") }], // Backward compatibility
	["mission_ACE3_enabled",  { isClass (configFile >> "CfgPatches" >> "ACE_COMMON") }],
	["mission_TFAR_enabled",  { isClass (configFile >> "CfgPatches" >> "task_force_radio") }],
	["mission_ACRE2_enabled", { isClass (configFile >> "CfgPatches" >> "acre_api") }],

	// Task System
	["BRM_FMK_Engine_tasks", { [] }],
	["BRM_FMK_Engine_taskData", { createHashMap }]
];

// Initialize all possible groups and playable units whether they exist or not.
{
	private _side = _x;
	{
		_x params ["_group", "_unitCount"];
		private _groupVar = format ["%1_%2", _side, _group];
		if (isNil _groupVar) then {
			missionNamespace setVariable [_groupVar, grpNull];
		};

		for "_i" from 1 to _unitCount do {
			private _unitVar = format ["%1_%2", _groupVar, _i];
			if (isNil _unitVar) then {
				missionNamespace setVariable [_unitVar, objNull];
			};
		};
	} forEach [
		["0_0", 3],
		["1_0", 3], ["1_1", 4], ["1_2", 4],
		["2_0", 3], ["2_1", 4], ["2_2", 4],
		["3_0", 3], ["3_1", 4], ["3_2", 4],
		["4_0", 3], ["4_1", 4], ["4_2", 4],
		["5_0", 4],
		["6_0", 4],
		["7_0", 4],
		["8_0", 3],
		["9_0", 2],
		["10_1", 2],
		["11_1", 3],
		["12_1", 4],
		["13_1", 5],
		["14_1", 2], ["14_2", 2]
	];
} forEach [
	"blu",
	"op",
	"ind"
];
