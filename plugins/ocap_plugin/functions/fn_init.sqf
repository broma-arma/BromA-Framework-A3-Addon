if !(isClass(configFile >> "CfgPatches" >> "OCAP")) exitWith {};
if !(isServer) exitWith {};

0 spawn {
    sleep 1;

    if (isNil "mission_running") then { mission_running = true };

    waitUntil
    {
        sleep 5;
        !(mission_running)
    };

    // Runs the OCAP exporter to save the mission.
    [] call BRM_FMK_OCAP_fnc_end;
};