params ["_group", "_loadout", "_type", "_settings"];

_settings params ["_cleanup", "_safeSpawnDistance", "_disableLAMBS", "_aiAggressive", "_caching", "_cachingDistances", "_aiSkill"];

if (_disableLAMBS) then {
	_group setVariable ["lambs_danger_disableGroupAI", true];
};

_aiSkill = [BRM_FMK_AIS_aiSkills, _aiSkill] call BIS_fnc_getFromPairs;
_group allowFleeing 0;

{
	private _unit = _x;

	[_unit, _loadout] call BRM_fnc_initAI;

	_unit addEventHandler ["Killed", {_this spawn BRM_FMK_AIS_fnc_garbageCollector}];

	if (BRM_FMK_AIS_aiDeathSounds) then {
		_unit addEventHandler ["Killed", {_this call BRM_FMK_AIS_fnc_eventKilled}];
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

	if (BRM_FMK_AIS_aiInfiniteAmmo) then {
		_unit addEventHandler ["Reloaded", {_this call BRM_FMK_AIS_fnc_eventReloaded}];
	};

} forEach units _group;

if (BRM_FMK_AIS_debug) then {
	[_group, _type] spawn BRM_FMK_AIS_fnc_createGroupMarker;
};

if (_caching) then {
	[_group, _cachingDistances] spawn BRM_FMK_AIS_fnc_cacheGroup;
};
