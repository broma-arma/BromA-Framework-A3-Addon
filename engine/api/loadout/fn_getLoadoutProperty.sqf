params ["_faction", ["_property", "ALL"]];

if (isNil "BRM_FMK_fnc_getLoadoutProperty_cache") then {
	BRM_FMK_fnc_getLoadoutProperty_cache = createHashMap;
};

_faction = toUpper _faction;
_property = toUpper _property;
private _cache = BRM_FMK_fnc_getLoadoutProperty_cache get _faction;
if (!isNil "_cache") exitWith {
	_cache get (["ALL", _property] select (_property in _cache))
};

#include "\broma_framework\loadouts\includes\private-variables.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

_assignLoadoutMode = false;
_loadoutCondition = !(_faction in read_local_loadouts_specific);

#include "read-data.sqf"

private _cache = createHashMapFromArray [
	// TODO Does anything actually use "ALL"
	["ALL", [_defaultSide, _defaultColor, _factionName, _factionSkill, _factionCallsigns, _factionUnits, _factionVehicles, _factionObjects, _factionDACCamps]],
	["SIDE", _defaultSide],
	["COLOR", _defaultColor],
	["NAME", _factionName],
	["SKILL", _factionSkill],
	["CALLSIGNS", _factionCallsigns],
	["UNITS", _factionUnits],
	["VEHICLES", _factionVehicles],
	["OBJECTS", _factionObjects],
	["DACCAMPS", _factionDACCamps]
];
BRM_FMK_fnc_getLoadoutProperty_cache set [_faction, _cache];
_cache get _property
