private _enableHC = ["p_enable_hc", 2] call BIS_fnc_getParamValue; // 0="Disabled", 1="Enabled", 2="Auto"

_enableHC = if (_enableHC == 2) then { entities "HeadlessClient_F" findIf { isPlayer _x } != -1; } else { _enableHC > 0 };

mission_AI_controller = if (_enableHC) then { !didJIP && !isServer && !hasInterface } else { isServer };

if (mission_AI_controller) then {
	private _name = [[str player, name player] select hasInterface, "SERVER"] select isServer;
	["CLIENTS", "CHAT", format ["AI Controller is currently enabled as %1.", _name]] call BRM_FMK_fnc_doLog;
};
