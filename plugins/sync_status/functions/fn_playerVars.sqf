private _playerVars = [[
	["unit_score", 0],
	["unit_deaths", 0]
]];

// Task Force Arrowhead Radio
if (mission_TFAR_enabled) then {
	_playerVars pushBack [
		// Variable name           Default       Custom load code (Optional)
		["tf_globalVolume",        1],
		["tf_voiceVolume",         1],
		["TFAR_LRSpeakersEnabled", true],
		["TFAR_SRSpeakersEnabled", true],
		["TFAR_forceSpectator",    false],
		["TFAR_spectatorName",     profileName]
		/* Local variables
		["tf_unable_to_use_radio", false]
		*/
	]
};

// Advanced Combat Radio Environment 2
if (mission_ACRE2_enabled) then {
	_playerVars pushBack [
		// Variable name               Default  Custom load code (Optional)
		["acre_sys_core_isDisabled",   false],
		["acre_sys_core_globalVolume", 1]
	]
};

// Advanced Combat Environment 3
if (mission_ACE3_enabled) then {
	_playerVars pushBack [
		// Variable name                     Default  Custom load code (Optional)                                                 Custom save code (Optional)
		["ACE_captives_isHandcuffed",        false,   { if (_value) then { [player, true] call ACE_captives_fnc_setHandcuffed };                                                 }],
		["ACE_hasEarPlugsin",                false,   { if (_value) then { [player] call ace_hearing_fnc_putInEarplugs };                                                        }],
		[nil,                                nil,     { [player, _value] call ace_medical_fnc_deserializeState },                 { [_unit] call ace_medical_fnc_serializeState }],

		["ACE_medical_isLimping",            false],

		["brm_ace_secondChances",            -1]
	]
};

// stash_nvg
if (isClass (configFile >> "CfgPatches" >> "ace_stash_nvg")) then {
	_playerVars pushBack [
		// Variable name       Default  Custom load code (Optional)
		["ACE_stash_nvg_NVG",    ""]
	]
};

_playerVars
