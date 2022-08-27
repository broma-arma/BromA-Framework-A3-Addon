// Mission Framework > 0.7.5

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

private _extractionPoints = [];
private _groupVars = [[], [], [], []];
if (isServer) then {
	_extractionPoints = call {
		private _sideStrs = ["blu", "op", "ind", "civ"];

		private _extractionPoints = [[], [], [], []]; // Blu, Op, Ind, Civ
		{
			private _extName = str _x splitString "_";
			if (count _extName > 1 && {_extName select 1 == "extraction"}) then {
				private _index = _sideStrs find (_extName select 0);
				if (_index != -1) then {
					_extractionPoints select _index pushBackUnique _x;
				} else {
					["Error: Extraction point '%1' has unknown side '%2'", _x, _extName select 0] call BIS_fnc_error;
				};
			};
		} forEach (allMissionObjects "");

		_extractionPoints
	};

	private _squadNames = ["GroupCompany", "GroupPlatoon", "GroupSquad"] apply {
		private _names = "true" configClasses (configfile >> "CfgWorlds" >> _x) apply { getText (_x >> "name") };
		[count _names, _names]
	};

	// Get all group variables
	private _sideStrs = ["West", "East", "Independent", "Civilian"];
	private _sideSquadNameIndexes = [[0, 0, -1], [0, 0, -1], [0, 0, -1], [0, 0, -1]];

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
};

{
	_x params ["_sideChar", "_sideData"];

	_sideData params [
		["_side", WEST, [WEST]],
		["_faction", "", ["", []]],
		["_extraction", [], [[]]]
	];

	// TODO Sanity checking, e.g. _side should be unique

	private _sideIndex = [WEST, EAST, RESISTANCE, CIVILIAN] find _side;

	if (_faction isEqualTo "") then {
		_faction = ["NATO", "CSAT", "AAF", "FIA"] select _sideIndex;
	};

	missionNamespace setVariable [format ["side_%1_side", _sideChar], _side];
	missionNamespace setVariable [format ["side_%1_faction", _sideChar], _faction];

	if (isServer) then {
		_extraction params [
			["_extractTargets", [], [[]]],
			["_extractGroups", "*", ["", []]]
		];
		_extractTargets append (_extractionPoints select _sideIndex);
		if (count _extractTargets > 0) then {
			mission_require_extraction pushBack _side;
		};

		if (_extractGroups isEqualTo "*") then {
			_extractGroups = _groupVars select _sideIndex;
		};

		missionNamespace setVariable [format ["brm_fmk_extraction_%1", _sideChar], [_extractGroups, _extractTargets]];
	};
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

[] call BRM_FMK_fnc_assignSideProperties;
mission_settings_loaded = true;
