if (!isServer) exitWith {};

0 spawn {
	waitUntil { !isNil "mission_spawn_protection_time" };

	if (mission_spawn_protection_time == 0) exitWith {};

	if (isNil "spawn_protection_area") then {
		spawn_protection_area = 50;
	};

	private _fnc_createTrigger = {
		params ["_side"];

		private _sideStr = switch (_side) do {
			case WEST:			{ "west" };
			case EAST:			{ "east" };
			case RESISTANCE:	{ "resistance" };
			case CIVILIAN:		{ "civilian" };
		};

		private _respawnMarker = "respawn_" + _sideStr;

		if (isNil "_respawnMarker") exitWith {
			objNull
		};

		private _pos = getMarkerPos _respawnMarker;
		private _area = [spawn_protection_area, spawn_protection_area, 0, true];

		// Create marker on clients.
		([_pos] + _area) remoteExec ["BRM_FMK_SpawnProtection_fnc_clientMarker", _side, "BRM_FMK_SpawnProtection_" + _sideStr];

		// Create and configure trigger
		private _trigger = createTrigger ["EmptyDetector", _pos, false];
		_trigger setVariable ["BRM_FMK_SpawnProtection_protected", []];
		_trigger setTriggerArea _area;
		_trigger setTriggerActivation ["ANY", "PRESENT", true];
		_trigger setTriggerStatements [
			// Condition
			"private _result = false;
			if (!triggerActivated thisTrigger) then {
				private _thisList = thisList select { side _x == " + _sideStr + " || (_x isKindOf ""AllVehicles"" && !(_x isKindOf ""Man"") && {alive _x} count crew _x == 0) };
				private _protected = (thisTrigger getVariable ""BRM_FMK_SpawnProtection_protected"") - [objNull];
				_result = (count (_thisList - _protected) + count (_protected - _thisList)) > 0;
			};

			_result",

			// Activation
			"private _thisList = thisList select { side _x == " + _sideStr + " || (_x isKindOf ""AllVehicles"" && !(_x isKindOf ""Man"") && {alive _x} count crew _x == 0) };
			private _protected = (thisTrigger getVariable ""BRM_FMK_SpawnProtection_protected"") - [objNull];

			private _added = (_thisList - _protected);
			if (count _added > 0) then {
				[_added, false] remoteExec [""BRM_FMK_SpawnProtection_fnc_allowDamage"", 0];
			};
			_protected append _added;

			private _removed = (_protected - _thisList);
			if (count _removed > 0) then {
				[_removed, true] remoteExec [""BRM_FMK_SpawnProtection_fnc_allowDamage"", 0];
			};
			thisTrigger setVariable [""BRM_FMK_SpawnProtection_protected"", _protected - _removed];",

			// Deactivation
			""
		];

		[_trigger, _sideStr]
	};

	// Create triggers for the sides
	private _triggers = [
		side_a_side call _fnc_createTrigger,
		if (mission_game_mode != "coop") then { side_b_side call _fnc_createTrigger } else { false },
		if (mission_enable_side_c) then { side_c_side call _fnc_createTrigger } else { false }
	];

	if (mission_spawn_protection_time > 0) then { // Finite
		// Wait until spawn protection expires.
		while {mission_spawn_protection_time > 0} do {
			sleep 1;
			mission_spawn_protection_time = mission_spawn_protection_time - 1;
		};

		// Remove JIP remoteExec, disable protection, and delete triggers
		{
			if !(_x isEqualType false) then {
				_x params ["_trigger", "_sideStr"];

				remoteExec ["", "BRM_FMK_SpawnProtection_" + _sideStr];
				[(_trigger getVariable "BRM_FMK_SpawnProtection_protected") - [objNull], true] remoteExec ["BRM_FMK_SpawnProtection_fnc_allowDamage", 0];
				deleteVehicle _trigger;
			};
		} forEach _triggers;

		// Delete the marker.
		[] remoteExec ["BRM_FMK_SpawnProtection_fnc_clientMarker", [0, -2] select isDedicated];
	};
};
