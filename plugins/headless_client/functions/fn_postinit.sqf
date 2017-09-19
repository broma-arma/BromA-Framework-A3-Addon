mission_AI_controller = if (mission_enable_hc) then { !isServer && !hasInterface } else { isServer };
if (mission_AI_controller) then {
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

    if (mission_AI_controller && mission_HC_enabled) then {
        if (isClass(configFile >> "CfgPatches" >> "Werthles_WHK")) then {
            if ((count (nearestObjects [player, ["Werthles_moduleWHM"], 2000])) <= 0) then {
                private _center = createCenter sideLogic;
                private _group = createGroup _center;

                _module = _group createUnit ["Werthles_moduleWHM", [0,0,0],[],0.5,"NONE"];
                _module setVariable ["Advanced", false];
                _module setVariable ["Debug", false];
                _module setVariable ["DebugOnly", false];
                _module setVariable ["Delay", 30];
                _module setVariable ["Ignores", ""];
                _module setVariable ["NoDebug", true];
                _module setVariable ["Pause", 3];
                _module setVariable ["Repeating", true];
                _module setVariable ["Report", true];
                _module setVariable ["Units", -666];
                _module setVariable ["UseServer", false];
                _module setVariable ["Wait", 30];

                [_module] spawn Werthles_fnc_moduleWHM;
            };
        };
    };
},[]] call CBA_fnc_waitUntilAndExecute;
