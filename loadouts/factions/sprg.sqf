/*
    SPRG Report is the most dedicated team of impetuous war-crawlers, ready to turn
    massacres and genocides into coverage for the highest paying news station.

    Ever since the conflict between CSAT and NATO broke out, their schedule has
    been very, very busy.
*/

_factionID = "SPRG";
_factionName = "SPRG Report";
//_factionStructure = "";

_factionCallsigns = ["Reporter"];

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceWhite];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "civilian";

if (!_assignLoadoutMode) exitWith {};
switch (true) do {
	case (_type == "reporter"): {
		private _helmets = [
			"H_Cap_press", 0.25,
			"", 0.75
		];
		if (isDLCAvailable 571710) then { // Laws of War
			_helmets append [
				"H_PASGT_basic_blue_press_F", 1.4,
				"H_PASGT_neckprot_blue_press_F", 1.1
			]
		};

		private _uniform = switch (true) do {
			case (isDLCAvailable 1325500): { "U_C_FormalSuit_01_black_F" };
			case (isClass (configFile >> "CfgPatches" >> "UK3CB_Factions_CHC_C")): { "UK3CB_CHC_C_U_FUNC_01" };
			default { "U_C_Journalist" };
		};

		[_unit, selectRandomWeighted _helmets, _uniform, "V_Press_F", ""] call BRM_FMK_fnc_useUniform;
	};

	case (_type == "cameraman"): {
		private _helmets = ["H_Cap_press", 1];
		if (isDLCAvailable 571710) then { // Laws of War
			_helmets append [
				"H_PASGT_basic_blue_press_F", 5,
				"H_PASGT_neckprot_blue_press_F", 4
			];
		};

		[_unit, selectRandomWeighted _helmets, "U_C_Journalist", "V_Press_F", ""] call BRM_FMK_fnc_useUniform;
		_unit addWeapon (["Laserdesignator_02_ghex_F", "R3F_JIM_LR"] select isClass (configFile >> "CfgPatches" >> "r3f_armes_c"));
	};
};

// ADDS ESSENTIALS =============================================================
[_unit, [[_NVGEN1, 1]]] call BRM_FMK_fnc_addtoUniform;
[_unit, ["ItemMap", "ItemCompass", "ItemWatch"]] call BRM_FMK_fnc_linkItem;
