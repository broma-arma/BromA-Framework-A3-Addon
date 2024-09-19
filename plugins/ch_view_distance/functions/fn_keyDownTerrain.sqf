if (CHVD_keyDown) exitWith {};
CHVD_keyDown = true;

private ["_vehTypeString"];
_updateType = [_this, 0, 0, [0]] call BIS_fnc_param;
if (_updateType isEqualTo 0) exitWith {};
_terrainGridArray = [50, 48.99, 25, 12.5, 3.125];

if (!isNull (findDisplay 2900)) then {call BRM_FMK_Plugin_CHVD_fnc_openDialog};

switch (CHVD_vehType) do {
	case 1: {
		_vehTypeString = "car";
	};
	case 2: {
		_vehTypeString = "air";
	};
	default {
		_vehTypeString = "foot";
	};
};

_terrainGridVar = "CHVD_" + _vehTypeString + "Terrain";
_terrainGrid = call compile _terrainGridVar;
_terrainIndex = switch (true) do {
	case (_terrainGrid >= 49): {0};
	case (_terrainGrid >= 48.99): {1};
	case (_terrainGrid >= 25): {2};
	case (_terrainGrid >= 12.5): {3};
	case (_terrainGrid >= 3.125): {4};
	default {1};
};
_terrainIndex = (_terrainIndex + _updateType) max 0 min 4;
_terrainGrid = _terrainGridArray select _terrainIndex;

if (!CHVD_allowNoGrass) then {
	_terrainIndex = _terrainIndex max 1;
	_terrainGrid = _terrainGrid min 48.99;
};

call compile format ["%1 = %2", _terrainGridVar, _terrainGrid];
call compile format ["profileNamespace setVariable ['%1',%1]", _terrainGridVar];

call BRM_FMK_Plugin_CHVD_fnc_updateTerrain;

_terrainString = "";
for "_i" from (37.125) to 3.125 step -1 do {
	if (round ((sqrt _terrainGrid) * 10) -18  >= 53 / 37.125 * _i) then {
		_terrainString = _terrainString + "·";
	} else {
		_terrainString = _terrainString + "I";
	};
};

_terrainQualityArray = [
	if (isLocalized "STR_chvd_low") then {localize "STR_chvd_low"} else {"Low"},
	if (isLocalized "STR_chvd_standard") then {localize "STR_chvd_standard"} else {"Standard"},
	if (isLocalized "STR_chvd_high") then {localize "STR_chvd_high"} else {"High"},
	if (isLocalized "STR_chvd_veryHigh") then {localize "STR_chvd_veryHigh"} else {"Very High"},
	if (isLocalized "STR_chvd_ultra") then {localize "STR_chvd_ultra"} else {"Ultra"}
];
_terrainQuality = _terrainQualityArray select _terrainIndex;
_textTerrainQuality = if (isLocalized "STR_chvd_terrainQuality") then {localize "STR_chvd_terrainQuality"} else {"Terrain Quality"};
_textTerrainGrid = if (isLocalized "STR_chvd_terrainGrid") then {localize "STR_chvd_terrainGrid"} else {"Terrain Grid"};

hintSilent parseText format ["<t align='left' size='1.33'>
%2: <t align='right'>%3</t>
<br />
 %4: <t align='right'>%5</t>
<br />
 <t size='2' shadow='0' color='%1'>%6</t>
</t>",
[profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843], profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019], profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862], profilenamespace getvariable ['GUI_BCG_RGB_A',0.7]] call BIS_fnc_colorRGBAtoHTML,
_textTerrainQuality,
_terrainQuality,
_textTerrainGrid,
_terrainGrid,
_terrainString
];

terminate (missionNamespace getVariable ["CHVD_hintHandle", scriptNull]);
CHVD_hintHandle = [] spawn {
	uiSleep 2;
	hintSilent "";
};

[] spawn {
	uiSleep 0.05;
	CHVD_keyDown = false;
};
