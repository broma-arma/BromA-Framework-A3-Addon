if !(hasInterface) exitWith {};

params [["_set", true, [true]]];

if (_set) then {
	if (["Initialize", [player] + ([] call BRM_FMK_VanillaSpectator_fnc_getSettings)] call BIS_fnc_EGSpectator) then {
		[] call BRM_FMK_VanillaSpectator_fnc_centerOnTarget;
	};
} else {
	["Terminate"] call BIS_fnc_EGSpectator;
};
