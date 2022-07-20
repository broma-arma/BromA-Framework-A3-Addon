if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) then {
	sideAcondition = false;
	sideBcondition = false;
	sideCcondition = false;
} else {
	BRM_RoundSystem_conditionA = false;
	BRM_RoundSystem_conditionB = false;
	BRM_RoundSystem_conditionC = false;
};

round_dead_sides = [];

round_end_reason = [];

cache_deaths_a = cache_deaths_a + mission_dead_side_A;
cache_deaths_b = cache_deaths_b + mission_dead_side_B;
cache_deaths_c = cache_deaths_c + mission_dead_side_C;

mission_dead_side_A = 0;
mission_dead_side_B = 0;
mission_dead_side_C = 0;
