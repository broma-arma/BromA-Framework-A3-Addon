if !(hasInterface) exitWith {};

0 spawn {
	waitUntil { !isNil "BrmFmk_blockTP_allow" };

	if (isNil "tp_allowed_units") then { tp_allowed_units = [] };

	if (difficultyOption "thirdPersonView" != 1 || BrmFmk_blockTP_allow == 1 || player in tp_allowed_units) exitWith {};

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
};
