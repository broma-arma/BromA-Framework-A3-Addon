if (!mission_AI_controller) exitWith {};

["BRM_FMK_aiControllerInit", {
	[] call ([] call BRM_FMK_DAC_fnc_getSettings select 0);
}] call CBA_fnc_addEventHandler;

private _aiSkill = ["p_ai_level", 3] call BIS_fnc_getParamValue;

DAC_AI_Level = _aiSkill + 1;

mission_DAC_AI_skill = switch (_aiSkill) do {
	case 0: { [0.2, 0.3] }; // Very Low
	case 1: { [0.4, 0.5] }; // Low
	case 2: { [0.6, 0.7] }; // Medium
	case 3: { [0.8, 0.9] }; // High
	default { [0.5, 0.5] };
};

if (isNil "BRM_FMK_DAC_strToNum_factions") then {
	BRM_FMK_DAC_strToNum_factions = ["AUTO", "VANILLA"];
};

waitUntil { !isNil "DAC_STRPlayers" };

// \DAC_Source\Init_Extern.sqf
DAC_Basic_Value = 0;

DAC_Zone 		= compile preprocessFile "\DAC_Source\Scripts\DAC_Init_Zone.sqf";
DAC_Objects		= compile preprocessFile "\DAC_Source\Scripts\DAC_Create_Objects.sqf";
DAC_Activate 	= compile preprocessFile "\DAC_Source\Scripts\DAC_Activate_Zone.sqf";
DAC_Deactivate 	= compile preprocessFile "\DAC_Source\Scripts\DAC_Deactivate_Zone.sqf";
DAC_Weapons 	= compile preprocessFile "\DAC_Source\Scripts\DAC_Change_Weapons.sqf";

DAC_Path = "\broma_framework\plugins\dac_plugin\config\";
_scr = [] spawn (compile preprocessFile "\DAC_Source\Scripts\DAC_Preprocess.sqf");
waituntil {scriptdone _scr};
[] execVM DAC_Path + "DAC_Config_Creator.sqf";
