if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	_this call compile preprocessFileLineNumbers "dac\dac_config_creator.sqf";
};

scalar = "any";
DAC_Init_Camps = 0;

waitUntil { !isNil "mission_AI_controller" };

if (isNil "BRM_FMK_DAC_cfgCreator") then {
	BRM_FMK_DAC_cfgCreator = if (fileExists "dac\dac_config_creator.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_creator.sqf" } else { {} };
};
call BRM_FMK_DAC_cfgCreator;

DAC_Code = [parseNumber didJIP + 2, parseNumber (hasInterface || !isServer)] select mission_AI_controller;

{
	_x params ["_var", "_default"];
	if (isNil _var) then { missionNamespace setVariable [_var, _default]; };
} forEach [
	["DAC_STRPlayers",     ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10"]],
	["DAC_AI_Count_Level", [[2, 4], [3, 6], [4, 8], [6, 12], [1, 0]]],
	["DAC_Dyn_Weather",    [0, 0, 0, [0, 0, 0], 0]],
	["DAC_Reduce_Value",   [800, 850, 0.3]],
	["DAC_AI_Spawn",       [[10, 5, 5], [10, 5, 15], 0, 120, 250, 0]],
	["DAC_Delete_Value",   [[180, 150], [180, 150], 6000]],
	["DAC_Del_PlayerBody", [0, 0]],
	["DAC_Com_Values",     [[1, 2, 3, 0], [0, 0, 0, 0]] select isMultiplayer],
	["DAC_AI_AddOn",       1],
	["DAC_AI_Level",       3],
	["DAC_Res_Side",       0],
	["DAC_Marker",         [1, 0] select isMultiplayer],
	["DAC_WP_Speed",       0.01],
	["DAC_Join_Action",    false],
	["DAC_Fast_Init",      true],
	["DAC_Player_Marker",  false],
	["DAC_Direct_Start",   false],
	["DAC_Activate_Sound", false],
	["DAC_Auto_UnitCount", [20, 10]],
	["DAC_Player_Support", [10, [4, 2000, 3, 1000]]],
	["DAC_SaveDistance",   [500, ["DAC_Save_Pos"]]],

	["DAC_BadBuildings",   []],
	["DAC_GunNotAllowed",  []],
	["DAC_VehNotAllowed",  []],
	["DAC_Locked_Veh",     []],

	["DAC_Data_Array",     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, []]],
	["DAC_Marker_Val",     []],
	["DAC_Zones",          []],
	["DAC_SP_Soldiers",    [
		"B_soldier_AR_F", "B_G_Soldier_AR_F", "B_T_Soldier_AR_F", "B_CTRG_Soldier_AR_tna_F", "B_Patrol_Soldier_AR_F", "B_W_Soldier_AR_F", "B_W_Soldier_AR_EMP_F",
		"O_Soldier_AR_F", "O_soldierU_AR_F", "O_G_Soldier_AR_F", "O_T_Soldier_AR_F", "O_R_Soldier_AR_F", "O_R_recon_AR_F", "O_R_Patrol_Soldier_AR_F", "O_R_Patrol_Soldier_AR2_F",
		"I_Soldier_AR_F", "I_G_Soldier_AR_F", "I_E_Soldier_AR_F", "I_E_Soldier_AR_EMP_F"
	]]
];
if (isNil "DAC_Radio_Max") then { DAC_Radio_Max = DAC_AI_Level; };

_scr = [] spawn (compile preprocessFile "\DAC_Source\Scripts\DAC_Start_Creator.sqf");
waituntil {scriptDone _scr};
sleep 0.1;
waitUntil {(DAC_Basic_Value > 0)};
