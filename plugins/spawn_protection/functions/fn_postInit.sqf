if (!isServer) exitWith {};

if (isNil "mission_spawn_protection_time") then {
	// Duration of spawn protection, in minutes: 0 (Disable), 1, 15, 30, -1 (Infinite), 99999 (Infinite - Backward compatibility)
	private _duration = ["p_spawn_protection_time", -1] call BIS_fnc_getParamValue;
	mission_spawn_protection_time = if (_duration >= 0 && _duration <= /*24 hours*/1440) then { _duration * 60 } else { -1 };
};

if (mission_spawn_protection_time == 0) exitWith {};

private _radius = 50;

if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "spawn_protection_area") then { _radius = spawn_protection_area; };
} else {
	if (fileExists "mission\settings\plugins\spawn_protection.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\spawn_protection.sqf";
	};
};

[_radius] spawn {
	params ["_radius"];

	private _fnc_createTrigger = {
		params ["_side", ["_radius", 50]];

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
		private _area = [_radius, _radius, 0, true];

		// Create marker on clients.
		([_pos] + _area) remoteExec ["BRM_FMK_Plugin_SpawnProtection_fnc_clientMarker", _side, "BRM_FMK_SpawnProtection_" + _sideStr];

		// Create and configure trigger
		private _trigger = createTrigger ["EmptyDetector", _pos, false];
		_trigger setVariable ["BRM_FMK_SpawnProtection_protected", []];
		_trigger setTriggerArea _area;
		_trigger setTriggerActivation ["ANY", "PRESENT", true];
		_trigger setTriggerStatements [
			// Condition
			"private _result = false;
			if (!triggerActivated thisTrigger) then {
				private _inTrigger = thisList select { side _x == " + _sideStr + " || (side _x == CIVILIAN && {_x isKindOf ""AllVehicles"" && {!(_x isKindOf ""Man"")}}) };
				private _protected = thisTrigger getVariable ""BRM_FMK_SpawnProtection_protected"";
				_result = (count (_inTrigger - _protected) + count (_protected - _inTrigger)) > 0;
			};

			_result",

			// Activation
			"private _inTrigger = thisList select { side _x == " + _sideStr + " || (side _x == CIVILIAN && {_x isKindOf ""AllVehicles"" && {!(_x isKindOf ""Man"")}}) };
			private _protected = (thisTrigger getVariable ""BRM_FMK_SpawnProtection_protected"") - [objNull];

			private _added = (_inTrigger - _protected);
			if (count _added > 0) then {
				[_added, false] remoteExec [""BRM_FMK_Plugin_SpawnProtection_fnc_allowDamage"", 0];
			};
			_protected append _added;

			private _removed = (_protected - _inTrigger);
			if (count _removed > 0) then {
				[_removed, true] remoteExec [""BRM_FMK_Plugin_SpawnProtection_fnc_allowDamage"", 0];
			};
			thisTrigger setVariable [""BRM_FMK_SpawnProtection_protected"", _protected - _removed];",

			// Deactivation
			""
		];

		[_trigger, _sideStr]
	};

	// Create triggers for the sides
	private _triggers = [[side_a_side, _radius] call _fnc_createTrigger];

	if (mission_game_mode != "coop") then { _triggers pushBack ([side_b_side, _radius] call _fnc_createTrigger); };
	if (mission_enable_side_c) then {       _triggers pushBack ([side_c_side, _radius] call _fnc_createTrigger); };

	if (mission_spawn_protection_time > 0) then { // Finite
		// Wait until spawn protection expires.
		while {mission_spawn_protection_time > 0} do {
			sleep 1;
			mission_spawn_protection_time = mission_spawn_protection_time - 1;
		};

		// Remove JIP remoteExec, disable protection, and delete triggers
		{
			_x params ["_trigger", "_sideStr"];

			remoteExec ["", "BRM_FMK_SpawnProtection_" + _sideStr];
			[(_trigger getVariable "BRM_FMK_SpawnProtection_protected") - [objNull], true] remoteExec ["BRM_FMK_Plugin_SpawnProtection_fnc_allowDamage", 0];
			deleteVehicle _trigger;
		} forEach _triggers;

		// Delete the marker.
		[] remoteExec ["BRM_FMK_Plugin_SpawnProtection_fnc_clientMarker", 0];
	};
};
