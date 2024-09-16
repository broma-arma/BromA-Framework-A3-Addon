#define QUOTE(TEXT) #TEXT

#define HIGHLIGHT(TEXT,COLOR) QUOTE(<font color='#COLOR'>TEXT</font>)
#define HIGHLIGHT_RED(TEXT) HIGHLIGHT(TEXT,FFCCCC)
#define HIGHLIGHT_YELLOW(TEXT) HIGHLIGHT(TEXT,FFFFCC)

#define CONFIG_ASTERISK " <font color='#FFCC00'>*</font>"
#define CONFIG_NOTE CONFIG_ASTERISK + " Configurable, could change from mission to mission."

player createDiarySubject ["ACE 3", "ACE 3 Medical", "\z\ace\addons\medical_gui\data\categories\triage_card.paa"];

private _medicType = player getVariable ["ace_medical_medicClass", parseNumber (player getUnitTrait "medic")];
private _isMedic = _medicType > 0;
private _isDoctor = _medicType > 1;

private _fnc_medicItem = {
	params ["_setting"];
	private _text = (["Anyone", "Only medics", "Only doctors"] select _setting) + " can use";
	if (_medicType < _setting) then {
		_text = HIGHLIGHT_RED(" + _text + ");
	};
	_text
};

private _bleedingScale = [
	[0, "No"],
	[0.001, "Extremely slow"],
	[0.01, "Slow"],
	[0.05, "Medium"],
	[0.1, "Fast"],
	[0.2, "Extremely fast"]
];
private _painScale = ["None", "Mild", "Minor", "Uncomfortable", "Moderate", "Distracting", "Distressing", "Severe", "Intense", "Excruciating", "Unspeakable"];
private _woundsInfo = createHashMapFromArray [
	["Abrasion", ["Scrape", "Skin is rubbed away by friction against another rough surface. Also known as an abrasion."]],
	["Avulsion", ["Avulsion", "Occur when an entire structure or part of it is forcibly pulled away, such as the loss of a permanent tooth or an ear lobe."]],
	["Contusion", ["Bruise", "Result of a forceful trauma that injures an internal structure without breaking the skin. Also known as a contusion."]],
	["Crush", ["Crushed Tissue", "Occur when a heavy object falls onto a person, splitting the skin and shattering or tearing underlying structures."]],
	["Cut", ["Cut", "Slicing wound made with a sharp instrument, leaving even edges."]],
	["Laceration", ["Tear", "Separating wound that produce ragged edges. Also known as a laceration."]],
	["VelocityWound", ["Velocity Wound", "Caused by an object entering the body at a high speed."]],
	["PunctureWound", ["Puncture Wound", "Deep, narrow wound produced by sharp objects such as nails, knives, and broken glass."]],
	["ThermalBurn", ["Thermal Burn", "Caused by making or being in contact with heat."]]
];

private _woundSources = createHashMap;

{
	private _configName = configName _x; // bullet, grenade, explosive, shell, vehiclehit, vehiclecrash, collision, falling, backblast, stab, punch, ropeburn, burn, unknown
	if (_configName == "woundHandlers") then { continue; };
	if (_configName == "unknown") then { _configName = "other"; };
	if (_configName == "vehiclehit") then { _configName = "vehicle hit"; };
	if (_configName == "vehiclecrash") then { _configName = "vehicle crash"; };
	if (_configName == "backblast") then { _configName = "back-blast"; };
	{
		private _woundType = configName _x;
		if (_woundType == "woundHandlers") then {continue};
		_woundSources getOrDefault [_woundType, [], true] pushBack _configName;
	} forEach configProperties [_x, "isClass _x"];
} forEach configProperties [configFile >> "ACE_Medical_Injuries" >> "damageTypes", "isClass _x"];

private _lines = ["Note: Bleeding and pain is for the worst possible wound of that type.", ""];

{
	private _configName = configName _x;
	_woundsInfo get _configName params [["_name", _configName], ["_description", ""]];

	_lines pushBack "<font color='#FFFF00' size='15' face='RobotoCondensedBold'>" + _name + "</font> - " + _description;

	private _bleeding = getNumber (_x >> "bleeding");
	_bleeding = _bleedingScale findIf { _bleeding <= _x#0 };
	if (_bleeding == -1) then { _bleeding = count _bleedingScale - 1; };
	_r = linearConversion [0, count _bleedingScale - 1, _bleeding, 1, 1, true];
	_gb = linearConversion [0, count _bleedingScale - 1, _bleeding, 1, 0, true];
	_lines pushBack "    <font color='" + ([_r, _gb, _gb] call BIS_fnc_colorRGBtoHTML) + "'>" + (_bleedingScale#_bleeding#1) + " bleeding</font>";

	private _pain = round (getNumber (_x >> "pain") * 10);
	_r = linearConversion [0, count _painScale - 1, _pain, 1, 1, true];
	_gb = linearConversion [0, count _painScale - 1, _pain, 1, 0, true];
	_lines pushBack "    <font color='" + ([_r, _gb, _gb] call BIS_fnc_colorRGBtoHTML) + "'>" + (_painScale select _pain) + " pain</font>";

	private _causes = [];
	if (getNumber (_x >> "causeLimping") == 1) then { _causes pushBack "limping"; };
	if (getNumber (_x >> "causeFracture") == 1) then { _causes pushBack "fractures"; };
	if (_causes isNotEqualTo []) then {
		_lines pushBack "    Causes " + (_causes call BRM_FMK_fnc_verboseArray) + "";
	};

	private _sources = _woundSources getOrDefault [_configName, []];
	if (_sources isNotEqualTo []) then {
		_lines pushBack "    Sources: " + (_sources call BRM_FMK_fnc_verboseArray) + "";
	};

	_lines pushBack "";
} forEach configProperties [configFile >> "ACE_Medical_Injuries" >> "wounds", "isClass _x"];

player createDiaryRecord ["ACE 3", ["Wounds", _lines joinString "<br/>", "\z\ace\addons\medical_feedback\data\fracture.paa"], taskNull, "NONE", false];

// =============================================================================

private _medicationDefaults = configFile >> "ace_medical_treatment" >> "Medication";
_medicationDefaults = createHashMapFromArray [
	["painReduce", getNumber (_medicationDefaults >> "painReduce")],
	["timeInSystem", getNumber (_medicationDefaults >> "timeInSystem")],
	["timeTillMaxEffect", getNumber (_medicationDefaults >> "timeTillMaxEffect")],
	["maxDose", getNumber (_medicationDefaults >> "maxDose")],
	["maxDoseDeviation", getNumber (_medicationDefaults >> "maxDoseDeviation")],
	["viscosityChange", getNumber (_medicationDefaults >> "viscosityChange")],
	["hrIncreaseLow", getArray (_medicationDefaults >> "hrIncreaseLow")],
	["hrIncreaseNormal", getArray (_medicationDefaults >> "hrIncreaseNormal")],
	["hrIncreaseHigh", getArray (_medicationDefaults >> "hrIncreaseHigh")],
	["incompatibleMedication", getArray (_medicationDefaults >> "incompatibleMedication")]
];

private _drugsInfo = createHashMapFromArray [
	["Morphine", ["FFFF00", nil, "Used to combat moderate to severe pain experiences"]],
	["Epinephrine", ["00FFFF", nil, "Used to increases heart rate, assist with cardiac arrest, and counter anaphylactic shock"]],
	["Adenosine", ["00FF00", nil, "Used to decrease heart rate and counter effects of Epinephrine"]],
	["PainKillers", ["CCCC00", "Painkillers", "Used to combat light to moderate pain experiences"]]
];

if (ace_medical_treatment_advancedMedication) then {
	_lines = [];

#define CFG_MED_NUMBER(CONFIG,ATTRIBUTE) (if (isNumber (CONFIG >> ATTRIBUTE)) then { getNumber (CONFIG >> ATTRIBUTE) } else { _medicationDefaults get ATTRIBUTE })
#define CFG_MED_ARRAY(CONFIG,ATTRIBUTE) (if (isArray (CONFIG >> ATTRIBUTE)) then { getArray (CONFIG >> ATTRIBUTE) } else { _medicationDefaults get ATTRIBUTE })
	{
		private _configName = configName _x;
		_drugsInfo get _configName params ["_color", ["_name", _configName], ["_description", ""]];
		_lines pushBack "<font color='#FFFF00' size='15' face='RobotoCondensedBold'>" + _name + "</font> - " + _description;

		if (_configName == "Epinephrine") then {
			_lines pushBack "    " + (ace_medical_treatment_medicEpinephrine call _fnc_medicItem) + CONFIG_ASTERISK;
		};

		private _painReduce = CFG_MED_NUMBER(_x,"painReduce");
		if (_painReduce != 0) then {
			_lines pushBack format ["    %1creases pain by %2%3.", ["In", "De"] select (_painReduce > 0), abs _painReduce * 100, "%"];
		};

		_lines pushBack format ["    Takes %1 to fully take effect and lasts for %2.",
			[CFG_MED_NUMBER(_x,"timeTillMaxEffect"), "M:SS", "long"] call BRM_FMK_fnc_formatElapsedTime,
			[CFG_MED_NUMBER(_x,"timeInSystem"), "M:SS", "long"] call BRM_FMK_fnc_formatElapsedTime
		];

		private _max = CFG_MED_NUMBER(_x,"maxDose");
		if (_max > 0) then {
			private _maxDeviation = CFG_MED_NUMBER(_x,"maxDoseDeviation");
			if (_maxDeviation > 0) then {
				_lines pushBack format ["    Chance to overdose if take more than %1. Overdose if take more than %2.", _max, _max + _maxDeviation];
			} else {
				_lines pushBack format ["    Overdose if take more than %1.", _max];
			};
		};

		private _incompatible = CFG_MED_ARRAY(_x,"incompatibleMedication");
		if (_incompatible isNotEqualTo []) then {
			_lines pushBack "    Overdose if taken with " + (_incompatible apply { format ["%1x %2", _x#1 + 1, _x#0] } call BRM_FMK_fnc_verboseArray regexReplace [" and ", " or "]) + ".";
		};

		private _affectsHeartRate = false;
		{
			_x params ["_condition", "_min", "_max"];
			if (_min != 0 || _max != 0) then {
				if (!_affectsHeartRate) then {
					_lines pushBack "    Effects on heart rate (HR)";
					_affectsHeartRate = true;
				};
				private _change = "change";
				if (_min > 0 && _max > 0) then {
					_change = "increase";
				} else {
					if (_min < 0 && _max < 0) then {
						_change = "decrease";
						_min = abs _min;
						_max = abs _max;
					}
				};
				_lines pushBack format ["      %1: %2 HR by %3 to %4", _condition, _change, _min, _max];
			};
		} forEach [
			["&gt; 110"] + CFG_MED_ARRAY(_x,"hrIncreaseHigh"), // 110 < _heartRate
			["&gt;= 55"] + CFG_MED_ARRAY(_x,"hrIncreaseNormal"), // 55 <= _heartRate <= 110
			["&lt; 55"] + CFG_MED_ARRAY(_x,"hrIncreaseLow") // _heartRate < 55
		];

		private _viscosity = CFG_MED_NUMBER(_x,"viscosityChange");
		if (_viscosity != 0) then {
			_lines pushBack format ["    %1creases the viscosity of blood by %2%3.", ["De", "In"] select (_viscosity > 0), abs _viscosity, "%"];
		};

		_lines pushBack "";
	} forEach configProperties [configFile >> "ace_medical_treatment" >> "Medication", "isClass _x"];

	_lines pushBack CONFIG_NOTE;
} else {
	// https://github.com/acemod/ACE3/blob/fef34a82dc51d640ba3df82ccfcb228647998cb4/addons/medical_treatment/functions/fnc_medicationLocal.sqf#L33
	_lines append [
		"<font color='#FFFF00' size='15' face='RobotoCondensedBold'>Morphine</font>",
		"    Decreases pain by 60%.",
		"<font color='#00FFFF' size='15' face='RobotoCondensedBold'>Epinephrine</font>",
		"    Forces awake someone with stable vitals.", // https://github.com/acemod/ACE3/blob/fef34a82dc51d640ba3df82ccfcb228647998cb4/addons/medical_statemachine/Statemachine.hpp#L53
		"<font color='#CCCC00' size='15' face='RobotoCondensedBold'>Painkillers</font>",
		"    Decreases pain by 26%." // 26.25
	];
};

player createDiaryRecord ["ACE 3", ["Drugs", _lines joinString "<br/>", "\z\ace\addons\medical_treatment\ui\morphine_ca.paa"], taskNull, "NONE", false];

// =============================================================================

_lines = [
	"<font size='15' face='RobotoCondensedBold'>Tourniquet</font>",
	"    Used to temporarily stop blood flow to a limb until it can be bandaged",
	"    Causes pain after two minutes"
];

if (ace_medical_fractures > 0) then {
	_lines append ["",
		"<font size='15' face='RobotoCondensedBold'>Splint</font>",
		"    Used to fix a fractured limb.",
		"    " + HIGHLIGHT_YELLOW(Single use)
	];
};

_lines append ["",
	"<font size='15' face='RobotoCondensedBold'>Personal Aid Kit (PAK)</font>",
	"    Completely heals a patient"
];

if (isClass (configFile >> "CfgPatches" >> "brm_ace_main") && { brm_ace_main_conditionPAK != 2 }) then { // 2: Stable
	if (brm_ace_main_conditionPAK == 1) then { // Not Bleeding
		_lines pushBack "    Requires the patient to be not bleeding before use" + CONFIG_ASTERISK;
	} else { // Anytime
		_lines pushBack "    No requirements for use" + CONFIG_ASTERISK;
	};
} else {
	_lines append [
		"    Requires the patient to be in stable condition before use" + (["", CONFIG_ASTERISK] select isClass (configFile >> "CfgPatches" >> "brm_ace_main")),
		"    Stable condition: Alive, conscious, not bleeding, blood pressure >= 60/50, lost less than 15% blood, heart rate >= 40, lost less than 25% of heart output of blood"
	];
};

_lines append [
	"    " + (["Reusable", HIGHLIGHT_YELLOW(Single use)] select ace_medical_treatment_consumePAK) + CONFIG_ASTERISK,
	"    " + (ace_medical_treatment_medicPAK call _fnc_medicItem) + CONFIG_ASTERISK,
	"    " + (["Can be used anywhere", "Can be used at medical vehicles", "Can be used at medical facilities", "Can be used at medical vehicles & facilities", "Cannot be used anywhere"] select ace_medical_treatment_locationPAK) + CONFIG_ASTERISK,
	"    " + (["Cannot use on self", "Can use on self"] select ace_medical_treatment_allowSelfPAK) + CONFIG_ASTERISK
];

_lines append ["",
	"<font size='15' face='RobotoCondensedBold'>Blood Bags</font>",
	"    Saline IV, Blood IV and Plasma IV",
	"    All have the same effect",
	"    They increase blood pressure",
	"    Take a while to transfuse after applied",
	"    " + (ace_medical_treatment_medicIV call _fnc_medicItem) + CONFIG_ASTERISK,
	"    " + (["Can be used anywhere", "Can be used at medical vehicles", "Can be used at medical facilities", "Can be used at medical vehicles & facilities", "Cannot be used anywhere"] select ace_medical_treatment_locationIV) + CONFIG_ASTERISK,
	"    " + (["Cannot use on self", "Can use on self"] select ace_medical_treatment_allowSelfIV) + CONFIG_ASTERISK,
	"",
	"<font size='15' face='RobotoCondensedBold'>Surgical Kit</font>",
	"    Used to stitch wounds to prevent them re-opening",
	"    " + (["Reusable", HIGHLIGHT_YELLOW(Single use), "Uses sutures"] select ace_medical_treatment_consumeSurgicalKit) + CONFIG_ASTERISK,
	"    " + (ace_medical_treatment_medicSurgicalKit call _fnc_medicItem) + CONFIG_ASTERISK,
	"    " + (["Can be used anywhere", "Can be used at medical vehicles", "Can be used at medical facilities", "Can be used at medical vehicles & facilities", "Cannot be used anywhere"] select ace_medical_treatment_locationSurgicalKit) + CONFIG_ASTERISK,
	"    " + (["Cannot use on self", "Can use on self"] select ace_medical_treatment_allowSelfStitch) + CONFIG_ASTERISK
];

if (ace_medical_treatment_consumeSurgicalKit == 2) then {
	_lines append ["",
		"<font size='15' face='RobotoCondensedBold'>Suture</font>",
		"    Used by a Surgical Kit to close wounds"
	];
};

_lines append ["", CONFIG_NOTE];

player createDiaryRecord ["ACE 3", ["Equipment", _lines joinString "<br/>", "\z\ace\addons\medical_treatment\ui\personal_aid_kit_ca.paa"], taskNull, "NONE", false];

// =============================================================================

_lines = [];

if (isClass (configFile >> "CfgPatches" >> "brm_ace_main") && { brm_ace_main_conditionPAK != 2 }) then { // 0: PAK Anytime
	_lines append ["<font size='15' face='RobotoCondensedBold'>Heavily wounded:</font>", "Use a PAK (Personal Aid Kit)", ""];
};

_lines append [
	"<font size='15' face='RobotoCondensedBold'>Wounded:</font>",
	"1. Stop the bleeding",
	"    - Tourniquet limbs, if heavy bleeding"
];

private _step = 2;

if (ace_medical_treatment_advancedBandages > 0) then { // Advanced bandages
	if (ace_medical_treatment_advancedBandages > 1) then { // Can reopen
		_lines append [
			"    - Use Elastic, if " + (["someone with a surgical kit", "a medic", "a doctor"] select (ace_medical_treatment_medicSurgicalKit - 1)) + " is near by and will be available to stitch within a minute after applying",
			"    - Use Packing, if in a hurry",
			"    - Use QuickClot",
			"    - Use Field, if out of others",
			"2. Stitch"
		];
		_step = _step + 1;
	} else { // Cannot reopen
		_lines pushBack "    - Elastic > Packing/Field > QuickClot";
	};
} else { // Basic bandages
	_lines pushBack "    - Type of bandage doesn't matter";
};

_lines pushBack "" + str _step + ". Remove any applied tourniquets"; _step = _step + 1;

_lines append [
	"" + str _step + ". Give IV, if needed",
// https://github.com/acemod/ACE3/blob/fef34a82dc51d640ba3df82ccfcb228647998cb4/addons/medical_vitals/functions/fnc_handleUnitVitals.sqf#L44
// https://github.com/acemod/ACE3/blob/fef34a82dc51d640ba3df82ccfcb228647998cb4/addons/medical_engine/script_macros_medical.hpp#L52
	"    -  Blood, Plasma, and Saline are equivalent",
	"    -  """ + localize "STR_ACE_Medical_GUI_Lost_Blood0" + """: IV not needed", // No blood loss
	"    -  """ + localize "STR_ACE_Medical_GUI_Lost_Blood1" + """: IV not needed, optionally give 250/500ml", // Lost some blood (0 < mlBloodLoss <= 900. Median 450)
	"    -  """ + localize "STR_ACE_Medical_GUI_Lost_Blood2" + """: Give 1000ml", // Lost a lot of blood (900 < mlBloodLoss <= 1800. Median 1350)
	"    -  """ + localize "STR_ACE_Medical_GUI_Lost_Blood3" + """: Give 2000ml", // Lost a large amount of blood (1800 < mlBloodLoss <= 2400. Median 2100)
	"    -  """ + localize "STR_ACE_Medical_GUI_Lost_Blood4" + """: Give 3000ml", // Lost a fatal amount of blood (2400 < mlBloodLoss)
	"",
	"<font size='15' face='RobotoCondensedBold'>Unconscious:</font>",
	"1. Check heart rate",
	"    -  Make sure not to have a tourniqueted limb selected",
	"    -  Don't check while CPR is being applied",
	"1.1 CPR, if no heart rate",
	"1.2 Administer epinephrine, if heart rate below 60 (weak) and morphine was recently administered", // Weak: 0 < _heartRate <= 60, Normal: 60 < _heartRate <= 100, Strong: 100 < _heartRate
	"2. Check blood loss, if not receiving IV",
	"2.1. Give IV, if needed (see step " + str _step + " in Wounded)",
	"3. Repeat after 15 seconds if still unconscious"
];

player createDiaryRecord ["ACE 3", ["Medical", _lines joinString "<br/>", "\z\ace\addons\medical_treatment\ui\elasticBandage_ca.paa"], taskNull, "NONE", false];
