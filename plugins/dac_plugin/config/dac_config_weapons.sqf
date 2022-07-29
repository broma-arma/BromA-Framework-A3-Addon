if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	DAC_fConfigWeapons = compile preprocessFileLineNumbers "dac\dac_config_weapons.sqf";
	_this call DAC_fConfigWeapons
};

params ["_index"];

private ["_weapons", "_magazines"];

switch (_index) do {
	case 1: {
		_weapons = ["AK_107_GL_pso", "Binocular", "ItemCompass", "ItemMap"];
		_magazines = [["30Rnd_545x39_AK", 6], ["1Rnd_HE_GP25", 6], ["FlareWhite_GP25", 2], ["HandGrenade_East", 2]];
	};
	case 2: {
		_weapons = ["AK_107_pso", "ItemCompass", "ItemMap"];
		_magazines = [["30Rnd_545x39_AK", 8], ["HandGrenade_East", 2]];
	};
	case 3: {
		_weapons = ["Pecheneg", "ItemCompass", "ItemMap"];
		_magazines = [["100Rnd_762x54_PK", 5]];
	};
	case 4: {
		_weapons = ["RPK_74", "ItemCompass", "ItemMap"];
		_magazines = [["75Rnd_545x39_RPK", 8], ["HandGrenade_East", 2]];
	};
	case 5: {
		_weapons = ["AK_107_pso", "RPG7V", "ItemCompass", "ItemMap"];
		_magazines = [["30Rnd_545x39_AK", 6], ["PG7VL", 3]];
	};
	case 6: {
		_weapons = ["SVD", "ItemCompass", "ItemMap"];
		_magazines = [["10Rnd_762x54_SVD", 8]];
	};
};

if (isNil "BRM_FMK_DAC_cfgWeapons") then {
	BRM_FMK_DAC_cfgWeapons = if (fileExists "dac\dac_config_weapons.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_weapons.sqf" } else { {} };
};
call BRM_FMK_DAC_cfgWeapons;

if (DAC_Basic_Value != 5 && (isNil "_weapons" || isNil "_magazines")) exitWith {
	DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
	systemChat "Error: DAC_Config_Weapons > No valid config number";
};

[_weapons, _magazines]
