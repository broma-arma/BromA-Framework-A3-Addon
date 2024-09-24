params ["_unit", "_faction", ["_type", ""]];

if !(_unit isKindOf "Man" && local _unit) exitWith {};

if (!BRM_FMK_initialized) exitWith {
	[{ BRM_FMK_initialized }, { _this call BRM_FMK_fnc_assignLoadout; }, _this] call CBA_fnc_waitUntilAndExecute;
};

private _isMan = true;
private _isLeader = isFormationLeader _unit;

_unit setVariable ["BIS_enableRandomization", false];

#include "\broma_framework\loadouts\includes\private-variables.sqf"
_loadoutCondition = (!((_faction) in read_local_loadouts_specific));
_assignLoadoutMode = true;

#include "\broma_framework\loadouts\includes\faction-info-index.sqf"
#include "\broma_framework\loadouts\includes\get-faction.sqf"
#include "\broma_framework\loadouts\includes\clear-object.sqf"
#include "\broma_framework\loadouts\includes\get-type.sqf"
#include "\broma_framework\loadouts\includes\classes-list.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"
#include "read-data.sqf"
#include "\broma_framework\loadouts\includes\set-identity.sqf"

/*
if (!isNil "BRM_FMK_fnc_assignLoadout") then { _this call BRM_FMK_fnc_assignLoadout };

params ["_unit", "_faction", ["_type", ""]];

if !(_unit isKindOf "Man" && local _unit) exitWith {};

[{ missionNamespace getVariable ["pluginsLoaded", false] }, {
	params ["_unit", "_faction", ["_type", ""]];

	private _isMan = true;
	private _isLeader = isFormationLeader _unit;

	#include "\broma_framework\loadouts\includes\private-variables.sqf"
	#include "\broma_framework\loadouts\includes\clear-object.sqf"
	#include "\broma_framework\loadouts\content\content-list.sqf"
	#include "\broma_framework\loadouts\includes\get-faction.sqf"
	#include "\broma_framework\loadouts\includes\get-type.sqf"
	#include "\broma_framework\loadouts\includes\classes-list.sqf"

	_assignLoadoutMode = true;

	#include "read-data.sqf"

	#include "\broma_framework\loadouts\includes\set-identity.sqf"
}, _this] call CBA_fnc_waitUntilAndExecute;
*/