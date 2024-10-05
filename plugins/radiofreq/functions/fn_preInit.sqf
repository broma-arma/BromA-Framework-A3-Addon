if (!isServer || !isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

private _fnc_iterItems = {
	params ["_code", "_cfg"];
	for "_i" from 0 to getNumber (_cfg >> "items") - 1 do {
		private _x = _cfg >> format ["Item%1", _i];
		call _code;
	};
};

private _playable = [[], [], [], []]; // op, blu, ind, civ

[{
	if (getText (_x >> "dataType") != "Group") exitWith {};
	private _groupSide = getText (_x >> "side");
	if !(_groupSide in ["East", "West", "Independent", "Civilian"]) exitWith {};

	[{
		private _cfgAttributes = _x >> "Attributes";
		if (getNumber (_cfgAttributes >> "isPlayer") > 0 || getNumber (_cfgAttributes >> "isPlayable") > 0) then {
			private _var = getText (_cfgAttributes >> "name") splitString "_";
			private _sideID = ["op", "blu", "ind", "civ"] find _var#0;
			if (_sideID != -1 && { count _var == 4 }) then { // ["blu", "0", "0", "1"]
				_var params ["", "_squadIndex", "_groupIndex", "_unitIndex"];
				_squadIndex = parseNumber _squadIndex;
				_groupIndex = parseNumber _groupIndex;
				private _groupName = getText (_cfgAttributes >> "description") splitString "@" param [1, ""]; // "Actual - Commander@Zero"
				private _squadName = _groupName splitString " " param [0, ""];
				_playable#_sideID pushBack [_squadIndex, _squadName, _groupIndex, _groupName];
			};
		};
	}, _x >> "Entities"] call _fnc_iterItems;
}, BRM_FMK_Engine_missionConfig >> "Mission" >> "Entities"] call _fnc_iterItems;

{
	_x sort true;
} forEach _playable;

private _radioNets = [
	[ // op
		[ // SR
			//[[_squad0Name, squad0Frequency], [group0Name, group0Frequency], [group1Name, group1Frequency], ...],
			//...
		],
		[ // LR
			//_lrChannel0 frequency
			//_lrChannel1 frequency
			//...
		]
	],
	[[], []], // blu
	[[], []], // ind
	[[], []] // civ
];

private _fnc_uniqueFrequency = {
	params ["_min", "_max", "_usedFrequencies"];
	_min = _min * 10;
	_max = _max * 10 - _min + 1;

	private ["_frequency"];
	while { isNil "_frequency" || { _frequency in _usedFrequencies } } do {
		_frequency = str (floor random _max + _min);
		_frequency = if (_frequency select [count _frequency - 1, 1] == "0") then {
			_frequency select [0, count _frequency - 1]
		} else {
			_frequency insert [count _frequency - 1, "."]
		}
	};
	_usedFrequencies pushBack _frequency;
	_frequency
};

private _lrFrequencies = [];
private _fnc_uniqueFrequencyLR = { [30.0, 87.9, _lrFrequencies] call _fnc_uniqueFrequency };

private _srFrequencies = [];
private _fnc_uniqueFrequencySR = { [88.0, 512.9, _srFrequencies] call _fnc_uniqueFrequency };

{
	private _sideID = _forEachIndex;
	{
		_x params ["_squadIndex", "_squadName", "_groupIndex", "_groupName"];

		private _groupNet = _radioNets#_sideID#0 param [_squadIndex];
		if (isNil "_groupNet") then {
			_groupNet = [[_squadName, call _fnc_uniqueFrequencySR]];
			_radioNets#_sideID#0 set [_squadIndex, _groupNet];
		};
		private _teamNet = _groupNet param [_groupIndex + 1];
		if (isNil "_teamNet") then {
			_groupNet set [_groupIndex + 1, [_groupName, call _fnc_uniqueFrequencySR]];
		};
	} forEach _x;
} forEach _playable;

private _lrChannels = ["Infantry", "Support/Logistics"];
{
	for "_i" from 0 to count _lrChannels - 1 do {
		_x#1 pushBack call _fnc_uniqueFrequencyLR;
	};
} forEach _radioNets;

BRM_FMK_Plugin_RadioFreq_radioNets = _radioNets;
publicVariable "BRM_FMK_Plugin_RadioFreq_radioNets";
