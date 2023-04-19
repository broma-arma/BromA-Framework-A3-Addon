#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_group", "_loadout", "_type", "_settings"];

_settings params ["_cleanup", "_safeSpawnDistance", "_disableLAMBS", "_aiAggressive", "_caching", "_cachingDistances", "_aiSkill"];

if (_disableLAMBS) then {
	_group setVariable ["lambs_danger_disableGroupAI", true];
};

if (_aiSkill isEqualType "") then {
	_aiSkill = GVAR(aiSkills) get _aiSkill;
};
_group allowFleeing 0;

{
	private _unit = _x;

	[_unit, _loadout] call FUNCMAIN(initAI);

	_unit addEventHandler ["Killed", {_this spawn FUNC(garbageCollector)}];

	if (GVAR(aiDeathSounds)) then {
		_unit addEventHandler ["Killed", {_this call FUNC(eventKilled)}];
	};

	if (_aiAggressive) then {
		_unit disableAI 'COVER';
		_unit disableAI 'SUPPRESSION';
		_unit disableAI 'AUTOCOMBAT';
	};

	if (_disableLAMBS) then {
		_unit setVariable ["lambs_danger_disableAI", true];
	};

	_unit setUnitPos "UP";

	{
		// TODO Don't include skill name in config or make them 'optional'?
		_x params ["_skillName", "_skillValue"];
		_unit setSkill [_skillName, _skillValue];
	} forEach _aiSkill;

	if (GVAR(aiInfiniteAmmo)) then {
		_unit addEventHandler ["Reloaded", {_this call FUNC(eventReloaded)}];
	};

} forEach units _group;

if (GVAR(debug)) then {
	[_group] spawn FUNC(createGroupMarker);
};

if (_caching) then {
	[_group, _cachingDistances] spawn FUNC(cacheGroup);
};
