#include "component.hpp"

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
//        if (isClass(configFile >> "CfgPatches" >> "Werthles_WHK")) then {
//            if ((count (nearestObjects [player, ["Werthles_moduleWHM"], 10000])) <= 0) then {
//                private _group = createGroup sideLogic;
//
//                WHMModule = _group createUnit ["Werthles_moduleWHM", [0,0,0],[],0.5,"NONE"];
//                publicVariable "WHMModule";
//
//                WHMModule setVariable ["Advanced", false, true]; // Advanced balancing - Advanced balances units on HCs, simple alternates HCs <BOOL:true>
//                WHMModule setVariable ["Debug", false, true]; // Access to debug for all - Allow everyone to view debug mode, or just admins <BOOL:false>
//                WHMModule setVariable ["DebugOnly", false, true]; // Debug only - Only the WHM debug locality counts will be functional <BOOL:false>
//                WHMModule setVariable ["Delay", 30, true]; // Start delay - Time (seconds) to wait before beginning checks <NUMBER:30>
//                WHMModule setVariable ["Ignores", "", true]; // Units to be ignored - Any whole/part unit/group/synced-module name/type not for HCs. Separate with commas, e.g.: BRAVOSQUAD,man,B_Heli_,enemygroupnumber <STRING:>
//                WHMModule setVariable ["NoDebug", true, true]; // Debug - When disabled, players cannot gain access to debug! <BOOL:true>
//                WHMModule setVariable ["Pause", 3, true]; // Syncing pause - Time (seconds) between each group being transferred to HC control; fast setup risks errors <NUMBER:3>
//                WHMModule setVariable ["Repeating", true, true]; // Recurrent AI checks - Repeated checks for non-HC controlled units, or a one time check <BOOL:true>
//                WHMModule setVariable ["Report", true, true]; // Setup report - Shows report after initial HC transfers <BOOL:true>
//                WHMModule setVariable ["Units", -666, true]; // HCs to be used - Synchronise HCs for WHM use. No syncs - all HC used. HCs MUST connect BEFORE loading to briefing/module activation! <?:-666>
//                WHMModule setVariable ["UseServer", false, true]; // Put AI on server - Splits AI among the server as well as HCs <BOOL:false>
//                WHMModule setVariable ["Wait", 30, true]; // Time between repeats - How often WHK should begin checks for non-HC controlled units <NUMBER:30>
//
//                WHMModule synchronizeObjectsAdd [Headless_Client];
//
//                [WHMModule] remoteExec ["Werthles_fnc_moduleWHM", Headless_Client];
//            };
//        };
    };
},[]] call CBA_fnc_waitUntilAndExecute;
