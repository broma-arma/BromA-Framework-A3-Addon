// BRM_FMK_Plugin_ACE3_fnc_postInit
if !(isClass (configFile >> "CfgPatches" >> "ace_medical")) exitWith {};

// Backward compatibility
mission_ace3_medical_level = if (mission_ACE3_enabled) then { [2, 1] select (ace_medical_treatment_advancedBandages == 0) } else { 0 };

// Allow preventing AI death in CardiacArrest state.
private _deathAITransition = ace_medical_STATE_MACHINE getVariable ["cardiacarrest_transitions", ""] select { _x select 0 == "DeathAI" } param [0, []];
if (_deathAITransition param [1, {}] isEqualTo {!ace_medical_statemachine_AIUnconsciousness && {!isPlayer _this}}) then {
	_deathAITransition set [1, {!(_this getVariable ["ace_medical_statemachine_AIUnconsciousness", ace_medical_statemachine_AIUnconsciousness]) && {!isPlayer _this}}];
};

if (mission_KAT_enabled) then {
	["CBA_SettingChanged", {
		params ["_setting", "_value"];
		// "kat_misc_.FAK.*SlotItem"
		if (BRM_FMK_Plugin_ACE3_CBA_SettingsInitialized && { _setting in [_setting select [0, 9] == "kat_misc_" && _setting select [10, 3] == "FAK" && _setting select [count _setting - 8] == "SlotItem"] }) then {
			[] call BRM_FMK_Plugin_ACE3_fnc_updateKatFAKs;
		};
	}] call CBA_fnc_addEventHandler;
} else {
	// Allow preventing AI death in FatalInjury state.
	private _deathAITransition = ace_medical_STATE_MACHINE getVariable ["fatalinjury_transitions", ""] select { _x select 0 == "SecondChance" } param [0, []];
	if (_deathAITransition param [1, {}] isEqualTo (missionNamespace getVariable "ace_medical_statemachine_fnc_conditionSecondChance")) then {
		_deathAITransition set [1, {params ["_unit"]; _unit getVariable ["ace_medical_deathBlocked", false] || _this call ace_medical_statemachine_fnc_conditionSecondChance}];
	};
};

if (hasInterface) then {
	if (["p_ace3_everyone_medic", 0] call BIS_fnc_getParamValue > 0) then {
		// Everyone is a medic
		player setVariable ["ACE_medical_medicClass", 1, true]
	};

	// Revive system lives
	private _reviveLives = ["p_ace3_revive_lives", -1] call BIS_fnc_getParamValue; // 0="Disabled", 1="1", 3="3", 5="5", 9999/-1="Infinite"
	if (_reviveLives == 9999) then { _reviveLives = -1; }; // Backward compatibility
	if (_reviveLives > -1) then {
		player setVariable ["brm_ace_secondChances", _reviveLives, true];

		// Restore lives on PAK
		["ace_medical_FullHeal", { _this setVariable ["brm_ace_secondChances", _thisArgs, true]; }, _reviveLives] call CBA_fnc_addEventHandlerArgs;
	};

	if (isNil "mission_ace3_legs") then {
		mission_ace3_legs = missionNamespace getVariable ["ace_medical_treatment_clearTrauma", 0] == 0 // 0: Never, 1: After Stitch, 2: After Bandage
						&& missionNamespace getVariable ["ace_medical_fractures", 0] > 1; // 0: Disabled, 1: Splints Fully Heal Fractures, 2: Splints Heal, but Cannot Jog, 3: Splints Heal, but Cannot Sprint
	};

	if (mission_ace3_legs) then {
		["CAManBase", 1, ["ACE_SelfActions"], ["brm_fmk_leg_fix", "<t color='#ff0000'>Fix broken leg</t>", "", {
			_target playAction "medicStart";

			[10, _target, {
				params ["_target"];

				_target playAction "medicStop";
				_target setHitPointDamage ["HitLegs", 0];
			}, {
				params ["_target"];

				_target playAction "medicStop";
			}, "Fixing Legs"] call ace_common_fnc_progressBar;
		}, { _target getHitPointDamage "HitLegs" >= 0.5 }] call ace_interact_menu_fnc_createAction] call ace_interact_menu_fnc_addActionToClass;
	};

	[] call BRM_FMK_Plugin_ACE3_fnc_addACEHelp;
};
