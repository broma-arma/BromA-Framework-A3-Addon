if !(isClass (configFile >> "CfgPatches" >> "ace_medical")) exitWith {};

if (isNil "mission_ace3_revive_lives") then { mission_ace3_revive_lives = -1; };
if (isNil "mission_ace3_everyone_medic") then { mission_ace3_everyone_medic = false; };
if (isNil "mission_ace3_legs") then { mission_ace3_legs = !(missionNamespace getVariable ["ace_medical_treatment_clearTraumaAfterBandage", false]); };

if (hasInterface) then {
	if (mission_ace3_everyone_medic) then {
		player setvariable ["ACE_medical_medicClass", 1, true]
	};

	if (mission_ace3_revive_lives > -1) then {
		player setVariable ["brm_ace_secondChances", mission_ace3_revive_lives, true];

		["ace_medical_FullHeal", {
			// Restore lives on PAK
			_this setVariable ["brm_ace_secondChances", mission_ace3_revive_lives, true];
		}] call CBA_fnc_addEventHandler;
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
