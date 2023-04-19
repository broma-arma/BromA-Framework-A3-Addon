#include "script_component.hpp"
BrmFmk_blockTP_allow = ["p_allow_tp_veh", 2] call BIS_fnc_getParamValue;

if !(hasInterface) exitWith {};

0 spawn {
	waitUntil { !isNil "BrmFmk_blockTP_allow" };

	if (difficultyOption "thirdPersonView" != 1 || BrmFmk_blockTP_allow == 1 || player in (missionNamespace getVariable ["tp_allowed_units", []]) || player getVariable ["BRM_FMK_block_tp_allowed", false]) exitWith {};

	addMissionEventHandler ["EachFrame", {
		if (cameraView == "EXTERNAL") then {
			switch (BrmFmk_blockTP_allow) do {
				case 0: { // 3rd Person Disabled
					player switchCamera "INTERNAL";
				};
				case 1: { // 3rd Person Enabled
					removeMissionEventHandler ["EachFrame", _thisEventHandler];
				};
				case 2: { // 3rd Person Drivers/Commanders Only
					private _vehicle = objectParent player;
					if (isNull _vehicle || {player != driver _vehicle && player != commander _vehicle}) then {
						player switchCamera "INTERNAL";
					};
				};
			};
		};
	}];
};
