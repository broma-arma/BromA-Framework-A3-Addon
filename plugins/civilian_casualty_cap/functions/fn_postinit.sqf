private _limit = ["p_dead_civies", -1] call BIS_fnc_getParamValue; // -1="Disabled", 1="1", 2="2", 3="3", 4="4", 5="5", 15="15", 30="30", 50="50", 100="100"

if (!isServer || _limit < 0) exitWith {};

if (isNil "responsible_sides") then { responsible_sides = [side_a_side, side_b_side]; };

BRM_FMK_Plugin_CivilianCasualtyCap_civsKilled = [0, 0, 0]; // Side A, B, C
BRM_FMK_Plugin_CivilianCasualtyCap_limit = _limit; // Side A, B, C

if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then {
	// ACE3's medical system causes the 'instigator' to be invalid.
	["Civilian", "init", BRM_FMK_Plugin_CivilianCasualtyCap_fnc_civInit, true, [], true] call CBA_fnc_addClassEventHandler;
} else {
	addMissionEventHandler ["EntityKilled", BRM_FMK_Plugin_CivilianCasualtyCap_fnc_civKilled];
};
