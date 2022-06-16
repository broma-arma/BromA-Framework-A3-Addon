if !(hasInterface && markerShape "ao" != "") exitWith {};

markerPos "ao" params ["_posX", "_posY"];
markerSize "ao" params ["_sizeX", "_sizeY"];
if (_sizeX < 1 || _sizeY < 1) exitWith {};
private _dir = markerDir "ao";

private _sizeOut = 50000;
for "_i" from 0 to 270 step 90 do {
	private _dirI = _dir + _i;
	private _marker = createMarkerLocal [format ["BRM_FMK_MapCover_marker%1", _i], [_posX + sin _dirI * _sizeOut, _posY + cos _dirI * _sizeOut]];
	_marker setMarkerSizeLocal [[_sizeX, _sizeOut] select abs sin _i, _sizeOut - ([_sizeX, _sizeY] select abs cos _i)];
	_marker setMarkerDirLocal _dirI;
	_marker setMarkerShapeLocal "RECTANGLE";
	_marker setMarkerBrushLocal "Solid";
	_marker setMarkerColorLocal "ColorBlack";
	_marker setMarkerAlphaLocal 1;
};

private _fnc_configOptions = {
	params ["_config", "_default", ["_blacklist", []]];

	private _options = [[], [], 0];
	{
		private _configName = configName _x;
		if !(_configName in _blacklist) then {
			_options#0 pushBack _configName;
			_options#1 pushBack getText (_x >> "name");
		};
	} forEach ("getNumber (_x >> 'scope') > 0" configClasses _config);
	_options set [2, _options#0 find _default]; // Default index
	_options
};

private _fnc_updateMapCover = {
	for "_i" from 0 to 270 step 90 do {
		private _marker = (format ["BRM_FMK_MapCover_marker%1", _i]);
		_marker setMarkerBrushLocal BRM_FMK_MapCover_VAR_mapBrush;
		_marker setMarkerAlphaLocal BRM_FMK_MapCover_VAR_mapOpacity;
		_marker setMarkerColorLocal BRM_FMK_MapCover_VAR_mapColor;
	};
};

["BRM_FMK_MapCover_VAR_mapBrush", "LIST", ["Brush", "The style of the cover."], ["BromA Framework", "Map Cover"], [configFile >> "CfgMarkerBrushes", "SolidFull"] call _fnc_configOptions, 0, _fnc_updateMapCover] call CBA_fnc_addSetting;
["BRM_FMK_MapCover_VAR_mapColor", "LIST", ["Color", "The color of the cover."], ["BromA Framework", "Map Cover"], [configFile >> "CfgMarkerColors", "ColorBlack", ["Default"]] call _fnc_configOptions, 0, _fnc_updateMapCover] call CBA_fnc_addSetting;
["BRM_FMK_MapCover_VAR_mapOpacity", "SLIDER", ["Alpha", "The alpha of the cover."], ["BromA Framework", "Map Cover"], [0, 1, 0.7, 1], 0, _fnc_updateMapCover] call CBA_fnc_addSetting;
