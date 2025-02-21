/*
================================================================================

NAME:
    BRM_FMK_fnc_doLog

AUTHOR(s):
    Nife

DESCRIPTION:
    Logs or displays any desired value, targeting any desired environment.

PARAMETERS:
    0 - Scope or environment where the argument will be logged: "SERVER_ONLY", "CLIENT_ONLY", "LOCAL", "SERVER", "CLIENTS", "ALL" (STRING)
    1 - The type of logging: "HINT", "CHAT", "LOG", "DEBUG" (CHAT + LOG), "F_LOG" (STRING)
    2 - The value or format args to be logged. (ANY)
    3 - Condition for the logging to happen. (BOOL)

USAGE:
    ["ALL", "HINT", "Loaded the message!"] call BRM_FMK_fnc_doLog;
    ["LOCAL", "LOG", name player] call BRM_FMK_fnc_doLog;
    ["SERVER", "F_LOG", "All events initialized."] call BRM_FMK_fnc_doLog;
    ["LOCAL", "LOG", ["Hello %1!", name player]] call BRM_FMK_fnc_doLog;
    ["LOCAL", "CHAT", "Debug mode is on!", DEBUG_MODE] call BRM_FMK_fnc_doLog;

RETURNS:
    Nothing.

================================================================================
*/

params ["_scope", "_type", "_msg", ["_cond", true]];

if (!_cond || (_scope == "SERVER_ONLY" && !isServer) || (_scope == "CLIENT_ONLY" && isDedicated)) exitWith {};

private _target = switch (toUpper _scope) do {
	case "SERVER_ONLY";
	case "CLIENT_ONLY";
	case "LOCAL"  : { 1 };
	case "SERVER" : { if (isServer) then { 1 } else { 2 } };
	case "CLIENTS";
	case "ALL"    : { 0 };
	default       { 1 };
};

if (_msg isEqualType [] && { count _msg > 0 && { _msg#0 isEqualType "" }}) then { _msg = format _msg; };

if !(_msg isEqualType "") then { _msg = str _msg };

if (_target == 1) then {
	switch (toUpper _type) do {
		case "HINT" : { hint _msg; };
		case "CHAT" : { systemChat _msg; };
		case "LOG"  : { diag_log text _msg; };
		case "DEBUG": { systemChat _msg; diag_log text _msg; };
		case "F_LOG": {
			private _padding = "==========================================================================================================";
			if (count _msg > 0) then {
				_msg = "=== " + _msg;
				private _pad = (count _padding) - (count _msg);
				if (_pad > 1) then {
					_msg = _msg + " " + (_padding select [0, _pad - 1]);
				};
			} else {
				_msg = _padding;
			};

			diag_log text _msg;
		};
	};
} else {
	[if (_scope == "CLIENTS") then { "CLIENT_ONLY" } else { "LOCAL" }, _type, _msg] remoteExec ["BRM_FMK_fnc_doLog", _target];
};
