if (!isServer) exitWith {};

private ["_victoryText","_victory"];

_result = [];

_AVictory = {
	_result set [1, "AlertBLU"];
	match_points_a = match_points_a + 1;
	publicVariable "match_points_a";

	["LOCAL", "CHAT", "BLUFOR victory.", BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;

	_victory = [selectRandom BRM_FMK_Plugin_RoundSystem_victoryMessageA, side_a_name];
};

_BVictory = {
	_result set [1, "AlertOP"];
	match_points_b = match_points_b + 1;
	publicVariable "match_points_b";

	["LOCAL", "CHAT", "OPFOR victory.", BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;

	_victory = [selectRandom BRM_FMK_Plugin_RoundSystem_victoryMessageB, side_b_name];
};

_CVictory = {
	_result set [1, "AlertIND"];
	match_points_c = match_points_c + 1;
	publicVariable "match_points_c";

	["LOCAL", "CHAT", "INDFOR victory.", BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;

	_victory = [selectRandom BRM_FMK_Plugin_RoundSystem_victoryMessageC, side_c_name];
};

_DrawVictory = {
	_result set [1, "Alert"];
	_victory = [selectRandom BRM_FMK_Plugin_RoundSystem_drawMessage, ""];

	["LOCAL", "CHAT", "Draw.", BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;
};

switch (round_end_reason) do {
	case "OBJECTIVE": {
		switch (true) do {
			case (call BRM_FMK_Plugin_RoundSystem_victoryA): { [] call _AVictory };
			case (call BRM_FMK_Plugin_RoundSystem_victoryB): { [] call _BVictory };
			case (call BRM_FMK_Plugin_RoundSystem_victoryC): { [] call _CVictory };
		};
	};
	case "DEATH": {
		switch (true) do {
			case (!(side_a_side in round_dead_sides)): { [] call _AVictory };
			case (!(side_b_side in round_dead_sides)): { [] call _BVictory };
			case (!(side_c_side in round_dead_sides)): { [] call _CVictory };
		};
	};
	case "TIME": {

		switch (typeName BRM_FMK_Plugin_RoundSystem_timeoutScoring) do {
			case ("STRING"): {
				switch (BRM_FMK_Plugin_RoundSystem_timeoutScoring) do {
					case ("DRAW"): { [] call _DrawVictory };
					case ("SCORE"): {
						_Aunits = {(side _x == side_a_side)} count (allUnits);
						_Bunits = {(side _x == side_b_side)} count (allUnits);
						_Cunits = {(side _x == side_c_side)} count (allUnits);

						if (_Aunits==0) then {_Aunits=1};
						if (_Bunits==0) then {_Bunits=1};
						if (_Cunits==0) then {_Cunits=1};

						_percentA = floor ((100/_Aunits) * BRM_FMK_Plugin_RoundSystem_roundDeaths#0);
						_percentB = floor ((100/_Bunits) * BRM_FMK_Plugin_RoundSystem_roundDeaths#1);
						_percentC = floor ((100/_Cunits) * BRM_FMK_Plugin_RoundSystem_roundDeaths#2);

						["LOCAL", "CHAT", format ["A: %1(%4) | B: %2(%5) | C: %3(%6)", _Aunits, _Bunits, _Cunits, _percentA, _percentB, _percentC], BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;

						_lowest = selectMin [_percentA,_percentB,_percentC];

						if (_percentA == _percentB) then {
							if ((_percentC == _lowest)&&(mission_enable_side_c)) then {
								[] call _CVictory;
							} else {
								[] call _DrawVictory;
							};
						} else {
							switch (true) do {
								case (_percentA == _lowest): { [] call _AVictory };
								case (_percentB == _lowest): { [] call _BVictory };
								case ((_percentC == _lowest)&&(mission_enable_side_c)): { [] call _CVictory };
								default { [] call _DrawVictory };
							};
						};
					};
				};
			};
			case ("SIDE"): {
				switch (BRM_FMK_Plugin_RoundSystem_timeoutScoring) do {
					case (side_a_side): { [] call _AVictory };
					case (side_b_side): { [] call _BVictory };
					case (side_c_side): { [] call _CVictory };
				};
			};
		};
	};
};

switch (true) do {
	case (match_points_a >= BRM_FMK_Plugin_RoundSystem_roundsNeeded): { match_ending_winner = ["side_a_victory"] };
	case (match_points_b >= BRM_FMK_Plugin_RoundSystem_roundsNeeded): { match_ending_winner = ["side_b_victory"] };
	case (match_points_c >= BRM_FMK_Plugin_RoundSystem_roundsNeeded): { match_ending_winner = ["side_c_victory"] };
};

_victoryText = format[_victory select 0, _victory select 1];
_result set [0, _victoryText];

_result

/*

{ if ((side _x == east)&&(random(100) > 50)) then { _x setDamage 1 } } forEach allUnits;

*/
