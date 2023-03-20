diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_unit", "_killer", "_instigator", "_useEffects"];

if (random 1 >= 0.5) then {
	playSound3D [format ["\broma_framework\plugins\ai_spawner\sounds\killed%1.ogg", floor random 20 + 1], _unit, false, getPosASL _unit, 5, 1, 100];
};
