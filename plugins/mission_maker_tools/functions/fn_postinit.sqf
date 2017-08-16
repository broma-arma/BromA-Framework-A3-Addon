if (isMultiplayer) exitWith {};

player addAction ["Stop AI", {{ _x stop true } forEach allUnits}, "", 0, false, true];
player addAction ["Initialize all AI", {
    { if (!(isPlayer _x)&&(_x isKindOf "CAManBase")) then {[_x, "auto"] call BRM_FMK_fnc_initAI}} forEach allUnits;
}, "", 0, false, true];
player addAction ["Open Virtual Arsenal", {["Open",true] spawn BIS_fnc_arsenal}, "", 0, false, true];