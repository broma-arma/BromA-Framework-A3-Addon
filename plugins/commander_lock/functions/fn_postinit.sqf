{
	_x params ["_var", "_default"];
	if (isNil _var) then { missionNamespace setVariable [_var, _default]; };
} forEach [
	["co_lock_units", "[blu_0_0_1, op_0_0_1, ind_0_0_1]"],
	["co_lock_tvt_mode", false]
];

call compile format ["co_lock_units = %1", co_lock_units];

if (isServer) then {
	locked_sides = [];
	co_lock_allSidesReady = false;
	publicVariable "co_lock_allSidesReady";

	{
		if ((!(side _x in locked_sides))&&!(str _x == "<NULL-object>")) then {
			locked_sides pushBack (side _x);
		};
	} forEach co_lock_units;
	publicVariable "locked_sides";
};

if (hasInterface) then {
	[{(!isNil "co_lock_allSidesReady") && (!isNil "locked_sides")}, {
		if (!(side player in locked_sides)) exitWith {};

		0 spawn { // Force enable text channels until commander starts mission.
			sleep 1; // Post briefing
			private _channelSettings = [];
			for "_i" from 0 to 5 do {
				private _channelEnabled = channelEnabled _i;
				_channelSettings pushBack +_channelEnabled;
				_channelEnabled set [0, true];
				_i enableChannel _channelEnabled;
			};

			[{ !(side player in locked_sides) }, {
				{ _forEachIndex enableChannel _x; } forEach _this;

				// Group > Vehicle > Direct > Side > Global > Command > Group (All disabled)
				setCurrentChannel ([3, 4, 5, 1, 0, 2, 3] select ([3, 4, 5, 1, 0, 2] findIf { channelEnabled _x select 0 }));
			}, _channelSettings] call CBA_fnc_waitUntilAndExecute;
		};

		private _coLockTextSelect = parseNumber co_lock_tvt_mode;

		if (player in co_lock_units) then {
			private _coLockTextStart = ["Start the mission.", "Ready your side."];
			private _coLockTextStarted = ["The commander declares the mission as go!", "All sides are ready - mission start."];
			private _coLockActionCondition = "(player in co_lock_units)&&(side player in locked_sides)";

			_coLockTextStart = _coLockTextStart select _coLockTextSelect;
			_coLockTextStarted = _coLockTextStarted select _coLockTextSelect;

			private _coLockAlertColorValues = switch (side player) do {
				case WEST: { ["AlertBLU", ["blue"] call BRM_FMK_fnc_colorToHex] };
				case EAST: { ["AlertOP", ["red"] call BRM_FMK_fnc_colorToHex] };
				case RESISTANCE: { ["AlertIND", ["green"] call BRM_FMK_fnc_colorToHex] };
				default { ["AlertBLU", ["blue"] call BRM_FMK_fnc_colorToHex] };
			};

			_coLockAlertColorValues params ["_alertNotificationColor", "_alertTextColor"];

			private _addActionText = format["<t color='%1'>%2</t>", _alertTextColor, _coLockTextStart];

			player addAction [_addActionText, {
				params ["_caller", "_target", "_index", "_arguments"];
				_arguments params ["_alertNotificationColor", "_coLockTextStarted"];

				locked_sides = locked_sides - [side player]; publicVariable "locked_sides";
				if (count locked_sides <= 0) then { co_lock_allSidesReady = true; publicVariable "co_lock_allSidesReady" };

				private _coLockNotificationParameters = if (co_lock_tvt_mode) then {
					private _returnValues = [_alertNotificationColor, 0];

					if !(co_lock_allSidesReady) then {
						private _sideName = [(side player), "name"] call BRM_FMK_fnc_getSideInfo;
						private _readyText = format["%1 is ready to begin the mission.", _sideName];
						_returnValues set [0, "Alert"];
						_returnValues pushBack _readyText;
					};
					_returnValues
				} else { ["Alert", (side player)] };

				_coLockNotificationParameters params ["_coLockNotificationColor", "_notificationCondition", ["_coLockNotificationText", _coLockTextStarted]];
				[_coLockNotificationColor, [_coLockNotificationText]] remoteExec ["BIS_fnc_showNotification", _notificationCondition];
			}, [_alertNotificationColor, _coLockTextStarted], 0.5, true, true,"'", _coLockActionCondition];

		} else {
			private _coLockPlayerFreeCondition = (((!co_lock_tvt_mode) && (side player in locked_sides)) || ((co_lock_tvt_mode) && (!co_lock_allSidesReady)));

			if (_coLockPlayerFreeCondition) then {
				private _coLockTextWait = ["Please wait until the Commander clears the mission to begin.", "Please wait until all teams are ready."];
				_coLockTextWait = _coLockTextWait select _coLockTextSelect;

				private _deleteProjectile = { deleteVehicle (_this select 6) };

				_removeBulletsEH = player addEventHandler ["Fired", _deleteProjectile];
				_removeACEThrowingEH = ["ACE_advanced_throwing_throwFiredXEH", _deleteProjectile] call CBA_fnc_addEventHandler;
				_removeExplosivesEH = ["ACE_Explosives_place", { deleteVehicle (_this select 0) }] call CBA_fnc_addEventHandler;

				_perFrameHandlePlayer = [{
					params ["_coLockTextWait"];
					if (typeof (vehicle player) != (typeof player)) then {
						player action ["getout", (vehicle player)];
						hint _coLockTextWait;
					};
				}, 0.5, _coLockTextWait] call CBA_fnc_addPerFrameHandler;

				[{!(((!co_lock_tvt_mode) && (side player in locked_sides)) || ((co_lock_tvt_mode) && (!co_lock_allSidesReady)))}, {
					params["_removeBulletsEH", "_perFrameHandlePlayer", "_removeACEThrowingEH", "_removeExplosivesEH"];

					player removeEventHandler ["Fired", _removeBulletsEH];
					[_perFrameHandlePlayer] call CBA_fnc_removePerFrameHandler;
					["ACE_advanced_throwing_throwFiredXEH", _removeACEThrowingEH] call CBA_fnc_removeEventHandler;
					["ACE_explosives_place", _removeExplosivesEH] call CBA_fnc_removeEventHandler;
				},[_removeBulletsEH, _perFrameHandlePlayer, _removeACEThrowingEH, _removeExplosivesEH]] call CBA_fnc_waitUntilAndExecute;
			};
		};
	}] call CBA_fnc_waitUntilAndExecute;
};
