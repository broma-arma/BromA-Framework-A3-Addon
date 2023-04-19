#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_syncTime

AUTHOR(s):
    Nife

DESCRIPTION:
    Synchronizes time with the server.

PARAMETERS:
    None.

USAGE:
    [] spawn BRM_FMK_fnc_syncTime.

RETURNS:
    Nothing.

================================================================================
*/

if !(didJIP) exitWith {};

if (isRemoteExecuted) then {
	private _names = ["DATE", "FOG", "RAIN", "GUSTS", "LIGHTNINGS", "OVERCAST", "RAINBOW", "WIND STRENGTH", "WIND FORCE", "WAVES"];
	private _i = -1;
	["LOCAL", "LOG", format ["=== PLAYER SYNCHRONIZED TIME @ %1: %2", time, _this apply { _i = _i + 1; format ["%1: %2", _names select _i, _x] } joinString " | "]] call FUNCMAIN(doLog);

	params ["_date", "_fogParams", "_rain", "_gusts", "_lightnings", "_overcast", "_rainbow", "_windStr", "_wind", "_waves"];

	setDate _date;
	0 setFog _fogParams;
	0 setRain _rain;
	0 setGusts _gusts;
	0 setLightnings _lightnings;
	0 setOvercast _overcast;
	0 setRainbow _rainbow;
	0 setWindStr _windStr;
	setWind _wind;
	0 setWaves _waves;
} else {
	0 remoteExec [QFUNCMAIN(stampTime), 2];
};
