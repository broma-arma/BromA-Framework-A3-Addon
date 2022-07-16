[{!isNil "mission_settings_loaded" && { pluginsLoaded }}, {
	params ["_unit", "_faction"];

	private _type = "";

	private _isMan = _unit isKindOf "Man";
	if !(_isMan && local _unit) exitWith {};

	private _isLeader = isFormationLeader _unit;

	#include "\broma_framework\loadouts\includes\private-variables.sqf"
	#include "\broma_framework\loadouts\includes\faction-info-index.sqf"
	#include "\broma_framework\loadouts\includes\get-faction.sqf"

	_unit setVariable ["BIS_enableRandomization", false];

	#include "\broma_framework\loadouts\includes\clear-object.sqf"
	#include "\broma_framework\loadouts\includes\get-type.sqf"
	#include "\broma_framework\loadouts\includes\classes-list.sqf"

	private _assignLoadoutMode = true;

	#include "\broma_framework\loadouts\content\content-list.sqf"
	#include "\broma_framework\loadouts\includes\read-data.sqf"
	#include "\broma_framework\loadouts\includes\set-identity.sqf"


}, _this] call CBA_fnc_waitUntilAndExecute;
