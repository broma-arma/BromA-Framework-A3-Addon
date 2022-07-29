[
	"round_system",
	[10, [0], "round_setup_size"], // area
	[10, [0], "round_prep_time_seconds"], // prep
	[15, [0], "round_seconds_between"], // cooldown
	[[1, 5, 15, 30], [[]], "round_alerted_minutes", { _this apply { _x * 60 } }], // alert
	["SCORE", [""], "round_timeout_winner"], // winner
	["NOTIFICATION", [""], "round_end_notification"], // notification
	[true, [true], "round_display_score"], // score
	[[], [[]], [ // condition
		[{ BRM_RoundSystem_conditionA }, [{}, ""], "round_side_a_victory_con", { if (_this isEqualType "") exitWith { compile _this }; _this }], // A
		[{ BRM_RoundSystem_conditionB }, [{}, ""], "round_side_b_victory_con", { if (_this isEqualType "") exitWith { compile _this }; _this }], // B
		[{ BRM_RoundSystem_conditionC }, [{}, ""], "round_side_c_victory_con", { if (_this isEqualType "") exitWith { compile _this }; _this }] // C
	]],
	["The round has ended in a draw!", ["", []], "draw_messages", { if (_this isEqualType []) exitWith { _this select 0 }; _this }], // draw
	[[], [[]], [ // win
		["%1 have won the round!", ["", []], "win_messages_a", { if (_this isEqualType []) exitWith { _this select 0 }; _this }], // A
		["%1 have won the round!", ["", []], "win_messages_b", { if (_this isEqualType []) exitWith { _this select 0 }; _this }], // B
		["%1 have won the round!", ["", []], "win_messages_c", { if (_this isEqualType []) exitWith { _this select 0 }; _this }] // C
	]]
] call BRM_FMK_fnc_getPluginSettings;
