private _playerVars = [];

// Task Force Arrowhead Radio
if (mission_TFAR_enabled) then {
	_playerVars pushBack [
		// Variable name           Default       Custom load code (Optional
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
		// Variable name               Default  Custom load code (Optional
		["acre_sys_core_isDisabled",   false],
		["acre_sys_core_globalVolume", 1]
	]
};

// Advanced Combat Environment 3
if (mission_ACE3_enabled) then {
	_playerVars pushBack [
		// Variable name                     Default                            Custom load code (Optional)
		["ACE_isDead",                       false],
		["ACE_isUnconscious",                false,                             { if (_value) then { [player, true] call ace_medical_fnc_setUnconscious }; }],
		["ACE_captives_isHandcuffed",        false,                             { if (_value) then { [player, true] call ACE_captives_fnc_setHandcuffed }; }],
		["ACE_hasEarPlugsin",                false,                             { if (_value) then { [player] call ace_hearing_fnc_putInEarplugs }; }],
		["ACE_medical_pain",                 0],
		["ACE_medical_morphine",             0],
		["ACE_medical_bloodVolume",          100],
		["ACE_medical_tourniquets",          [0, 0, 0, 0, 0, 0]],
		["ACE_medical_occludedMedications",  []],
		["ACE_medical_openWounds",           []],
		["ACE_medical_bandagedWounds",       []],
		["ACE_medical_internalWounds",       []],
		["ACE_medical_lastUniqueWoundID",    1],
		["ACE_medical_fractures",            []],
		["ACE_medical_triageLevel",          0],
		["ACE_medical_triageCard",           []],
		["ACE_medical_ivBags",               []],
		["ACE_medical_bodyPartStatus",       [0, 0, 0, 0, 0, 0]],
		["ACE_medical_addedToUnitLoop",      false],
		["ACE_medical_inCardiacArrest",      false],
		["ACE_medical_hasLostBlood",         0],
		["ACE_medical_isBleeding",           false],
		["ACE_medical_hasPain",              false],
		["ACE_medical_amountOfReviveLives",  ACE_medical_amountOfReviveLives],
		["ACE_medical_painSuppress",         0],
		["ACE_medical_allLogs",              []],
		["ACE_medical_inReviveState",        false]
		/* Local variables
		["ACE_medical_bleedingCoefficient",  ACE_medical_bleedingCoefficient],
		["ACE_medical_heartRate",            80],
		["ACE_medical_heartRateAdjustments", []],
		["ACE_medical_bloodPressure",        [80, 120]],
		["ACE_medical_peripheralResistance", 100],
		["ACE_medical_airwayStatus",         100],
		["ACE_medical_airwayOccluded",       false],
		["ACE_medical_airwayCollapsed",      false],
		["ACE_medical_allUsedMedication",    []],
		*/
	]
};

// stash_nvg
if (isClass (configFile >> "CfgPatches" >> "ace_stash_nvg")) then {
	_playerVars pushBack [
		// Variable name       Default  Custom load code (Optional
		["ACE_stashed_NVG",    ""]
	]
};

_playerVars
