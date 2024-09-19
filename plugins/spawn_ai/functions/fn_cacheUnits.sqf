params ["_group", "_loadout", "_skill"];

private _groupCachedUnits = [];

sleep 3;

while { count units _group > 0 } do {
	private _leader = leader _group;
	private _units = units _group;

	if (playableUnits + switchableUnits findIf { getPos _leader distance getPos _x <= AI_spawn_cache_distance } != -1) then {
		if (count _groupCachedUnits > 0) then {
			{
				_x params ["_unitClass", "_vehicle", "_vehicleClass"];

				private _unit = [_group, _unitClass, [0,0,0], _skill, _loadout] call BRM_FMK_Plugin_SpawnAI_fnc_spawnUnit;

				if (isNull _vehicle || { !alive _vehicle || { getPos _vehicle distance getPos _leader > 50 } }) then {
					private _pos = getPos _leader vectorAdd [random 5 + 5, random 5 + 5, 0];
					_pos set [2, 0];
					_unit setPos _pos;
				} else {
					if (_vehicle emptyPositions "cargo" > 0) then {
						_unit moveinCargo _vehicle;
						if (isNull objectParent _unit) then {
							deleteVehicle _unit
						};
					} else {
						deleteVehicle _unit;
					};
				};

				["LOCAL", "CHAT", "De-caching " + name _unit + "."] call BRM_FMK_fnc_doLog;
			} forEach _groupCachedUnits;

			_groupCachedUnits = [];
		};
	} else {
		if (count _groupCachedUnits == 0) then {
			if (count _units > 0) then {
				{
					if (_x != _leader) then {
						if (driver objectParent _x != _x) then {
							_groupCachedUnits pushBack [typeOf _x, vehicle _x, typeOf vehicle _x];

							["LOCAL", "CHAT", "Cached unit " + name _x + "."] call BRM_FMK_fnc_doLog;

							deleteVehicle _x;
						};
					};
				} forEach _units;
			};
		};
	};

	sleep 3;
};

["LOCAL", "CHAT", format ["%1 no longer exists.", _group]] call BRM_FMK_fnc_doLog;

true
