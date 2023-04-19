#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

if (!mission_ai_controller) exitWith {};

private _playerGroups = allPlayers apply { group _x };
_playerGroups = _playerGroups arrayIntersect _playerGroups;

{
	_x params ["_group"];
	if !(_group in _playerGroups) then {
		{
			if (_x) then {
				switch (_forEachIndex) do {
					// TODO Should AIS caching affect editor units?
					// TODO Check locality issues of caching server units on HC.
					// TODO Should not cache groups or units that have a variable name assigned.
					case 0: { // caching
						_group deleteGroupWhenEmpty true;
						[_group] spawn FUNC(cacheGroup);
					};

					// TODO Remove or fix
					// Event handlers are local only and current units would be either players or editor units, which would be on the server.
					/*
					case 1: { // death sounds
						{
							_x addEventHandler ["Killed", {_this call FUNC(eventKilled)}];
						} forEach units _group;
					};
					case 2: { // infnite ammo
						// 
						{
							_x addEventHandler ["Reloaded", {_this call FUNC(eventReloaded);}];
						} forEach units _group;
					};
					case 3: { // garbage collector
						{
							_x addEventHandler ["Killed", {_this spawn FUNC(garbageCollector)}];
						} forEach units _group;
					};
					*/

					// TODO Remove? I'd expect it to only mark AIS created groups.
					/*
					case 4: { // debug marker
						if (GVAR(debug)) then {
							[_group] spawn FUNC(createGroupMarker);
						};
					};
					*/
				};
			};
		} forEach GVAR(aiSettingsAllMap);
	}
} forEach allGroups;
