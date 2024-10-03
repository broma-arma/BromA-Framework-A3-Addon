if (isMultiplayer) exitWith {};

player addAction ["Stop AI", { { _x stop true; } forEach allUnits }, nil, 0, false];
player addAction ["Initialize all AI", { { if (!isPlayer _x && _x isKindOf "CAManBase") then { [_x, "auto"] call BRM_FMK_fnc_initAI } } forEach allUnits; }, nil, 0, false];
player addAction ["Open Virtual Arsenal", { ["Open", true] call BIS_fnc_arsenal }, nil, 0, false];
if (mission_ACE3_enabled) then {
	player addAction ["Open ACE Arsenal", { [player, player, true] call ace_arsenal_fnc_openBox }, nil, 0, false];
};
