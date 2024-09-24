// ============================================================================================
//
//	This script allows for loading of cargo into any type of vehicle that is placed in the editor.
//
// ============================================================================================

if (!isServer) exitWith {};

params ["_object", "_faction", "_type"];

if (_object isKindOf "Man" || _object getVariable ["unit_initialized", false]) exitWith {};

if (!BRM_FMK_initialized) exitWith {
	if !(_object getVariable ["BRM_FMK_fnc_assignCargo_delayed", false]) then {
		_object setVariable ["BRM_FMK_fnc_assignCargo_delayed", true];
		[{ BRM_FMK_initialized }, {
			_this select 0 setVariable ["BRM_FMK_fnc_assignCargo_delayed", false];
			_this call BRM_FMK_fnc_assignCargo;
		}, _this] call CBA_fnc_waitUntilAndExecute;
	};
};

_object setVariable ["unit_initialized", true, true];

if (isNull _object) exitWith {};

private _unit = _object;
if !(_type isEqualType []) then { _type = [_type]; };

private _isMan = false;
private _isLeader = false;

#include "\broma_framework\loadouts\includes\private-variables.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"
#include "\broma_framework\loadouts\includes\clear-object.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"
#include "\broma_framework\loadouts\includes\get-faction.sqf"

_loadoutCondition = !(_faction in read_local_cargo_specific);
_assignLoadoutMode = false;

#include "read-data.sqf"

if (read_local_cargo) then {
	if (isNil "BRM_FMK_Engine_missionCargoList") then {
		BRM_FMK_Engine_missionCargoList = compileFinal preprocessFileLineNumbers "mission\loadouts\cargo-list.sqf";
	};
	{
		call BRM_FMK_Engine_missionCargoList;
	} forEach _type;
} else {
	{
		#include "\broma_framework\loadouts\cargo-list.sqf"
	} forEach _type;
};

/*
if (!isNil "BRM_FMK_fnc_assignCargo") then { _this call BRM_FMK_fnc_assignCargo };

params ["_object", "_faction", "_type"];

if (!isServer || _object isKindOf "Man" || _object getVariable ["unit_initialized", false]) exitWith {};
_object setVariable ["unit_initialized", true];

[{ missionNamespace getVariable ["pluginsLoaded", false] }, {
	params ["_object", "_faction", "_type"];

	private _unit = _object;
	if !(_type isEqualType []) then { _type = [_type] };

	private _isMan = false;
	private _isLeader = false;

	#include "\broma_framework\loadouts\includes\private-variables.sqf"
	#include "\broma_framework\loadouts\includes\clear-object.sqf"
	#include "\broma_framework\loadouts\content\content-list.sqf"
	#include "\broma_framework\loadouts\includes\get-faction.sqf"

	_assignLoadoutMode = false;

	#include "read-data.sqf"

	{
		_x = toLower _x;
		private _overrideCargo = false;
		#include "..\..\..\..\mission\loadouts\cargo-list.sqf"
		if (!_overrideCargo) then {
			#include "\broma_framework\loadouts\cargo-list.sqf"
		};
	} forEach _type;
}, _this] call CBA_fnc_waitUntilAndExecute;
*/
