/*
================================================================================

NAME:
    BRM_FMK_fnc_formatElapsedTime

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Formats time, in seconds, according to a format.

PARAMETERS:
    0 - Seconds to format. (NUMBER)
    1 - The format, consisting of the following seperated by a colon (:): Default "H:MM:SS". (STRING)
        S.MS - seconds.milliseconds
        S - seconds
        M - minutes
        H - hours
        D - days
        T - months
    2 - Return type: "", "array", or "long". Default "". (STRING)

USAGE:
    [time, "M:SS.MS"] call BRM_FMK_fnc_formatElapsedTime; // "3:38.847"
    [time, "D:HH:MM:SS"] call BRM_FMK_fnc_formatElapsedTime; // "0:00:03:38"
    [time, "DD:HH:MM:SS"] call BRM_FMK_fnc_formatElapsedTime; // "00:00:03:38"
    [time, "DD:HH:MM:SS", "array"] call BRM_FMK_fnc_formatElapsedTime; // ["00", "00", "03", "38"]
    [time, "DD:HH:MM:SS", "long"] call BRM_FMK_fnc_formatElapsedTime; // "3 minutes and 38 seconds"

RETURNS:
    Formatted time (STRING)

================================================================================
*/

params [["_seconds", 0, [0]], ["_format", "H:MM:SS", [""]], ["_return", "", [""]]];

private _units = "TDHMS";
private _unitValues = [nil, nil, nil, nil, nil];
private _unitNames = ["month", "day", "hour", "minute", "second"];
private _unitSeconds = [2628000, 86400, 3600, 60, 1];

private _lastUnit = -1;
{
	private _i = _units find (_x select [0, 1]);
	if (_i == -1) exitWith { ["Invalid format character: %1", _x] call BIS_fnc_error; _lastUnit = -2; };
	if (_lastUnit >= _i) exitWith { ["Invalid format, %1 must precede %2", _unitNames select _i, _unitNames select _lastUnit] call BIS_fnc_error; _lastUnit = -2; };
	_lastUnit = _i;
	if (_i == count _units - 1) then {
		if (_x select [count _x - 3] == ".MS") then { // S.MS, SS.MS
			_unitValues set [_i, [_seconds, [count _x - 3, 1] select (_return == "long"), 3] call CBA_fnc_formatNumber];
		} else { // S, SS
			_unitValues set [_i, [floor _seconds, [count _x, 1] select (_return == "long")] call CBA_fnc_formatNumber];
		};
	} else {
		_unitValues set [_i, [floor (_seconds / _unitSeconds#_i), [count _x, 1] select (_return == "long")] call CBA_fnc_formatNumber];
		_seconds = _seconds % _unitSeconds#_i;
	};
} forEach (_format splitString ":");

if (_lastUnit == -2) exitWith { [_seconds] call CBA_fnc_formatNumber };
if (_lastUnit == -1) exitWith { ["Invalid format, empty"] call BIS_fnc_error; [_seconds] call CBA_fnc_formatNumber };

if (_return == "long") exitWith {
	private _long = [];
	{
		if (!isNil "_x" && { (_x != "0" && _x != "00") || { _long isEqualTo [] && _forEachIndex == count _units - 1 } }) then {
			private _name = _unitNames#_forEachIndex;
			if (_x != "1") then { _name = _name + "s"; };
			_long pushBack (_x + " " + _name);
		};
	} forEach _unitValues;

	_long call BRM_FMK_fnc_verboseArray
};

_unitValues = _unitValues select { !isNil "_x" };

if (_return == "array") exitWith { _unitValues };

_unitValues joinString ":"
