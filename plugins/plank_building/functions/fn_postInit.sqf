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
