/*
================================================================================

NAME:
    BRM_FMK_fnc_error

AUTHOR(s):
    Karel Moricky, modified by Killzone_Kid, modified by Coryf88

DESCRIPTION:
    Display error message.

    BIS_fnc_error, without restrictions on when error shown/logged.

PARAMETERS:
    0 - Formatted message (STRING)
    1+ - (OPTIONAL) additional parameters (ANY)

USAGE:
    ["Player is too far away (%1 metres)", round (player distance [0, 0, 0])] call BRM_FMK_fnc_error;
    if (!isServer) exitWith { ["This function must run on the server"] call BRM_FMK_fnc_error };
    if (!hasInterface) exitWith { ["This function must not run on a headless machine"] call BRM_FMK_fnc_error };
    if (!local _vehicle) exitWith { ["This function must run on the vehicle owner's machine"] call BRM_FMK_fnc_error };

RETURNS:
    Nothing.

================================================================================
*/

if !(_this isEqualType []) then { _this = [_this]; };

if (_this select 0 isEqualType "") then {
	private _count = count _this;
	if (_count > 0) then {
		private _params = [];
		for "_i" from 1 to _count do { _params pushBack _i };
		_this = ["%" + (_params joinString " %")] + _this;
	};
};

private _scriptName = if (isNil "_fnc_scriptName") then { "" } else { _fnc_scriptName };
if (_scriptName != "") then {
	_scriptName = "[" + _scriptName + "] ";
};

// On-screen output
if (hasInterface) then {
	private _text = format _this splitString "<" joinString "&lt;";
	if (is3DEN) then {
		["<img image='\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\functions_ca.paa' /><t font='EtelkaMonospaceProBold' size='0.75'>" + _scriptName + "</t><br />" + _text, 2, 5, false] call BIS_fnc_3DENNotification;
	} else {
		"BRM_FMK_fnc_error" cutRsc ["RscFunctionError", "PLAIN"];
		uiNamespace getVariable ["RscFunctionError", displayNull] displayCtrl 1100 ctrlSetStructuredText parseText ("<t font='LucidaConsoleB' size='0.5'><t color='#ff9900'>" + _scriptName + "</t>" + _text + "</t>");
	};
};

// DebugLog output
private _msg = _this select 0;
_msg = "log: " + (["ERROR: ", "HALT: "] select !isNil "_fnc_error_exit") + _scriptName + _msg;
if (isMultiplayer) then {
	_msg = profileName + "/" + _msg;
};
diag_log format ([_msg] + (_this select [1]));
