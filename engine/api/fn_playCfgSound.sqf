/*
================================================================================

NAME:
    BRM_FMK_fnc_playCfgSound

AUTHOR(s):
    Coryf88

DESCRIPTION:
    playSound3D with CfgSound support.

PARAMETERS:
    0 - CfgSound classname to play. (STRING)
    1 - Object or ASL position to play the sound at. (OBJECT / POSITION)
    2 - (OPTIONAL) Simulate the sound being played inside a building or similar. Default false (BOOLEAN)
    3 - (OPTIONAL) Start offset, in seconds. Default 0 (NUMBER)
    4 - (OPTIONAL) Play sound locally. Default false (BOOLEAN)

USAGE:
    [player, "alert"] call BRM_FMK_fnc_playCfgSound;

RETURNS:
    Nothing.

================================================================================
*/

params ["_sound", "_position", ["_isInside", false], ["_offset", 0], ["_local", false]];

if (_position isEqualType objNull) then {
	if (_position isEqualTo objNull) then {
		_sound = "";
	};
	_position = getPosASL _position;
};

private _cfgSound = [missionConfigFile, campaignConfigFile, configFile];
private _cfgSource = _cfgSound findIf { isArray (_x >> "CfgSounds" >> _sound >> "sound") };

if (_cfgSource == -1) exitWith {};

getArray (_cfgSound select _cfgSource >> "CfgSounds" >> _sound >> "sound") params ["_file", "_volume", "_pitch", ["_maxDistance", -1]];
if (_file select [0, 1] == "@") then {
	_file = _file select [1];
	_cfgSource = 2;
};
if (_file find "." == -1) then {
	_file = _file + ".wss";
};
if (_cfgSource < 2) then {
	_file = getMissionPath _file;
};

if (_volume isEqualType "") then {
	_volume = 10 ^ (parseNumber (_volume select [2]) * (1 / 20));
};

if (_maxDistance < 0) then {
	_maxDistance = _volume * 1000;
};

playSound3D [_file, objNull, _isInside, _position, _volume, _pitch, _maxDistance, _offset, _local];
