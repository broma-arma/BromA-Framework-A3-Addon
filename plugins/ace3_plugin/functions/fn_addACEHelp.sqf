// Reload: "BRM_FMK_Plugin_ACE3_fnc_addACEHelp" call BIS_fnc_recompile; player removeDiarySubject "BRM_FMK_Plugin_ACE3"; [] call BRM_FMK_Plugin_ACE3_fnc_addACEHelp;
#define QUOTE(TEXT) #TEXT

#define HIGHLIGHT(TEXT,COLOR) QUOTE(<font color='#COLOR'>TEXT</font>)
#define HIGHLIGHT_RED(TEXT) HIGHLIGHT(TEXT,FFCCCC)
#define HIGHLIGHT_YELLOW(TEXT) HIGHLIGHT(TEXT,FFFFCC)

#define CONFIG_ASTERISK " <font color='#FFCC00'>*</font>"
#define CONFIG_NOTE CONFIG_ASTERISK + " Configurable, could change from mission to mission."

player createDiarySubject ["BRM_FMK_Plugin_ACE3", "ACE 3 Medical", "\z\ace\addons\medical_gui\data\categories\triage_card.paa"];

private _medicType = player getVariable ["ace_medical_medicClass", parseNumber (player getUnitTrait "medic")];
private _isMedic = _medicType > 0;
private _isDoctor = _medicType > 1;
private _katActive = isClass (configFile >> "CfgPatches" >> "kat_main");

private _fnc_medicItem = {
	params ["_setting"];
	private _postfix = "C";
	if (_setting isEqualType configNull) then {
		if (isText _setting) then {
			_postfix = CONFIG_ASTERISK;
			_setting = missionNamespace getVariable [getText _setting, 0];
		} else {
			_setting = getNumber _setting;
		}
	};
	private _text = ([
		"Anyone",
		"Only medics",
		"Only doctors"
	] select _setting) + " can use";
	if (_medicType < _setting) then {
		_text = HIGHLIGHT_RED(" + _text + ");
	};
	_text + _postfix
};

private _fnc_locationItem = {
	params ["_setting"];
	private _postfix = "D";
	if (_setting isEqualType configNull) then {
		if (isText _setting) then {
			_postfix = CONFIG_ASTERISK;
			_setting = missionNamespace getVariable [getText _setting, 0];
		} else {
			_setting = getNumber _setting;
		}
	};
	([
		"Can be used anywhere",
		"Can be used at medical vehicles",
		"Can be used at medical facilities",
		"Can be used at medical vehicles & facilities",
		"Cannot be used anywhere"
	] select _setting) + _postfix
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
	// https://github.com/acemod/ACE3/blob/dd293945223ec3b090e51a1e495fee6d1cbe53e9/addons/medical_damage/ACE_Medical_Injuries.hpp#L6
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

player createDiaryRecord ["BRM_FMK_Plugin_ACE3", ["Wounds", _lines joinString "<br/>", "\z\ace\addons\medical_feedback\data\fracture.paa"], taskNull, "NONE", false];

// =============================================================================

private _medicalItems = createHashMap;
private _fnc_isMedicalItem = "getNumber (_x >> ""ACE_isMedicalItem"") isEqualTo 1";
{
	_medicalItems set [configName _x, _x];
} forEach (_fnc_isMedicalItem configClasses (configFile >> "CfgWeapons"));
{
	_medicalItems set [configName _x, _x];
} forEach (_fnc_isMedicalItem configClasses (configFile >> "CfgMagazines"));

private _medicalItemsAction = createHashMap;
private _medicalActionsItem = createHashMap;
{
	private _item = getArray (_x >> "items") param [0, ""];
	if (_item != "") then {
		if (!isNil { _medicalItems get _item } && !(_item in _medicalItemsAction)) then {
			_medicalItemsAction set [_item, _x];
			_medicalActionsItem set [_x, _medicalItems getOrDefault [_item, _item]];
		};
	};
} forEach configProperties [configFile >> "ace_medical_treatment_actions", "isClass _x && { count getArray (_x >> ""items"") > 0 }"];

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

if (ace_medical_treatment_advancedMedication) then {
	_lines = [];

#define CFG_MED_NUMBER(CONFIG,ATTRIBUTE) (if (isNumber (CONFIG >> ATTRIBUTE)) then { getNumber (CONFIG >> ATTRIBUTE) } else { _medicationDefaults get ATTRIBUTE })
#define CFG_MED_ARRAY(CONFIG,ATTRIBUTE) (if (isArray (CONFIG >> ATTRIBUTE)) then { getArray (CONFIG >> ATTRIBUTE) } else { _medicationDefaults get ATTRIBUTE })

	private _medication = configProperties [configFile >> "ace_medical_treatment" >> "Medication", "isClass _x"];

	if (_katActive) then {
		_medication pushBack [configFile >> "CfgWeapons" >> "kat_naloxone", [
			// https://github.com/KAT-Advanced-Medical/KAM/blob/45aea7a3deed948fe1a598758be027df3adf6fc0/addons/pharma/functions/fnc_treatmentAdvanced_NaloxoneLocal.sqf
			"    Instant effect, neutralizes one dose of Morphine, Fentanyl, or Nalbuphine."
		]];
	};

	_medication = [_medication, [], {
		if (_x isEqualType configNull) then {
			private _configName = configName _x;
			private _cfgItem = _medicalActionsItem getOrDefault [configFile >> "ace_medical_treatment_actions" >> _configName, configNull];
			if (isNull _cfgItem) then {
				_configName
			} else {
				getText (_cfgItem >> "displayName")
			}
		} else {
			getText (_x select 0 >> "displayName")
		}
	}] call BIS_fnc_sortBy;

	{
		if (_x isEqualType configNull) then {
			private _configName = configName _x;

			private _name = "";
			private _picture = "";
			private _description = "";

			private _cfgItem = _medicalActionsItem getOrDefault [configFile >> "ace_medical_treatment_actions" >> _configName, configNull];
			if (isNull _cfgItem && _katActive) then {
				if (_configName == "BubbleWrap") then {
					_cfgItem = configFile >> "CfgMagazines" >> "kat_Bubble_Wrap";
				};
			};
			if (!isNull _cfgItem) then {
				_medicalItems deleteAt configName _cfgItem;
				_name = getText (_cfgItem >> "displayName");
				_picture = getText (_cfgItem >> "picture");
				_description = getText (_cfgItem >> "descriptionShort");
			};

			if (_name == "") then {
				_name = _configName;
			};
			if (_picture != "") then {
				_picture = "<img image=""" + _picture + """ width=""16"" height=""16"" /> ";
			};
			if (_description != "") then {
				_description = " - " + _description;
			};
			_lines pushBack _picture + "<font color='#FFFF00' size='15' face='RobotoCondensedBold'>" + _name + "</font>" + _description;

			if (_configName == "Epinephrine") then {
				_lines pushBack "    " + ([configFile >> "ace_medical_treatment_actions" >> "Epinephrine" >> "medicRequired"] call _fnc_medicItem);
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
		} else {
			private _cfgItem = _x select 0;
			private _configName = configName _cfgItem;
			_medicalItems deleteAt _configName;

			private _name = getText (_cfgItem >> "displayName");
			if (_name == "") then {
				_name = _configName;
			};

			private _picture = getText (_cfgItem >> "picture");
			if (_picture != "") then {
				_picture = "<img image=""" + _picture + """ width=""16"" height=""16"" /> ";
			};

			private _description = getText (_cfgItem >> "descriptionShort");
			if (_description != "") then {
				_description = " - " + _description;
			};

			_lines pushBack _picture + "<font color='#FFFF00' size='15' face='RobotoCondensedBold'>" + _name + "</font>" + _description;
			_lines append (_x select 1);
			_lines pushBack "";
		};
	} forEach _medication;

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

player createDiaryRecord ["BRM_FMK_Plugin_ACE3", ["Drugs", _lines joinString "<br/>", "\z\ace\addons\medical_treatment\ui\morphine_ca.paa"], taskNull, "NONE", false];

// =============================================================================

_lines = [];

private _additionalDescriptions = createHashMapFromArray [
	["ACE_tourniquet", [
		"    Causes pain after two minutes"
	]],
	["ACE_splint", [
		"    " + HIGHLIGHT_YELLOW(Single use)
	]],
	["ACE_personalAidKit", [
		] + (if (isClass (configFile >> "CfgPatches" >> "brm_ace_main") && { brm_ace_main_conditionPAK != 2 }) then { // 2: Stable
			if (brm_ace_main_conditionPAK == 1) then { // Not Bleeding
				["    Requires the patient to be not bleeding before use"];
			} else { // Anytime
				["    No requirements for use"];
			};
		} else {
			[
				"    Requires the patient to be in stable condition before use" + (["", CONFIG_ASTERISK] select isClass (configFile >> "CfgPatches" >> "brm_ace_main")),
				"    Stable condition: Alive, conscious, not bleeding, blood pressure >= 60/50, lost less than 15% blood, heart rate >= 40, lost less than 25% of heart output of blood"
			];
		})
	],
	["ACE_bodyBag", [
		"    " + (["Cannot use on unconscious", HIGHLIGHT_RED(Can use on unconscious)] select ace_medical_treatment_allowBodyBagUnconscious) + CONFIG_ASTERISK
	]]
];

if (_katActive) then {
	{
		_additionalDescriptions getOrDefault [_x, [], true] pushBack "    " + (["Reusable", HIGHLIGHT_YELLOW(Single use)] select kat_airway_ReusableAirwayItems) + CONFIG_ASTERISK;
	} forEach [
		"kat_larynx",
		"kat_guedel",
		"kat_nasal"
	];
};

private _excludeItems = [
	"FirstAidKit", "Medikit",

	//"ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot",
	//"ACE_tourniquet", "ACE_splint",
	//"ACE_morphine", "ACE_adenosine", "ACE_epinephrine", "ACE_painkillers",
	"ACE_atropine"
	//"ACE_plasmaIV", "ACE_plasmaIV_500", "ACE_plasmaIV_250",
	//"ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250",
	//"ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250",
	//"ACE_personalAidKit",
	//"ACE_surgicalKit", "ACE_suture",
	//"ACE_bodyBag", "ACE_bodyBag_blue", "ACE_bodyBag_white",
];

if (ace_medical_treatment_consumeSurgicalKit < 2) then {
	_excludeItems pushBack "ACE_suture";
};

if (ace_medical_fractures < 1) then {
	_excludeItems pushBack "ACE_splint";
};

if (_katActive) then {
	_excludeItems append [
		"kat_bloodIV_O", "kat_bloodIV_O_500", "kat_bloodIV_O_250",
		"kat_bloodIV_O_N", "kat_bloodIV_O_N_500", "kat_bloodIV_O_N_250",
		"kat_bloodIV_A", "kat_bloodIV_A_500", "kat_bloodIV_A_250",
		"kat_bloodIV_A_N", "kat_bloodIV_A_N_500", "kat_bloodIV_A_N_250",
		"kat_bloodIV_B", "kat_bloodIV_B_500", "kat_bloodIV_B_250",
		"kat_bloodIV_B_N", "kat_bloodIV_B_N_500", "kat_bloodIV_B_N_250",
		"kat_bloodIV_AB", "kat_bloodIV_AB_500", "kat_bloodIV_AB_250",
		"kat_bloodIV_AB_N", "kat_bloodIV_AB_N_500", "kat_bloodIV_AB_N_250"

		//"KAT_Empty_bloodIV_500",
		//"KAT_Empty_bloodIV_250",

		//"kat_amiodarone", "kat_Carbonate", "kat_atropine", "kat_Caffeine", "kat_EACA", "kat_etomidate", "kat_fentanyl", "kat_flumazenil",
		//"kat_epinephrineIV", "kat_ketamine", "kat_lidocaine", "kat_lorazepam", "kat_nalbuphine", "kat_nitroglycerin",
		//"kat_norepinephrine", "kat_Painkiller", "kat_Penthrox", "kat_Pervitin", "kat_phenylephrine", "kat_phenylephrineAuto", "kat_TXA",

		//"kat_IV_16", "kat_aatKit", "kat_accuvac", "kat_AFAK", "kat_X_AED", "kat_AED", "kat_basicDiagnostic", "kat_plate", "kat_BVM",
		//"kat_chestSeal", "kat_clamp", "kat_coag_sense", "kat_vacuum", "kat_oxygenTank_150_Empty", "kat_oxygenTank_300_Empty",
		//"kat_eyecovers", "KAT_Eyewasher", "kat_IO_FAST", "kat_fluidWarmer", "kat_guedel", "kat_handWarmer", "kat_IFAK", "kat_larynx",
		//"kat_suction", "kat_MFAK", "kat_nasal", "kat_ncdKit", "kat_personal_oxygen", "kat_pocketBVM", "kat_oxygenTank_150",
		//"kat_oxygenTank_300", "kat_Pulseoximeter", "kat_retractor", "kat_scalpel", "kat_stethoscope",

		//"kat_Bubble_Wrap"
	];

	// Exclude disabled addon items, e.g. with default KAT CBA settings, this will exclude "kat_eyecovers" and "KAT_Eyewasher", since kat_ophthalmology_enable defaults to false.
	{
		private _sourceAddon = configSourceAddonList _y param [0, ""];
		if (_sourceAddon != "" && { !(missionNamespace getVariable [format ["%1_%2", _sourceAddon, ["enable", "hypothermiaActive"] select (_sourceAddon == "kat_hypothermia")], true]) }) then {
			_excludeItems pushBack _x;
		};
	} forEach _medicalItems;
};

private _medicalItemGroups = createHashMapFromArray [
	["ACE_bloodIV", [configFile >> "CfgWeapons" >> "ACE_bloodIV", "Blood IV Bags"]],
	["ACE_plasmaIV", [configFile >> "CfgWeapons" >> "ACE_plasmaIV", "Plasma IV Bags"]],
	["ACE_salineIV", [configFile >> "CfgWeapons" >> "ACE_salineIV", "Saline IV Bags"]],
	["ACE_bodyBag", [configFile >> "CfgWeapons" >> "ACE_bodyBag", "Body Bags"]]
];

private _medicalItemsKeys = [keys _medicalItems, [], {
	if (_x in _medicalItemGroups) then {
		getText (_medicalItemGroups get _x select 0 >> "displayName")
	} else {
		getText (_medicalItems get _x >> "displayName")
	}
}] call BIS_fnc_sortBy;

private _fnc_addEquipmentItem = {
	params ["_action", "_cfg", ["_groupName", ""], ["_displayAll", false]];

	private _configName = configName _cfg;

	_medicalItems deleteAt _configName;
	private _children = createHashMap;
	if (_groupName != "") then {
		{
			if (inheritsFrom _y == _cfg) then {
				_children set [_x, _y];
			};
		} forEach _medicalItems;
		{
			_medicalItemsKeys deleteAt (_medicalItemsKeys find _x);
			_medicalItems deleteAt _x;
		} forEach keys _children;
	};

	if (_groupName == "") then {
		_groupName = getText (_cfg >> "displayName");
	};
	private _description = getText (_cfg >> "descriptionShort");
	_lines append [
		"<img image=""" + getText (_cfg >> "picture") + """ width=""16"" height=""16"" /> <font color='#FFFF00' size='15' face='RobotoCondensedBold'>" + _groupName + "</font>",
		"    " + getText (_cfg >> "descriptionShort")
	];

	_lines append (_additionalDescriptions getOrDefault [_configName, []]);

	if (_displayAll && count _children > 0) then {
		_lines pushBack "    <img image=""" + getText (_cfg >> "picture") + """ width=""16"" height=""16"" /> " + getText (_cfg >> "displayName");

		{
			private _childDescription = getText (_y >> "descriptionShort");
			_childDescription = if (_childDescription != _description) then {
				" - " + _childDescription
			} else {
				""
			};
			_lines pushBack "    <img image=""" + getText (_y >> "picture") + """ width=""16"" height=""16"" /> " + getText (_y >> "displayName") + _childDescription;
		} forEach _children;
	};

	private _cfgAction = _medicalItemsAction get _action;
	if (!isNil "_cfgAction") then {
		private _cfgConsumeItem = _cfgAction >> "consumeItem";
		if (isText _cfgConsumeItem) then {
			private _options = [
				"Reusable",
				HIGHLIGHT_YELLOW(Single use)
			];
			if (_configName == "ACE_surgicalKit") then {
				_options pushBack "Uses sutures";
			};
			_lines pushBack "    " + (_options select (missionNamespace getVariable [getText _cfgConsumeItem, 0])) + CONFIG_ASTERISK;
		};

		private _cfgMedicRequired = _cfgAction >> "medicRequired";
		if (isText _cfgMedicRequired) then {
			private _setting = missionNamespace getVariable [getText _cfgMedicRequired, 0];
			private _text = ([
				"Anyone",
				"Only medics",
				"Only doctors"
			] select _setting) + " can use";
			if (_medicType < _setting) then {
				_text = HIGHLIGHT_RED(" + _text + ");
			};
			_lines pushBack "    " + _text + CONFIG_ASTERISK;
		};

		private _cfgTreatmentLocations = _cfgAction >> "treatmentLocations";
		if (isText _cfgTreatmentLocations) then {
			_lines pushBack "    " + ([
				"Can be used anywhere",
				"Can be used at medical vehicles",
				"Can be used at medical facilities",
				"Can be used at medical vehicles &amp; facilities",
				"Cannot be used anywhere"
			] select (missionNamespace getVariable [getText _cfgTreatmentLocations, 0])) + CONFIG_ASTERISK;
		};

		private _cfgAllowSelfTreatment = _cfgAction >> "allowSelfTreatment";
		if (isText _cfgAllowSelfTreatment) then {
			_lines pushBack "    " + ([
				"Cannot use on self",
				"Can use on self"
			] select (missionNamespace getVariable [getText _cfgAllowSelfTreatment, 0])) + CONFIG_ASTERISK;
		};
	};

	_lines pushBack "";
};

{
	if (_x in _excludeItems) then {
		continue;
	};

	if (_x in _medicalItemGroups) then {
		[_x] + (_medicalItemGroups get _x) call _fnc_addEquipmentItem;
	} else {
		[_x, _medicalItems get _x] call _fnc_addEquipmentItem;
	}
} forEach _medicalItemsKeys;

_lines pushBack CONFIG_NOTE;

player createDiaryRecord ["BRM_FMK_Plugin_ACE3", ["Equipment", _lines joinString "<br/>", "\z\ace\addons\medical_treatment\ui\personal_aid_kit_ca.paa"], taskNull, "NONE", false];

// =============================================================================

if (_katActive) then {
	_lines = [
		"<font color='#FFFF00' size='15' face='RobotoCondensedBold'>Official Guide:</font>"
	];
	if (isServer) then {
		private _url = "https://docs.google.com/document/d/1YlY00qoL2gdrbOJJzi5aW19A3HqT7uXflszDYuK7h3M";
		_lines pushBack "<execute expression='copyToClipboard """ + _url + """;'>Copy to clipboard</execute>";
	} else {
		{
			_lines pushBack " - " + _x;
		} forEach [
			"https://spoo.me/kat",
			"https://tinu.be/kat"
		];
	};
} else {
	_lines = [];

	if (isClass (configFile >> "CfgPatches" >> "brm_ace_main") && { brm_ace_main_conditionPAK != 2 }) then { // 0: PAK Anytime
		_lines append ["<font color='#FFFF00' size='15' face='RobotoCondensedBold'>Heavily wounded:</font>", "Use a PAK (Personal Aid Kit)", ""];
	};

	_lines append [
		"<font color='#FFFF00' size='15' face='RobotoCondensedBold'>Wounded:</font>",
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
		"<font color='#FFFF00' size='15' face='RobotoCondensedBold'>Unconscious:</font>",
		"1. Check heart rate",
		"    -  Make sure not to have a tourniqueted limb selected",
		"    -  Don't check while CPR is being applied",
		"1.1 CPR, if no heart rate",
		"1.2 Administer epinephrine, if heart rate below 60 (weak) and morphine was recently administered", // Weak: 0 < _heartRate <= 60, Normal: 60 < _heartRate <= 100, Strong: 100 < _heartRate
		"2. Check blood loss, if not receiving IV",
		"2.1. Give IV, if needed (see step " + str _step + " in Wounded)",
		"3. Repeat after 15 seconds if still unconscious"
	];
};

player createDiaryRecord ["BRM_FMK_Plugin_ACE3", ["Medical", _lines joinString "<br/>", "\z\ace\addons\medical_treatment\ui\elasticBandage_ca.paa"], taskNull, "NONE", false];
