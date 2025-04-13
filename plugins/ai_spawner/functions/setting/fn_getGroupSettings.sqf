#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_getGroupSettings

Description:
	Get group settings.

Parameters:
	_settings - Setting ID [STRING/ARRAY]
	_side - Side [SIDE]
	_faction - Faction [STRING]

Returns:
	Settings, nil if setting doesn't exist [ARRAY/NIL]
		_type - Classname(s) of unit or vehicle [STRING/ARRAY]
			"%1" was replaced with "B", "O", "I", or "C", according to spawner's side
			The following were replaced by the vehicles in the faction: "AA_VEHICLES", "ATTACK_HELOS", "ATTACK_PLANES", "HEAVY_VEHICLES", "LIGHT_VEHICLES", "MEDIUM_VEHICLES", "MOBILE_ARTILLERY", "TRANSPORT_HELOS", "TRANSPORT_PLANES", "TRANSPORT_TRUCKS", "STATIC_DEFENSE", "BOATS", "UAV", "UGV", "SUPPORT", "SUBMARINES", "MRAP_VEHICLES"

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_id", "_side", "_faction"];

if (_id isEqualType []) exitWith { _id };

private _settings = BRM_FMK_Plugin_AIS_groupTypes get _id;

if (isNil "_settings") exitWith { nil };

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"

private _vehicles = nil;
private _fnc_getVehicles = {
	if (isNil "_vehicles") then {
		_vehicles = [_faction, "VEHICLES"] call BRM_fnc_getLoadoutProperty;
	};

	_vehicles select _this
};

private _sideChar = ["B", "O", "I", "C"] select ([BLUFOR, OPFOR, INDEPENDENT, CIVILIAN] find _side);

_settings apply {
	if (_x isEqualType []) then {
		_x apply { format [_x, _sideChar] }
	} else {
		switch (_x) do {
			case "AA_VEHICLES": { AA_VEHICLES call _fnc_getVehicles };
			case "ATTACK_HELOS": { ATTACK_HELOS call _fnc_getVehicles };
			case "ATTACK_PLANES": { ATTACK_PLANES call _fnc_getVehicles };
			case "HEAVY_VEHICLES": { HEAVY_VEHICLES call _fnc_getVehicles };
			case "LIGHT_VEHICLES": { LIGHT_VEHICLES call _fnc_getVehicles };
			case "MEDIUM_VEHICLES": { MEDIUM_VEHICLES call _fnc_getVehicles };
			case "MOBILE_ARTILLERY": { MOBILE_ARTILLERY call _fnc_getVehicles };
			case "TRANSPORT_HELOS": { TRANSPORT_HELOS call _fnc_getVehicles };
			case "TRANSPORT_PLANES": { TRANSPORT_PLANES call _fnc_getVehicles };
			case "TRANSPORT_TRUCKS": { TRANSPORT_TRUCKS call _fnc_getVehicles };
			case "STATIC_DEFENSE": { STATIC_DEFENSE call _fnc_getVehicles };
			case "BOATS": { BOATS call _fnc_getVehicles };
			case "UAV": { UAV call _fnc_getVehicles };
			case "UGV": { UGV call _fnc_getVehicles };
			case "SUPPORT": { SUPPORT call _fnc_getVehicles };
			case "SUBMARINES": { SUBMARINES call _fnc_getVehicles };
			case "MRAP_VEHICLES": { MRAP_VEHICLES call _fnc_getVehicles };
			default { format [_x, _sideChar] };
		}
	}
}
