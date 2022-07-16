[_faction] call BRM_FMK_fnc_loadout;

// TODO 'Cache' mod file
private _modPath = format ["mission\loadouts\mods\%1.sqf", _factionID];
if (fileExists _modPath) then {
	call compile preprocessFileLineNumbers _modPath;
};

#include "\broma_framework\loadouts\includes\default-equipment.sqf"

if (_assignLoadoutMode) then {
	if (_UAVBAg == "auto") then { _UAVBag = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 0) };
	if (_UAVTerminal == "auto") then { _UAVTerminal = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 1) };

	[_factionStructure, true] call BRM_FMK_fnc_loadout;
};

#include "\broma_framework\loadouts\includes\default-values.sqf"
