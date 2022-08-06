mission_settings_loaded = false;

if (!fileExists "settings\settings.sqf") exitWith {
	["[BromA Framework] Critical Error: File ""settings\settings.sqf"" not found."] call BIS_fnc_error;
	["END1", false, 0, false] call BIS_fnc_endMission;
};

call compile preprocessFileLineNumbers "settings\settings.sqf" params [
	"_mode", "_factionA", "_factionB", "_factionC", "_extractMusic", "_jip", "_stats", "_plugins"
];

mission_game_mode = _mode;
mission_require_extraction = [];
mission_extraction_BLU = "*";
mission_extraction_OP = "*";
mission_extraction_IND = "*";
mission_extraction_CIV = "*";

{
	_x params ["_sideChar", "_sideData"];

	_sideData params [
		"_side",
		"_faction",
		"_extract",
		"_extractPoints",
		"_extractGroups"
	];

	missionNamespace setVariable [format ["side_%1_side", _sideChar], _side];
	missionNamespace setVariable [format ["side_%1_faction", _sideChar], _faction];
	if (_extract) then {
		mission_require_extraction = mission_require_extraction + [_side];
	};
	missionNamespace setVariable [format ["mission_extraction_points_%1", _sideChar], _extractPoints];
	missionNamespace setVariable [format ["mission_extraction_%1", ["BLU", "OP", "IND", "CIV"] select ([WEST, EAST, INDEPENDENT, CIVILIAN] find _side)], _extractGroups];
} forEach [["a", _factionA], ["b", _factionB], ["c", _factionC]];

mission_extraction_tracks = _extractMusic;
mission_allow_jip = _jip;
mission_ending_stats = _stats;
mission_plugins = _plugins;

mission_enable_side_c = side_c_faction != "";

if (mission_extraction_tracks isEqualTo "*") then {
	mission_extraction_tracks = [] call BRM_FMK_fnc_getMusic;
};
mission_extraction_enable_music = mission_extraction_tracks isEqualType [] && {count mission_extraction_tracks > 0};

if (isNil "DAC_Res_Side") then {
	private _cfgIntel = missionConfigFile >> "Mission" >> "Mission" >> "Intel";
	private _resistanceWest = if (isNumber (_cfgIntel >> "resistanceWest")) then { getNumber (_cfgIntel >> "resistanceEast") } else { 1 };
	private _resistanceEast = getNumber (_cfgIntel >> "resistanceEast");
	if (_resistanceWest == 0) then {
		_resistanceEast = 1 - _resistanceEast;
	};
	// Independent friendly to: 0 = EAST, 1 = WEST, 2 = NONE, 3 = BOTH
	DAC_Res_Side = [_resistanceWest, _resistanceEast] call BIS_fnc_encodeFlags2;
};

if (mission_extraction_BLU isEqualTo "*" || mission_extraction_OP isEqualTo "*" || mission_extraction_IND isEqualTo "*" || mission_extraction_CIV isEqualTo "*") then {
	private _squadNames = ["GroupCompany", "GroupPlatoon", "GroupSquad"] apply {
		private _names = "true" configClasses (configfile >> "CfgWorlds" >> _x) apply { getText (_x >> "name") };
		[count _names, _names]
	};

	// Get all group variables
	private _sideStrs = ["West", "East", "Independent", "Civilian"];
	private _sideSquadNameIndexes = [[0, 0, -1], [0, 0, -1], [0, 0, -1], [0, 0, -1]];
	private _groupVars = [[], [], [], []];

	private _cfgEntities = missionConfigFile >> "Mission" >> "Mission" >> "Entities";
	private _items = getNumber (_cfgEntities >> "items");
	for "_i" from 0 to _items - 1 do {
		private _cfgItem = _cfgEntities >> format ["Item%1", _i];
		private _dataType = getText (_cfgItem >> "dataType");
		if (_dataType == "Group") then {
			private _sideIndex = _sideStrs find getText (_cfgItem >> "side");

			private _squadName = call {
				// Vanilla squad names
				private _indexes = _sideSquadNameIndexes select _sideIndex;
				for "_i" from count _squadNames - 1 to 0 step -1 do {
					_indexes set [_i, _indexes # _i + 1];
					if (_indexes select _i < _squadNames select _i select 0) exitWith {};
					if (_i == 0) then {
						// Default names would allow 599 combinations; only 288 groups can exist per side.
						// Throw an error just in case it occurs.
						["[BromA Framework] Error: Too many groups, not enough name combinations"] call BIS_fnc_error;
					} else {
						_indexes set [_i, 0];
					};
				};

				// Custom squad names
				private _squadName = "";
				private _cfgCustomAttributes = _cfgItem >> "CustomAttributes";
				private _nAttributes = getNumber (_cfgCustomAttributes >> "nAttributes");
				for "_i" from 0 to _nAttributes - 1 do {
					private _cfgAttribute = _cfgCustomAttributes >> format ["Attribute%1", _i];
					if (getText (_cfgAttribute >> "property") == "groupID") exitWith {
						_squadName = getText (_cfgAttribute >> "Value" >> "data" >> "value");
					};
				};
				if (_squadName != "") exitWith { _squadName };

				private _squadNameParts = [];
				for "_i" from 0 to 2 do {
					_squadNameParts pushBack (_squadNames select _i select 1 select (_indexes select _i));
				};
				format (["%1 %2-%3"] + _squadNameParts) // "%GroupCompany %GroupPlatoon-%GroupSquad"
			};

			private _name = getText (_cfgItem >> "Attributes" >> "name");
			if (_name != "") then {
				_groupVars select _sideIndex pushBack _name;
			} else {
				["[BromA Framework] Error: Group ""%1"" doesn't have a variable name.", _squadName] call BIS_fnc_error;
			};
		};
	};

	if (mission_extraction_BLU isEqualTo "*") then {
		mission_extraction_BLU = _groupVars select 0;
	};
	if (mission_extraction_OP isEqualTo "*") then {
		mission_extraction_OP = _groupVars select 1;
	};
	if (mission_extraction_IND isEqualTo "*") then {
		mission_extraction_IND = _groupVars select 2;
	};
	if (mission_extraction_CIV isEqualTo "*") then {
		mission_extraction_CIV = _groupVars select 3;
	};
};

DAC_STRPlayers = [false] call BRM_FMK_fnc_playableMissionEntities apply { _x select 1 };

[] call BRM_FMK_fnc_assignSideProperties;
mission_settings_loaded = true;
