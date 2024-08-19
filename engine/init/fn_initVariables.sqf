/*
================================================================================

NAME:
    BRM_FMK_fnc_initVariables

AUTHOR(s):
    Nife

DESCRIPTION:
    Initializes all environment variables related to the Framework, such as
    units, groups, object arrays and settings.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_fnc_initVariables;

RETURNS:
    Nothing.

================================================================================
*/

{
	_x params ["_var", "_default"];
	if (isNil _var) then { missionNamespace setVariable [_var, _default]; };
} forEach [
	["mission_dead_west",        0],
	["mission_dead_east",        0],
	["mission_dead_independent", 0],
	["mission_dead_civilian",    0],

	["mission_players_A", []],
	["mission_players_B", []],
	["mission_players_C", []],

	["mission_dead_side_A", 0],
	["mission_dead_side_B", 0],
	["mission_dead_side_C", 0],

	["mission_running", true],

	["mission_AI_controller", false],
	["mission_HC_enabled",    false],

	["BRM_FRAMEWORK_ADDON", "BRM_FRAMEWORK"],

	["mission_AGM_enabled",   isClass (configFile >> "CfgPatches" >> "AGM_CORE")], // Backward compatibility
	["mission_ACE3_enabled",  isClass (configFile >> "CfgPatches" >> "ACE_COMMON")],
	["mission_TFAR_enabled",  isClass (configFile >> "CfgPatches" >> "task_force_radio")],
	["mission_ACRE2_enabled", isClass (configFile >> "CfgPatches" >> "acre_api")]
];

// ============================================================================
//         Initializes all playable units whether they exist or not.           |
// ============================================================================

{ if (isNil _x) then { missionNamespace setVariable [_x, objNull]; }; } forEach [
	"blu_0_0_1", "blu_0_0_2", "blu_0_0_3",
	"blu_1_0_1", "blu_1_0_2", "blu_1_0_3",
		"blu_1_1_1", "blu_1_1_2", "blu_1_1_3", "blu_1_1_4",
		"blu_1_2_1", "blu_1_2_2", "blu_1_2_3", "blu_1_2_4",
	"blu_2_0_1", "blu_2_0_2", "blu_2_0_3",
		"blu_2_1_1", "blu_2_1_2", "blu_2_1_3", "blu_2_1_4",
		"blu_2_2_1", "blu_2_2_2", "blu_2_2_3", "blu_2_2_4",
	"blu_3_0_1", "blu_3_0_2", "blu_3_0_3",
		"blu_3_1_1", "blu_3_1_2", "blu_3_1_3", "blu_3_1_4",
		"blu_3_2_1", "blu_3_2_2", "blu_3_2_3", "blu_3_2_4",
	"blu_4_0_1", "blu_4_0_2", "blu_4_0_3",
		"blu_4_1_1", "blu_4_1_2", "blu_4_1_3", "blu_4_1_4",
		"blu_4_2_1", "blu_4_2_2", "blu_4_2_3", "blu_4_2_4",
	"blu_5_0_1", "blu_5_0_2", "blu_5_0_3", "blu_5_0_4",
	"blu_6_0_1", "blu_6_0_2", "blu_6_0_3", "blu_6_0_4",
	"blu_7_0_1", "blu_7_0_2", "blu_7_0_3", "blu_7_0_4",
	"blu_8_0_1", "blu_8_0_2", "blu_8_0_3",
	"blu_9_0_1", "blu_9_0_2",
	"blu_10_1_1", "blu_10_1_2",
	"blu_11_1_1", "blu_11_1_2", "blu_11_1_3",
	"blu_12_1_1", "blu_12_1_2", "blu_12_1_3", "blu_12_1_4",
	"blu_13_1_1", "blu_13_1_2", "blu_13_1_3", "blu_13_1_4", "blu_13_1_5",
	"blu_14_1_1", "blu_14_1_2",
		"blu_14_2_1", "blu_14_2_2",

	"op_0_0_1", "op_0_0_2", "op_0_0_3",
	"op_1_0_1", "op_1_0_2", "op_1_0_3",
		"op_1_1_1", "op_1_1_2", "op_1_1_3", "op_1_1_4",
		"op_1_2_1", "op_1_2_2", "op_1_2_3", "op_1_2_4",
	"op_2_0_1", "op_2_0_2", "op_2_0_3",
		"op_2_1_1", "op_2_1_2", "op_2_1_3", "op_2_1_4",
		"op_2_2_1", "op_2_2_2", "op_2_2_3", "op_2_2_4",
	"op_3_0_1", "op_3_0_2", "op_3_0_3",
		"op_3_1_1", "op_3_1_2", "op_3_1_3", "op_3_1_4",
		"op_3_2_1", "op_3_2_2", "op_3_2_3", "op_3_2_4",
	"op_4_0_1", "op_4_0_2", "op_4_0_3",
		"op_4_1_1", "op_4_1_2", "op_4_1_3", "op_4_1_4",
		"op_4_2_1", "op_4_2_2", "op_4_2_3", "op_4_2_4",
	"op_5_0_1", "op_5_0_2", "op_5_0_3", "op_5_0_4",
	"op_6_0_1", "op_6_0_2", "op_6_0_3", "op_6_0_4",
	"op_7_0_1", "op_7_0_2", "op_7_0_3", "op_7_0_4",
	"op_8_0_1", "op_8_0_2", "op_8_0_3",
	"op_9_0_1", "op_9_0_2",
	"op_10_1_1", "op_10_1_2",
	"op_11_1_1", "op_11_1_2", "op_11_1_3",
	"op_12_1_1", "op_12_1_2", "op_12_1_3", "op_12_1_4",
	"op_13_1_1", "op_13_1_2", "op_13_1_3", "op_13_1_4", "op_13_1_5",
	"op_14_1_1", "op_14_1_2",
		"op_14_2_1", "op_14_2_2",

	"ind_0_0_1", "ind_0_0_2", "ind_0_0_3",
	"ind_1_0_1", "ind_1_0_2", "ind_1_0_3",
		"ind_1_1_1", "ind_1_1_2", "ind_1_1_3", "ind_1_1_4",
		"ind_1_2_1", "ind_1_2_2", "ind_1_2_3", "ind_1_2_4",
	"ind_2_0_1", "ind_2_0_2", "ind_2_0_3",
		"ind_2_1_1", "ind_2_1_2", "ind_2_1_3", "ind_2_1_4",
		"ind_2_2_1", "ind_2_2_2", "ind_2_2_3", "ind_2_2_4",
	"ind_3_0_1", "ind_3_0_2", "ind_3_0_3",
		"ind_3_1_1", "ind_3_1_2", "ind_3_1_3", "ind_3_1_4",
		"ind_3_2_1", "ind_3_2_2", "ind_3_2_3", "ind_3_2_4",
	"ind_4_0_1", "ind_4_0_2", "ind_4_0_3",
		"ind_4_1_1", "ind_4_1_2", "ind_4_1_3", "ind_4_1_4",
		"ind_4_2_1", "ind_4_2_2", "ind_4_2_3", "ind_4_2_4",
	"ind_5_0_1", "ind_5_0_2", "ind_5_0_3", "ind_5_0_4",
	"ind_6_0_1", "ind_6_0_2", "ind_6_0_3", "ind_6_0_4",
	"ind_7_0_1", "ind_7_0_2", "ind_7_0_3", "ind_7_0_4",
	"ind_8_0_1", "ind_8_0_2", "ind_8_0_3",
	"ind_9_0_1", "ind_9_0_2",
	"ind_10_1_1", "ind_10_1_2",
	"ind_11_1_1", "ind_11_1_2", "ind_11_1_3",
	"ind_12_1_1", "ind_12_1_2", "ind_12_1_3", "ind_12_1_4",
	"ind_13_1_1", "ind_13_1_2", "ind_13_1_3", "ind_13_1_4", "ind_13_1_5",
	"ind_14_1_1", "ind_14_1_2",
		"ind_14_2_1", "ind_14_2_2"
];

// ============================================================================
//          Initializes all possible groups whether they exist or not.         |
// ============================================================================

{ if (isNil _x) then { missionNamespace setVariable [_x, grpNull]; }; } forEach [
	"blu_0_0",
	"blu_1_0", "blu_1_1", "blu_1_2",
	"blu_2_0", "blu_2_1", "blu_2_2",
	"blu_3_0", "blu_3_1", "blu_3_2",
	"blu_4_0", "blu_4_1", "blu_4_2",
	"blu_5_0",
	"blu_6_0",
	"blu_7_0",
	"blu_8_0",
	"blu_9_0",
	"blu_10_1",
	"blu_11_1",
	"blu_12_1",
	"blu_13_1",
	"blu_14_1", "blu_14_2",

	"op_0_0",
	"op_1_0", "op_1_1", "op_1_2",
	"op_2_0", "op_2_1", "op_2_2",
	"op_3_0", "op_3_1", "op_3_2",
	"op_4_0", "op_4_1", "op_4_2",
	"op_5_0",
	"op_6_0",
	"op_7_0",
	"op_8_0",
	"op_9_0",
	"op_10_1",
	"op_11_1",
	"op_12_1",
	"op_13_1",
	"op_14_1", "op_14_2",

	"ind_0_0",
	"ind_1_0", "ind_1_1", "ind_1_2",
	"ind_2_0", "ind_2_1", "ind_2_2",
	"ind_3_0", "ind_3_1", "ind_3_2",
	"ind_4_0", "ind_4_1", "ind_4_2",
	"ind_5_0",
	"ind_6_0",
	"ind_7_0",
	"ind_8_0",
	"ind_9_0",
	"ind_10_1",
	"ind_11_1",
	"ind_12_1",
	"ind_13_1",
	"ind_14_1", "ind_14_2"
];

// =============================================================================
