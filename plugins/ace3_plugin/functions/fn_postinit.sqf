if !(isClass (configFile >> "CfgPatches" >> "ace_medical")) exitWith {};

// Backward compatibility
mission_ace3_medical_level = if (mission_ACE3_enabled) then { [2, 1] select (ace_medical_treatment_advancedBandages == 0) } else { 0 };

if (hasInterface) then {
	if (["p_ace3_everyone_medic", 0] call BIS_fnc_getParamValue > 0) then {
		// Everyone is a medic
		player setvariable ["ACE_medical_medicClass", 1, true]
	};

	// Revive system lives
	private _reviveLives = ["p_ace3_revive_lives", -1] call BIS_fnc_getParamValue; // 0="Disabled", 1="1", 3="3", 5="5", 9999/-1="Infinite"
	if (_reviveLives == 9999) then { _reviveLives = -1; }; // Backward compatibility
	if (_reviveLives > -1) then {
		player setVariable ["brm_ace_secondChances", _reviveLives, true];

		// Restore lives on PAK
		["ace_medical_FullHeal", { _this setVariable ["brm_ace_secondChances", _thisArgs, true]; }, _reviveLives] call CBA_fnc_addEventHandlerArgs;
	};

	if (isNil "mission_ace3_legs") then { mission_ace3_legs = !(missionNamespace getVariable ["ace_medical_treatment_clearTraumaAfterBandage", false]); };

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
