if (isNil "DEPRECATED_BRM_FMK_f_cas_cap_fnc_CasualtiesCapCheck") then {
	["Function is deprecated, use BRM_FMK_fnc_checkCasualties"] remoteExec ["BIS_fnc_error", 0];
	DEPRECATED_BRM_FMK_f_cas_cap_fnc_CasualtiesCapCheck = true;
};

if (!isServer) exitWith {};

params ["_grps", "_pc", "_end"];

private _sides = _grps apply { side _x };
{
	[_x, _pc / 100, { [_end] call BRM_FMK_fnc_endMission; }] call BRM_FMK_fnc_checkCasualties;
} forEach (_sides arrayIntersect _sides);
