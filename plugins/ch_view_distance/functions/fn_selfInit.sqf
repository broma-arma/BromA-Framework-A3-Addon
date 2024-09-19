// Load CH View Distance for non-framework missions
if (isNil "pluginsLoaded") then {
	pluginsLoaded = true;
	call BRM_FMK_Plugin_CHVD_fnc_postInit;
};
