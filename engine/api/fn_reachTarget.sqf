/*
================================================================================

NAME:
    BRM_FMK_fnc_reachTarget

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Executes a callback when all objects have reached the targets.

PARAMETERS:
    0 - Objects. (ARRAY of OBJECT|GROUP)
    1 - Targets. (ARRAY of OBJECT|POSITION|MARKER)
    2 - Callback, execution is in unscheduled enviroment. (CODE)
    3 - (OPTIONAL) The maximum distance from the target. Default is 50. (NUMBER)
    3 - (OPTIONAL) Seconds between checking if target has been reached. Default is 1. (NUMBER)

USAGE:
    [[myGroupA, myUnitZ"], [myTargetObject, "myMarker", [200, 100, 50], [0, 0]], { systemChat "Group A and Unit Z made it to one of the targets!"; }, 100, 5] call BRM_FMK_fnc_reachTarget;

RETURNS:
    Nothing.

================================================================================
*/

params ["_objects", "_targets", "_code", ["_distance", 50], ["_interval", 1]];

[{
	params ["_args", "_handle"];

	_args params ["_objects", "_targets", "_distanceSqr", "_code"];

	if (_objects findIf {
		private _reached = true;

		if (!isNull _x) then {
			private _subObjects = if (_x isEqualType grpNull) then { units _x } else { [_x] };

			{
				private _subObject = _x;
				if (!isNull _subObject && {
					alive _subObject && !(_subObject getVariable ["isDead", false]) && {
						_targets findIf { _subObject distanceSqr (if (_x isEqualType "") then { markerPos _x select [0, 2] } else { _x }) <= _distanceSqr } == -1
					}
				}) exitWith {
					_reached = false;
				};
			} forEach _subObjects;
		};

		!_reached
	} == -1) then {
		[_handle] call CBA_fnc_removePerFrameHandler;

		call _code;
	};
}, _interval, [_objects, _targets, _distance ^ 2, _code]] call CBA_fnc_addPerFrameHandler;
