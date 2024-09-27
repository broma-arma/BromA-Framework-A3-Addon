if (!hasInterface) exitWith {};

hint "";

[player, toLower (str (player call BIS_fnc_objectSide))] call BRM_FMK_fnc_assignLoadout;

player setDamage 0;

if (mission_ACE3_enabled) then {
	player setVariable ["ace_medical_triageLevel", 0, true];
	[player] call ace_medical_treatment_fnc_fullHealLocal;
	player switchMove "";
};

_respawn = [] call BRM_FMK_Plugin_RoundSystem_fnc_moveToRespawn;

[_respawn, round_setup_size, round_seconds_between, [side player, "side"] call BRM_FMK_fnc_getSideInfo] spawn BRM_FMK_Plugin_RoundSystem_fnc_setupZone;

player allowDamage true;

["Alert",[format ["ROUND %1 IS ABOUT TO START!", match_current_round]]] call BIS_fnc_showNotification;
