/*
================================================================================

NAME:
    BRM_FMK_fnc_checkCasualties

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Executes a callback when a specified percent of players, on a specified side, are dead.

PARAMETERS:
    0 - Side. (SIDE)
    1 - Percentage, 0 to 1. (NUMBER)
    2 - Callback, execution is in unscheduled enviroment. (CODE)
    3 - (OPTIONAL) Seconds between checking if percentage has been reached. Default is 5. (NUMBER)

USAGE:
    [WEST, 1, { systemChat "Blufor, game over man."; }, 10] call BRM_FMK_fnc_checkCasualties;
    [EAST, 0.65, { systemChat "65% of Opfor have died!"; }] call BRM_FMK_fnc_checkCasualties;

RETURNS:
    Nothing

================================================================================
*/

if !(isServer) exitWith {};

params ["_side", "_percentage", "_callback", ["_interval", 5]];

[{
	params ["_args", "_handle"];

	_args params ["_side", "_percentage", "_callback"];

	private _alive = 0;
	private _dead = 0;
	{
		if (_x getVariable ["unit_side", side _x] == _side) then {
			if (_x call BRM_FMK_fnc_alive) then {
				_alive = _alive + 1;
			} else {
				_dead = _dead + 1;
			};
		};
	} forEach (call BIS_fnc_listPlayers - entities "HeadlessClient_F");

	private _total = _alive + _dead;
	if (_total == 0 || { _dead / _total >= _percentage }) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
		call _callback;
	};
}, _interval, [_side, _percentage, _callback]] call CBA_fnc_addPerFrameHandler;
