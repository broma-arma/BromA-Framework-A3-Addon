#include "script_component.hpp"
// TODO AI scripts executed on server, AI spawned on or transferred to HC?
if (isServer) then {
	private _headlessClient = entities "HeadlessClient_F" select 0;
	if (isNil "_headlessClient" || { !isPlayer _headlessClient }) then {
		mission_AI_controller = true;
		["CLIENTS", "CHAT", format ["AI Controller: %1", if (hasInterface) then { name player } else { "SERVER" }]] call FUNCMAIN(doLog);
	/*} else {
		if (isClass (configFile >> "CfgPatches" >> "Werthles_WHK") && { count entities "Werthles_moduleWHM" == 0 }) then {
			private _module = createGroup sideLogic createUnit ["Werthles_moduleWHM", [0, 0, 0], [], 0.5, "NONE"];
			private _module setVariable ["Advanced", false, true];
			private _module setVariable ["Debug", false, true];
			private _module setVariable ["DebugOnly", false, true];
			private _module setVariable ["Delay", 30, true];
			private _module setVariable ["Ignores", "", true];
			private _module setVariable ["NoDebug", true, true];
			private _module setVariable ["Pause", 3, true];
			private _module setVariable ["Repeating", true, true];
			private _module setVariable ["Report", true, true];
			private _module setVariable ["Units", -666, true];
			private _module setVariable ["UseServer", false, true];
			private _module setVariable ["Wait", 30, true];

			_module synchronizeObjectsAdd [_headlessClient];

			[_module] remoteExec ["Werthles_fnc_moduleWHM", _headlessClient];
		};*/
	};
} else {
	if (!hasInterface && !didJIP) then {
		mission_AI_controller = true;
		["CLIENTS", "CHAT", format ["AI Controller: %1", if (hasInterface) then { name player } else { "SERVER" }]] call FUNCMAIN(doLog);
	};
};
