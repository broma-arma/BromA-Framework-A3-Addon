if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	DAC_fConfigEvents = compile preprocessFileLineNumbers "dac\dac_config_events.sqf";
	_this call DAC_fConfigEvents
};

params ["_index"];

private ["_Events_Vehicle", "_Events_Unit_S", "_Events_Unit_V", "_Events_Unit_T", "_Events_Unit_A", "_Events_Unit_C", "_Events_Unit_H", "_faction"];

if (isNil "BRM_FMK_DAC_strToNum_factions") then {
	BRM_FMK_DAC_strToNum_factions = ["AUTO", "VANILLA"];
};

if (_index > 0 && _index <= count BRM_FMK_DAC_strToNum_factions) then {
	_faction = BRM_FMK_DAC_strToNum_factions select _index - 1;
};

if (!isNil "_faction") then {
	private _initGroup = format ["{ [_x, '%1'] call BRM_FMK_fnc_initAI } forEach units _group;", _faction];
	private _initUnit = format ["[_unit, '%1'] call BRM_FMK_fnc_initAI;", _faction];

	//                 Create        ReachWP NotAliveGroup NotAliveUnit BeforeReduce AfterBuildUp DetectEnemys 
	_Events_Unit_S  = [[_initGroup], [],     [],           [],          [],          [_initUnit], []           ];
	_Events_Unit_V  = [[_initGroup], [],     [],           [],          [],          [_initUnit], []           ];
	_Events_Unit_T  = [[_initGroup], [],     [],           []                                                  ];
	_Events_Unit_A  = [[_initGroup], [],     [],           []                                                  ];
	_Events_Unit_C  = [[_initGroup], [],     [],           [],          [],          [_initUnit]               ];
	_Events_Unit_H  = [[_initGroup], [],     [],           []                                                  ];

	//                 InitWheel InitTrack InitHeli
	_Events_Vehicle = [[],       [],       []      ];
};

if (isNil "BRM_FMK_DAC_cfgEvents") then {
	BRM_FMK_DAC_cfgEvents = if (fileExists "dac\dac_config_events.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_events.sqf" } else { {} };
};
call BRM_FMK_DAC_cfgEvents;

if (DAC_Basic_Value != 5 && (isNil "_Events_Vehicle" || isNil "_Events_Unit_S" || isNil "_Events_Unit_V" || isNil "_Events_Unit_T" || isNil "_Events_Unit_A" || isNil "_Events_Unit_C" || isNil "_Events_Unit_H")) exitWith {
	DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
	systemChat "Error: DAC_Config_Events > No valid config number";
};

[_Events_Unit_S, _Events_Unit_V, _Events_Unit_T, _Events_Unit_A, _Events_Unit_C, _Events_Unit_H, _Events_Vehicle]
