if !(isClass(configFile >> "CfgPatches" >> "OCAP")) exitWith {};

if (isServer) then { [] call OCAP_fnc_exportData };