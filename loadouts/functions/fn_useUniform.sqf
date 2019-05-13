_unit = (_this select 0);
_headgear = (_this select 1);
_uniform = (_this select 2);
_vest = (_this select 3);
_backpack = (_this select 4);

switch(_headgear) do {
    case ("keep"): {};
    case ("empty"): { removeHeadgear _unit };
    default {removeHeadgear _unit; _unit addHeadgear _headgear };
};
switch(_uniform) do {
    case ("keep"): {};
    case ("empty"): { removeUniform _unit };
    default { removeUniform _unit; [[{}, _unit forceaddUniform _uniform], "BIS_fnc_spawn", true] call BIS_fnc_MP }
};
switch(_vest) do {
    case ("keep"): {};
    case ("empty"): { removeVest _unit };
    default { removeVest _unit; _unit addVest _vest};
};
switch(_backpack) do {
    case ("keep"): {};
    case ("empty"): { removeBackpack _unit };
    default { removeBackpack _unit; [_unit, _backpack] call BRM_FMK_fnc_addEmptyBackpack };
};
