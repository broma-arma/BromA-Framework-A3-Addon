if (BRM_FMK_Engine_compatVersion > 0) then {
	call ([_faction] call BRM_FMK_Engine_fnc_getLoadoutCode);

	if (!isNil "_factionStructure") then { // SPRG
		#include "\broma_framework\loadouts\includes\default-equipment.sqf"

		if (_assignLoadoutMode) then {
			call ([_factionStructure regexReplace ["-", "_"], /*STRUCTURE*/1] call BRM_FMK_Engine_fnc_getLoadoutCode);
		};
	};
} else {
	if (_loadoutCondition) then {
		call ([_faction] call BRM_FMK_Engine_fnc_getLoadoutCode);
	} else {
		if (isNil "BRM_FMK_Engine_missionFactionList") then {
			BRM_FMK_Engine_missionFactionList = compileFinal preprocessFileLineNumbers "mission\loadouts\faction-list.sqf";
		};
		call BRM_FMK_Engine_missionFactionList;
	};

	if (_factionID in modified_loadouts) then {
		if (isNil "BRM_FMK_Engine_missionModList") then {
			BRM_FMK_Engine_missionModList = compileFinal preprocessFileLineNumbers "mission\loadouts\mod-list.sqf";
		};
		call BRM_FMK_Engine_missionModList;
	};

	if (!isNil "_factionStructure") then { // SPRG
		#include "\broma_framework\loadouts\includes\default-equipment.sqf"

		if (_assignLoadoutMode) then {
			private _i = ["HIGH", "MID", "LOW", "FRANCE", "US"] find _factionStructure;
			if (_i != -1) then {
				private _oldStructure = ["HIGH-TIER", "MID-TIER", "LOW-TIER", "FRANCE-STRUCTURE", "US-STRUCTURE"] select _i;
				if (_oldStructure in read_local_structure_specific) then {
					_factionStructure = _oldStructure;
				};
			};

			if (_factionStructure in read_local_structure_specific) then {
				if (isNil "BRM_FMK_Engine_missionStructureList") then {
					BRM_FMK_Engine_missionStructureList = compileFinal preprocessFileLineNumbers "mission\loadouts\structure-list.sqf";
				};
				call BRM_FMK_Engine_missionStructureList;
			} else {
				call ([_factionStructure regexReplace ["-", "_"], /*STRUCTURE*/1] call BRM_FMK_Engine_fnc_getLoadoutCode);
			};
		};
	};
};

#include "\broma_framework\loadouts\includes\default-values.sqf"
