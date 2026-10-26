// BRM_FMK_Plugin_ACE3_fnc_preInit
if !(isClass (configFile >> "CfgPatches" >> "ace_medical")) exitWith {};

if (mission_KAT_enabled) then {
	BRM_FMK_Plugin_ACE3_CBA_SettingsInitialized = false;
	["CBA_SettingsInitialized", {
		[] call BRM_FMK_Plugin_ACE3_fnc_updateKatFAKs;
		BRM_FMK_Plugin_ACE3_CBA_SettingsInitialized = true;
	}] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
	["CBA_loadoutGet", {
		params ["_unit", "_loadout", "_extendedInfo"];

		if (mission_KAT_enabled) then {
			private _bodyPart = "";
			if (_unit getVariable ["kat_breathing_pulseoximeter", false]) then {
				private _attached = _unit getVariable ["kat_breathing_PulseOximeter_Attached", [0, 0]];
				if (_attached select 0 > 0) then {
					_bodyPart = "leftarm";
				};
				if (_attached select 1 > 0) then {
					_bodyPart = "rightarm";
				};
			};
			_extendedInfo set ["BRM_FMK_Plugin_ACE3_KAT_loadout", [_unit getVariable ["kat_breathing_PulseOximeter_VolumePatient", false], _bodyPart]];
		};
	}] call CBA_fnc_addEventHandler;

	["CBA_loadoutSet", {
		[{
			params ["_unit", "_loadout", "_extendedInfo"];

			private _katLoadout = _extendedInfo getOrDefault ["BRM_FMK_Plugin_ACE3_KAT_loadout", []];
			if (_katLoadout isNotEqualTo []) then {
				_katLoadout params ["_volume", "_bodyPart"];

				_unit setVariable ["kat_breathing_PulseOximeter_Volume", _volume, true];
				if (_bodyPart != "") then {
					["kat_breathing_pulseoxLocal", [_unit, _unit, _bodyPart]] call CBA_fnc_localEvent;
				};
			};
		}, _this] call CBA_fnc_execNextFrame;
	}] call CBA_fnc_addEventHandler;
};
