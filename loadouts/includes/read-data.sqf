[_faction] call BRM_FMK_fnc_loadout;

#include "\broma_framework\loadouts\includes\default-equipment.sqf"

if (_assignLoadoutMode) then {
	if (_UAVBAg == "auto") then { _UAVBag = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 0) };
	if (_UAVTerminal == "auto") then { _UAVTerminal = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 1) };

	[_factionStructure, true] call BRM_FMK_fnc_loadout;
};

#include "\broma_framework\loadouts\includes\default-values.sqf"
