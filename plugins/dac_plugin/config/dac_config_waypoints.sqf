if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	DAC_fConfigWP = compile preprocessFileLineNumbers "dac\dac_config_waypoints.sqf";
	_this call DAC_fConfigWP
};

params ["_type", "_index"];

private ["_checkRadius1", "_checkRadius2", "_checkAreaH", "_checkMaxH", "_checkMinH", "_checkNear", "_checkObjH1", "_checkObjH2", "_checkCount", "_checkResol"];

if (_type >= 0 && _type < 5) exitWith {
	switch (_index) do {
		case 0: {
			//               Soldier Vehicle Tank  Air   Camp
			_checkRadius1 = [3,      10,     10,   10,   3   ];
			_checkRadius2 = [15,     20,     20,   40,   40  ];
			_checkAreaH   = [40,     15,     20,   10,   20  ];
			_checkMaxH    = [5000,   5000,   5000, 5000, 5000];
			_checkMinH    = [1,      1,      1,    1,    3   ];
			_checkNear    = [20,     30,     30,   100,  300 ];
			_checkObjH1   = [1.5,    0.5,    0.5,  0.2,  2   ];
			_checkObjH2   = [30,     15,     15,   5,    30  ];
			_checkCount   = [200,    200,    200,  500,  1500];
			_checkResol   = [45,     36,     36,   12,   12  ];
		};
		case 1: {
			//               Soldier Vehicle Tank  Air   Camp
			_checkRadius1 = [3,      10,     10,   10,   3   ];
			_checkRadius2 = [12,     15,     15,   30,   30  ];
			_checkAreaH   = [50,     20,     25,   15,   15  ];
			_checkMaxH    = [5000,   5000,   5000, 5000, 5000];
			_checkMinH    = [1,      1,      1,    1,    3   ];
			_checkNear    = [0,      0,      0,    75,   150 ];
			_checkObjH1   = [2.5,    1.5,    1.5,  0.5,  0.5 ];
			_checkObjH2   = [30,     15,     15,   5,    4   ];
			_checkCount   = [200,    200,    200,  500,  1500];
			_checkResol   = [45,     36,     36,   12,   12  ];
		};
		case 2: {
			//               Soldier Vehicle Tank  Air   Camp
			_checkRadius1 = [3,      10,     10,   10,   3   ];
			_checkRadius2 = [10,     10,     10,   20,   20  ];
			_checkAreaH   = [75,     25,     25,   20,   20  ];
			_checkMaxH    = [5000,   5000,   5000, 5000, 5000];
			_checkMinH    = [1,      1,      1,    1,    1   ];
			_checkNear    = [0,      0,      0,    50,   100 ];
			_checkObjH1   = [3,      2,      2,    1.5,  1.5 ];
			_checkObjH2   = [30,     15,     15,   5,    4   ];
			_checkCount   = [200,    200,    200,  500,  1500];
			_checkResol   = [45,     36,     36,   12,   12  ];
		};
		case 3: {
			//               Soldier Vehicle Tank  Air   Camp
			_checkRadius1 = [3,      10,     10,   10,   3   ];
			_checkRadius2 = [50,     30,     30,   40,   50  ];
			_checkAreaH   = [100,    1,      1,    10,   10  ];
			_checkMaxH    = [5000,   5000,   5000, 5000, 5000];
			_checkMinH    = [5,      -1,     -1,   20,   20  ];
			_checkNear    = [0,      30,     30,   100,  200 ];
			_checkObjH1   = [0.1,    0.1,    0.1,  0.1,  0.1 ];
			_checkObjH2   = [30,     10,     10,   5,    4   ];
			_checkCount   = [200,    200,    200,  500,  500 ];
			_checkResol   = [45,     36,     36,   12,   12  ];
		};
		case 4: {
			//               Soldier Vehicle Tank  Air   Camp
			_checkRadius1 = [3,      10,     10,   10,   3   ];
			_checkRadius2 = [0,      0,      0,    0,    0   ];
			_checkAreaH   = [50,     50,     50,   50,   50  ];
			_checkMaxH    = [5000,   5000,   5000, 5000, 5000];
			_checkMinH    = [5,      5,      3,    5,    5   ];
			_checkNear    = [0,      0,      0,    0,    3   ];
			_checkObjH1   = [5,      0.1,    0.1,  8,    5   ];
			_checkObjH2   = [50,     50,     5,    5,    50  ];
			_checkCount   = [500,    500,    500,  500,  500 ];
			_checkResol   = [18,     18,     18,   18,   18  ];
		};
		case 5: {
			//               Soldier Vehicle Tank  Air   Camp
			_checkRadius1 = [3,      10,     10,   10,   3   ];
			_checkRadius2 = [10,     10,     10,   20,   20  ];
			_checkAreaH   = [50,     50,     50,   50,   50  ];
			_checkMaxH    = [5000,   5000,   5000, 5000, 5000];
			_checkMinH    = [-5,     -5,     -3,   -5,   -5  ];
			_checkNear    = [0,      0,      0,    0,    3   ];
			_checkObjH1   = [5,      0.1,    0.1,  8,    5   ];
			_checkObjH2   = [50,     50,     5,    5,    50  ];
			_checkCount   = [500,    500,    500,  500,  500 ];
			_checkResol   = [18,     18,     18,   18,   18  ];
		};
	};

	if (isNil "BRM_FMK_DAC_cfgWaypoints") then {
		BRM_FMK_DAC_cfgWaypoints = if (fileExists "dac\dac_config_waypoints.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_waypoints.sqf" } else { {} };
	};
	call BRM_FMK_DAC_cfgWaypoints;

	if (DAC_Basic_Value != 5 && (isNil "_checkRadius1" || isNil "_checkRadius2" || isNil "_checkAreaH" || isNil "_checkMaxH" || isNil "_checkMinH" || isNil "_checkNear" || isNil "_checkObjH1" || isNil "_checkObjH2" || isNil "_checkCount" || isNil "_checkResol")) exitWith {
		DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
		systemChat "Error: DAC_Config_Waypoints > No valid config number";
	};

	[
		[_checkRadius1 select _type, _checkRadius2 select _type, _checkResol select _type],
		_checkAreaH select _type, _checkNear select _type,
		[_checkObjH1 select _type, _checkObjH2 select _type], _checkMaxH select _type,
		_checkMinH select _type, _checkCount select _type, call compile format ["DAC_WP_Pool_%1", ["S", "V", "T", "A", "C"] select _type]
	]
};

[]
