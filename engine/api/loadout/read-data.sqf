// TODO Cache compiling "mission\loadouts\faction-list.sqf", "mission\loadouts\mod-list.sqf", and "mission\loadouts\structure-list.sqf"
if (_loadoutCondition) then {
	#include "\broma_framework\loadouts\faction-list.sqf"
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
		if (_factionStructure in read_local_structure_specific) then {
			if (isNil "BRM_FMK_Engine_missionStructureList") then {
				BRM_FMK_Engine_missionStructureList = compileFinal preprocessFileLineNumbers "mission\loadouts\structure-list.sqf";
			};
			call BRM_FMK_Engine_missionStructureList;
		} else {
			#include "\broma_framework\loadouts\structure-list.sqf"
		};
	};
};

#include "\broma_framework\loadouts\includes\default-values.sqf"
