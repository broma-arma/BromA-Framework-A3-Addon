if (!isServer) exitWith {};

[{ !isNil "mission_settings_loaded" && { pluginsLoaded && !isNull (_this select 0) }}, {
	params ["_object", "_faction", "_type"];

	if (_object getVariable ["unit_initialized", false]) exitWith {};

	private _unit = _object;
	if !(_type isEqualType []) then { _type = [_type] };

	private _isMan = _unit isKindOf "Man";
	private _isLeader = _isMan && { isFormationLeader _unit };

	#include "\broma_framework\loadouts\includes\private-variables.sqf"
	#include "\broma_framework\loadouts\includes\faction-info-index.sqf"
	#include "\broma_framework\loadouts\includes\clear-object.sqf"
	#include "\broma_framework\loadouts\content\content-list.sqf"
	#include "\broma_framework\loadouts\includes\get-faction.sqf"

	private _assignLoadoutMode = false;

	#include "\broma_framework\loadouts\includes\read-data.sqf"

	private _fnc_cargoList = compile preprocessFile (["\broma_framework\loadouts\cargo-list.sqf", "loadouts\cargo-list.sqf"] select fileExists "loadouts\cargo-list.sqf");
	{
		call _fnc_cargoList;
	} forEach _type;

	_object setVariable ["unit_initialized", true, true];
}, _this] call CBA_fnc_waitUntilAndExecute;
