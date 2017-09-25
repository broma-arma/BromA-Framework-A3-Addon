mission_AI_controller = if (mission_enable_hc) then { !isServer && !hasInterface } else { isServer };

if (mission_AI_controller && !isServer && !hasInterface) then {
    mission_HC_enabled = true;
    publicVariable "mission_HC_enabled";
};

if (mission_AI_controller) then {
    if (isServer) then { mission_AI_controller_name = "SERVER" }
    else {
        if (hasInterface) then {
            mission_AI_controller_name = (name player);
        } else {
            mission_AI_controller_name = player;
        };
    };
    publicVariable "mission_AI_controller_name";
};

[{!(isNil "mission_AI_controller_name")}, {
    ["LOCAL","CHAT", format ["AI Controller is currently enabled as %1.", mission_AI_controller_name]] call BRM_FMK_fnc_doLog;

    if (isServer && mission_HC_enabled) then {
        if (isClass(configFile >> "CfgPatches" >> "Werthles_WHK")) then {
            if ((count (nearestObjects [player, ["Werthles_moduleWHM"], 10000])) <= 0) then {
                private _center = createCenter sideLogic;
                private _group = createGroup _center;

                WHMModule = _group createUnit ["Werthles_moduleWHM", [0,0,0],[],0.5,"NONE"];
                WHMModule setVariable ["Advanced", false];
                WHMModule setVariable ["Debug", false];
                WHMModule setVariable ["DebugOnly", false];
                WHMModule setVariable ["Delay", 30];
                WHMModule setVariable ["Ignores", ""];
                WHMModule setVariable ["NoDebug", true];
                WHMModule setVariable ["Pause", 3];
                WHMModule setVariable ["Repeating", true];
                WHMModule setVariable ["Report", true];
                WHMModule setVariable ["Units", -666];
                WHMModule setVariable ["UseServer", false];
                WHMModule setVariable ["Wait", 30];

                WHMModule synchronizeObjectsAdd [Headless_Client];

                publicVariable "WHMModule";

                [WHMModule] remoteExec ["Werthles_fnc_moduleWHM", Headless_Client];
            };
        };
    };
},[]] call CBA_fnc_waitUntilAndExecute;
