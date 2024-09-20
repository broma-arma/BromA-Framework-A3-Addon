private _enableHC = ["p_enable_hc", 0] call BIS_fnc_getParamValue == 1; // 0="Disabled", 1="Enabled"

mission_AI_controller = if (_enableHC) then { !didJIP && !isServer && !hasInterface } else { isServer };

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

	/*if (isServer && mission_HC_enabled) then {
		if (isClass (configFile >> "CfgPatches" >> "Werthles_WHK")) then {
			if ((count (nearestObjects [player, ["Werthles_moduleWHM"], 10000])) <= 0) then {
				private _group = createGroup sideLogic;

				WHMModule = _group createUnit ["Werthles_moduleWHM", [0,0,0],[],0.5,"NONE"];
				publicVariable "WHMModule";

				WHMModule setVariable ["Advanced", false, true];
				WHMModule setVariable ["Debug", false, true];
				WHMModule setVariable ["DebugOnly", false, true];
				WHMModule setVariable ["Delay", 30, true];
				WHMModule setVariable ["Ignores", "", true];
				WHMModule setVariable ["NoDebug", true, true];
				WHMModule setVariable ["Pause", 3, true];
				WHMModule setVariable ["Repeating", true, true];
				WHMModule setVariable ["Report", true, true];
				WHMModule setVariable ["Units", -666, true];
				WHMModule setVariable ["UseServer", false, true];
				WHMModule setVariable ["Wait", 30, true];

				WHMModule synchronizeObjectsAdd [Headless_Client];

				[WHMModule] remoteExec ["Werthles_fnc_moduleWHM", Headless_Client];
			};
		};
	};*/
},[]] call CBA_fnc_waitUntilAndExecute;
