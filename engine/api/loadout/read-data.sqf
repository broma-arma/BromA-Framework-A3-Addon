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
		if (_UAVBAg == "auto") then { _UAVBag = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 0) };
		if (_UAVTerminal == "auto") then { _UAVTerminal = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 1) };

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

/*
_faction = toUpper _faction;
#include "\broma_framework\loadouts\faction-list.sqf"
#include "..\..\..\..\mission\loadouts\faction-list.sqf"

#include "\broma_framework\loadouts\includes\default-equipment.sqf"

if (_assignLoadoutMode) then {
	if (_UAVBag in ["auto", "ar2", "al6", "al6med"]) then {
		if (_UAVBag == "auto") then { _UAVBag = "ar2" };
		_UAVBag = [_unit, _UAVBag] call BRM_FMK_fnc_getSideUAV select 0;
	};
	if (_UAVTerminal == "auto") then { _UAVTerminal = [_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV select 1; };

	_factionStructure = toUpper _factionStructure;

	private _frameworkStructure = false;
	#include "..\..\..\..\mission\loadouts\structure-list.sqf"
	if (_frameworkStructure) then {
		#include "\broma_framework\loadouts\structure-list.sqf"
	};
};

#include "\broma_framework\loadouts\includes\faction-info-index.sqf"
#include "\broma_framework\loadouts\includes\default-values.sqf"
*/
