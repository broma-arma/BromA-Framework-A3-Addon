[
	"ch_view_distance",
	[mission_game_mode == "coop", [0], "CHVD_allowNoGrass"], // grass
	[12000, [0], "CHVD_maxView"], // terrain
	[12000, [0], "CHVD_maxObj"] // object
] call BRM_FMK_fnc_getPluginSettings
