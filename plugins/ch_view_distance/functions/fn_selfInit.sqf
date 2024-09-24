// Load CH View Distance for non-framework missions
if (isNil "BRM_FMK_Engine_missionVersion") then {
	call BRM_FMK_Plugin_CHVD_fnc_postInit;
};
