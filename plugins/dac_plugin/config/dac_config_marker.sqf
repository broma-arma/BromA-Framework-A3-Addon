if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	DAC_fConfigMarker = compile preprocessFileLineNumbers "dac\dac_config_marker.sqf";
	_this call DAC_fConfigMarker
};

params ["_index"];

private [
	"_setShowZones", "_setShowWPs", "_setShowUnit", "_setGroupType",
	"_setMarkerText", "_setMarkerDel", "_setMarkerRefresh", "_setSizeWpLine", "_setSizeLeaderLine",
	"_setSizeZoneLine", "_setSizeCampLine", "_setSizeZoneBorder", "_setArtiMarker", "_setCampMarker",
	"_setMarkerClass", "_setSideColor"
];

if (_index == 0) exitwith {};

switch (_index) do {
	case 1: {
		_setShowZones      = 2;
		_setShowWPs        = 1;
		_setShowUnit       = [1, 1, 1, 1];
		_setGroupType      = 1;
		_setMarkerText     = ["if(format[""%1"", _group] == ""<NULL-group>"") then {format["""", typeof _unit]} else {format[""(%1)"", count units _group]}"];
		_setMarkerDel      = 1;
		_setMarkerRefresh  = [0.3, 0.3];
		_setSizeWpLine     = [1, 1];
		_setSizeLeaderLine = 1;
		_setSizeZoneLine   = 2;
		_setSizeCampLine   = 4;
		_setSizeZoneBorder = 4;
		_setArtiMarker     = 1;
		_setCampMarker     = 2;
		_setSideColor      = [
			"ColorOPFOR", "ColorBLUFOR", "ColorIndependent", "ColorCivilian", "ColorUNKNOWN",
			"ColorBlack", "ColorBlack", "ColorBlack"
		];
		_setMarkerClass    = [
			[["STATICWEAPON",     "o_support",             [0.8, 0.8], 0]],
			[["MAN",              "o_inf",                 [0.8, 0.8], 0],
				["UAV_AI_base_F", "o_uav",                 [0.8, 0.8], 0]
			],
			[["CAR",              "o_motor_inf",           [0.8, 0.8], 0],
				["Wheeled_APC",   "o_mech_inf",            [0.8, 0.8], 0]
			],
			[["TANK",             "o_armor",               [0.8, 0.8], 0],
				["APC",           "o_mech_inf",            [0.8, 0.8], 0],
				["Tracked_APC",   "o_mech_inf",            [0.8, 0.8], 0]
			],
			[["MOTORCYCLE",       "o_motor_inf",           [0.8, 0.8], 0]],
			[["AIR",              "o_air",                 [0.8, 0.8], 0],         
				["PLANE",         "o_plane",               [0.8, 0.8], 0],
				["ParachuteBase", "mil_triangle_noShadow", [0.8, 0.8], 0]
			],
			[["SHIP",             "o_naval",               [0.8, 0.8], 0]],
			[["OTHER",            "o_unknown",             [0.8, 0.8], 0]]
		];
	};
};

if (isNil "BRM_FMK_DAC_cfgMarker") then {
	BRM_FMK_DAC_cfgMarker = if (fileExists "dac\dac_config_marker.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_marker.sqf" } else { {} };
};
call BRM_FMK_DAC_cfgMarker;

if (DAC_Basic_Value != 5 && (isNil "_setShowZones" || isNil "_setShowWPs" || isNil "_setShowUnit" || isNil "_setGroupType" || isNil "_setMarkerText" || isNil "_setMarkerDel" || isNil "_setMarkerRefresh" || isNil "_setSizeWpLine" || isNil "_setSizeLeaderLine" || isNil "_setSizeZoneLine" || isNil "_setSizeCampLine" || isNil "_setSizeZoneBorder" || isNil "_setArtiMarker" || isNil "_setCampMarker" || isNil "_setSideColor" || isNil "_setMarkerClass")) exitWith {
	DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
	systemChat "Error: DAC_Config_Waypoints > No valid config number";
};

[
	_setShowZones, _setShowWPs, _setShowUnit, _setGroupType, _setMarkerText,
	_setMarkerDel, _setMarkerRefresh, _setSizeWpLine, _setSizeLeaderLine,
	_setSizeZoneLine, _setSizeCampLine, _setSizeZoneBorder, _setArtiMarker,
	_setCampMarker, _setSideColor, _setMarkerClass
]
