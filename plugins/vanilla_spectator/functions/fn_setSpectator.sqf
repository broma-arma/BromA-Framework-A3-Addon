/*
    Start or stop spectating.
*/

params [["_set", true, [true]]];

if (_set) then {
	private _initialized = ["Initialize", [player] + BRM_FMK_Plugin_VanillaSpectator_settings] call BIS_fnc_EGSpectator;
	if (_initialized) then {
		[] call BRM_FMK_Plugin_VanillaSpectator_fnc_centerOnTarget;
	};
} else {
	["Terminate"] call BIS_fnc_EGSpectator;
};
