if !(isMultiplayer && isServer && mission_cas_cap != -1) exitWith {};

#include "includes\settings.sqf"

private _casBLU = call compile format ["%1", casualty_group_BLU];
private _casOP = call compile format ["%1", casualty_group_OP];
private _casIND = call compile format ["%1", casualty_group_IND];

private _casA = switch (side_a_side) do {
    case WEST: { _casBLU };
    case EAST: { _casOP };
    case RESISTANCE: { _casIND };
    default { _casBLU };
};

private _casB = switch (side_b_side) do {
    case WEST: { _casBLU };
    case EAST: { _casOP };
    case RESISTANCE: { _casIND };
    default { _casOP };
};

private _casC = switch (side_c_side) do {
    case WEST: { _casBLU };
    case EAST: { _casOP };
    case RESISTANCE: { _casIND };
    default { _casIND };
};

[{
    params ["_casA", "_casB", "_casC"];

    if (mission_game_mode == "tvt") then {
        [_casA, mission_cas_cap, endings_tvt_auto] call BRM_FMK_f_cas_cap_fnc_CasualtiesCapCheck;
        [_casB, mission_cas_cap, endings_tvt_auto] call BRM_FMK_f_cas_cap_fnc_CasualtiesCapCheck;

        if (mission_enable_side_c) then {
            [_casC, mission_cas_cap, endings_tvt_auto] call BRM_FMK_f_cas_cap_fnc_CasualtiesCapCheck;
        };
    } else { [_casA, mission_cas_cap, endings_defeat] call BRM_FMK_f_cas_cap_fnc_CasualtiesCapCheck };
}, [_casA, _casB, _casC], 5] call CBA_fnc_waitAndExecute;
