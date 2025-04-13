#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_taskStalk

Description:
	Task group to stalk a target.

Parameters:
	_group - Group [GROUP]
	_target - Target [GROUP]
	_refresh - Interval, in seconds, of waypoint being updated. Min 5 seconds [NUMBER, defaults to 10]

Examples:
	[grpStalkers, grpPlayer] call BRM_FMK_Plugin_AIS_fnc_taskStalk;
	[grpStalkers, grpPlayer, 20, 10] call BRM_FMK_Plugin_AIS_fnc_taskStalk;
	[grpStalkers, grpPlayer, 5, 0] call BRM_FMK_Plugin_AIS_fnc_taskStalk;

Returns:
	Script handle, false if parameter error [SCRIPT/BOOL]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params [
	["_group", grpNull, [grpNull]],
	["_target", grpNull, [grpNull]],
	["_refresh", 10, [0]],
	["_radius", 0, [0]]
];

if (isNull _group) exitWith { ["Null group"] call BRM_FMK_fnc_error; false };
if (!isNil { _group getVariable "BRM_FMK_Plugin_AIS_taskStalk" }) exitWith { ["Group already stalking: %1", _group] call BRM_FMK_fnc_error; false };
if (isNull _target) exitWith { ["Null target"] call BRM_FMK_fnc_error; false };
if (_group == _target) exitWith { ["Cannot stalk self: %1", _group] call BRM_FMK_fnc_error; false };
if (_refresh < 5) exitWith { ["Delay cannot be lower than 5: %1 (%2)", _refresh, _group] call BRM_FMK_fnc_error; false };

_group setVariable ["BRM_FMK_Plugin_AIS_taskStalk", [{
	params ["_args", "_handle"];
	_args params ["_group", "_target"];

	if (units _group findIf { alive _x } != -1 && units _target findIf { _x call BRM_FMK_fnc_alive } != -1) then {
		{ deleteWaypoint _x; } forEachReversed waypoints _group;
		_group addWaypoint [leader _target];
	} else {
		_group setVariable ["BRM_FMK_Plugin_AIS_taskStalk", nil];

		[_handle] call CBA_fnc_removePerFrameHandler;
	};
}, _refresh, [_group, _target]] call CBA_fnc_addPerFrameHandler];
