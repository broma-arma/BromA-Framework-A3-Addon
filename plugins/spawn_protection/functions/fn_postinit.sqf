#include "script_component.hpp"
if (!isServer) exitWith {};

mission_spawn_protection_time = ["p_spawn_protection_time", -1] call BIS_fnc_getParamValue;
if (mission_spawn_protection_time == 99999) then { // Backwards compatibility
	mission_spawn_protection_time = -1;
};
if (mission_spawn_protection_time > 0) then {
	mission_spawn_protection_time = mission_spawn_protection_time * 60;
};

if (mission_spawn_protection_time == 0) exitWith {};

0 spawn {
	[] call FUNC(getSettings) params ["_area"];

	private _fnc_createTrigger = {
		params ["_side"];

		private _sideStr = switch (_side) do {
			case WEST:			{ "west" };
			case EAST:			{ "east" };
			case RESISTANCE:	{ "resistance" };
			case CIVILIAN:		{ "civilian" };
		};

		if (isNil "_sideStr") then {
			private _errorMsg = format ["ERROR [Spawn Protection] Invalid trigger side ""%1"", using ""CIV""", _side];
			systemChat _errorMsg;
			diag_log text _errorMsg;

			_sideStr = "civilian";
		};

		private _pos = getMarkerPos ("respawn_" + _sideStr);
		private _triggerArea = [_area, _area, 0, true];

		// Create marker on clients.
		([_pos] + _triggerArea) remoteExec [QFUNC(clientMarker), _side, QUOTE(CONCAT(ADDON,_)) + _sideStr];

		// Create and configure trigger
		private _trigger = createTrigger ["EmptyDetector", _pos, false];
		_trigger setVariable [QGVAR(protected), []];
		_trigger setTriggerArea _triggerArea;
		_trigger setTriggerActivation ["ANY", "PRESENT", true];
		_trigger setTriggerStatements [_sideStr + QUOTE( call FUNC(triggerCondition)), _sideStr + QUOTE( call FUNC(triggerActivation)), ""];

		[_trigger, _sideStr]
	};

	// Create triggers for the sides
	private _triggers = [side_a_side call _fnc_createTrigger];

	if (mission_game_mode != "coop") then { _triggers pushBack (side_b_side call _fnc_createTrigger); };
	if (mission_enable_side_c) then {       _triggers pushBack (side_c_side call _fnc_createTrigger); };

	if (mission_spawn_protection_time > 0) then { // Finite
		// Wait until spawn protection expires.
		while {mission_spawn_protection_time > 0} do {
			sleep 1;
			mission_spawn_protection_time = mission_spawn_protection_time - 1;
		};

		// Remove JIP remoteExec, disable protection, and delete triggers
		{
			_x params ["_trigger", "_sideStr"];

			remoteExec ["", QUOTE(CONCAT(ADDON,_)) + _sideStr];
			[(_trigger getVariable QGVAR(protected)) - [objNull], true] remoteExec [QFUNC(allowDamage), 0];
			deleteVehicle _trigger;
		} forEach _triggers;

		// Delete the marker.
		[] remoteExec [QFUNC(clientMarker), 0];
	};
};
