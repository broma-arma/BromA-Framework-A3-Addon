params ["_unit", "_faction", ["_type", ""]];

if !(_unit isKindOf "Man" && local _unit) exitWith {};

if (!BRM_FMK_Engine_initialized) exitWith {
	[{ BRM_FMK_Engine_initialized }, { _this call BRM_FMK_fnc_assignLoadout; }, _this] call CBA_fnc_waitUntilAndExecute;
};

private _isMan = true;
private _isLeader = isFormationLeader _unit;

#include "\broma_framework\loadouts\includes\private-variables.sqf"
if (BRM_FMK_Engine_compatVersion == 0) then { _loadoutCondition = (!((_faction) in read_local_loadouts_specific)); };
_assignLoadoutMode = true;

#include "\broma_framework\loadouts\includes\faction-info-index.sqf"
#include "\broma_framework\loadouts\includes\get-faction.sqf"
#include "\broma_framework\loadouts\includes\clear-object.sqf"
#include "\broma_framework\loadouts\includes\get-type.sqf"
#include "\broma_framework\loadouts\includes\classes-list.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"
#include "read-data.sqf"
#include "\broma_framework\loadouts\includes\set-identity.sqf"

if (isPlayer _unit) then { // Weapon on back
	_unit switchMove "AmovPercMstpSnonWnonDnon";
	_unit action ["SwitchWeapon", _unit, _unit, -1];
};

["BRM_FMK_loadoutAssigned", _this] call CBA_fnc_localEvent;
