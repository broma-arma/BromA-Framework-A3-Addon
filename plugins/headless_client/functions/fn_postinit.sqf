private _enableHC = ["p_enable_hc", 2] call BIS_fnc_getParamValue; // 0="Disabled", 1="Enabled", 2="Auto"

if (_enableHC == 2) then {
	_enableHC = parseNumber (entities "HeadlessClient_F" findIf { isPlayer _x } != -1);
};

mission_AI_controller = if (_enableHC) then { !didJIP && !isServer && !hasInterface } else { isServer };

if (mission_AI_controller) then {
	private _name = [[str player, name player] select hasInterface, "SERVER"] select isServer;
	["CLIENTS", "CHAT", format ["AI Controller is currently enabled as %1.", _name]] call BRM_FMK_fnc_doLog;
};
