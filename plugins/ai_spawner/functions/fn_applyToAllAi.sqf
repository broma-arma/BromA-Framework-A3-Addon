if (!mission_ai_controller) exitWith {};

private _players = if (isMultiplayer) then {playableUnits} else {switchableUnits};

{
	_x params ["_group"];
	{
		_x params ["_setting"];

		if (_setting && !((leader _group) in _players)) then {
			switch (_forEachIndex) do {
				case 0: { // caching
					_group deleteGroupWhenEmpty true;
					[_group,[AIS_infantryCacheDistance,AIS_vehicleCacheDistance]] spawn BRM_FMK_AIS_fnc_cacheGroup;
				};
				case 1: { // death sounds
					{
						_x addEventHandler ["Killed",{_this spawn BRM_FMK_AIS_fnc_eventKilled}];
					} forEach units _group;
				};
				case 2: { // infnite ammo
					{
						_x addEventHandler ["Reloaded", {_this spawn BRM_FMK_AIS_fnc_eventReloaded;}];
					} forEach units _group;
				};
				case 3: { // garbage collector
					{
						_x addEventHandler ["Killed",{_this spawn  BRM_FMK_AIS_fnc_garbageCollector}];
					} forEach units _group;
				};
				case 4: { // debug marker
					if (AIS_debug) then {
						[_group] spawn BRM_FMK_AIS_fnc_createGroupMarker;
					};
				};
			};
		};
	} forEach AIS_aiSettingsAllMap;
} forEach allGroups;
