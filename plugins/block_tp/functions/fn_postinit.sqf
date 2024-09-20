if !(hasInterface) exitWith {};

private _allow = ["p_allow_tp_veh", 2] call BIS_fnc_getParamValue; // 0="Disabled", 1="Enabled", 2="Drivers/Commanders"

if (isNil "tp_allowed_units") then { tp_allowed_units = [] };

if (difficultyOption "thirdPersonView" != 1 || _allow == 1 || player in tp_allowed_units) exitWith {};

BrmFmk_blockTP_allow = _allow;
addMissionEventHandler ["EachFrame", {
	if (cameraView == "EXTERNAL") then {
		switch (BrmFmk_blockTP_allow) do {
			case 0: { // 3rd Person Disabled
				focusOn switchCamera "INTERNAL";
			};
			case 1: { // 3rd Person Enabled
				removeMissionEventHandler ["EachFrame", _thisEventHandler];
			};
			case 2: { // 3rd Person Drivers/Commanders Only
				private _vehicle = objectParent focusOn;
				if (isNull _vehicle || { !(focusOn in [driver _vehicle, commander _vehicle]) }) then {
					focusOn switchCamera "INTERNAL";
				};
			};
		};
	};
}];
