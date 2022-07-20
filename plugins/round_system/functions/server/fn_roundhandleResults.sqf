if (!isServer) exitWith {};

private ["_victoryText","_victory"];

_result = [];

[] call BRM_FMK_Round_System_fnc_getSettings select 9 params ["_winMessageA", "_winMessageB", "_winMessageC"];

_AVictory = {
    _result set [1, "AlertBLU"];
    match_points_a = match_points_a + 1;
    publicVariable "match_points_a";

    ["LOCAL", "CHAT", "BLUFOR victory.", ROUND_SYSTEM_DEBUG] call BRM_FMK_fnc_doLog;

    _victory = [_winMessageA, side_a_name];
};

_BVictory = {
    _result set [1, "AlertOP"];
    match_points_b = match_points_b + 1;
    publicVariable "match_points_b";

    ["LOCAL", "CHAT", "OPFOR victory.", ROUND_SYSTEM_DEBUG] call BRM_FMK_fnc_doLog;

    _victory = [_winMessageB, side_b_name];
};

_CVictory = {
    _result set [1, "AlertIND"];
    match_points_c = match_points_c + 1;
    publicVariable "match_points_c";

    ["LOCAL", "CHAT", "INDFOR victory.", ROUND_SYSTEM_DEBUG] call BRM_FMK_fnc_doLog;

    _victory = [_winMessageC, side_c_name];
};

_DrawVictory = {
    _result set [1, "Alert"];
    _victory = [[] call BRM_FMK_Round_System_fnc_getSettings select 8, ""];

    ["LOCAL", "CHAT", "Draw.", ROUND_SYSTEM_DEBUG] call BRM_FMK_fnc_doLog;
};

[] call BRM_FMK_Round_System_fnc_getSettings select 7 params ["_victoryConditionA", "_victoryConditionB", "_victoryConditionC"];

switch (round_end_reason) do {
    case "OBJECTIVE": {
        switch (true) do {
            case (call _victoryConditionA): { [] call _AVictory };
            case (call _victoryConditionB): { [] call _BVictory };
            case (call _victoryConditionC): { [] call _CVictory };
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
		private _winner = [] call BRM_FMK_Round_System_fnc_getSettings select 4;
        switch (typeName _winner) do {
            case ("STRING"): {
                switch (_winner) do {
                    case ("DRAW"): { [] call _DrawVictory };
                    case ("SCORE"): {
                        _Aunits = {(side _x == side_a_side)} count (allUnits);
                        _Bunits = {(side _x == side_b_side)} count (allUnits);
                        _Cunits = {(side _x == side_c_side)} count (allUnits);

                        if(_Aunits==0)then{_Aunits=1};if(_Bunits==0)then{_Bunits=1};if(_Cunits==0)then{_Cunits=1};

                        _percentA = floor ((100/_Aunits) * mission_dead_side_A);
                        _percentB = floor ((100/_Bunits) * mission_dead_side_B);
                        _percentC = floor ((100/_Cunits) * mission_dead_side_C);

                        ["LOCAL", "CHAT", format ["A: %1(%4) | B: %2(%5) | C: %3(%6)", _Aunits, _Bunits, _Cunits, _percentA, _percentB, _percentC], ROUND_SYSTEM_DEBUG] call BRM_FMK_fnc_doLog;

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
                switch (_winner) do {
                    case (side_a_side): { [] call _AVictory };
                    case (side_b_side): { [] call _BVictory };
                    case (side_c_side): { [] call _CVictory };
                };
            };
        };
    };
};

switch (true) do {
    case (match_points_a >= BRM_round_system_rounds_needed): { match_ending_winner = ["side_a_victory"] };
    case (match_points_b >= BRM_round_system_rounds_needed): { match_ending_winner = ["side_b_victory"] };
    case (match_points_c >= BRM_round_system_rounds_needed): { match_ending_winner = ["side_c_victory"] };
};

_victoryText = format[_victory select 0, _victory select 1];
_result set [0, _victoryText];

_result

/*

{ if ((side _x == east)&&(random(100) > 50)) then { _x setDamage 1 } } forEach allUnits;

*/
