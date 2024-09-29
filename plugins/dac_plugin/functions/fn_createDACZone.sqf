/*
================================================================================

NAME:
    BRM_FMK_Plugin_DAC_fnc_createDACZone

AUTHOR(s):
    Nife

DESCRIPTION:
    Create a DAC zone

PARAMETERS:
    0 - Variable name for the zone (STRING)
    1 - Zone Id (NUMBER)
    2 - Activation status. 0: Activated, 1: Deactivated, 2: Automatic (NUMBER)
    3 - Faction DAC_Config_Events number (NUMBER)
    4 - Infantry (ARRAY):
        0 - Number of groups to generate (NUMBER)
        1 - Size of a group (NUMBER)
        2 - Amount of waypoints to generate (NUMBER)
        3 - Amount of waypoints each group gets (NUMBER)
    5 - Wheeled vehicles, same format as Infantry (ARRAY)
    6 - Tracked vehicles, same format as Infantry (ARRAY)
    7 - Helicopters (ARRAY)
        0 - Number of groups to generate (NUMBER)
        1 - Size of a group (NUMBER)
        2 - Amount of waypoints each group gets (NUMBER)
    8 - Side. 0: East, 1: West, 2: Resistance, 3: Civilian (NUMBER)
    9 - Skill. 0: Easy, 1: Normal, 2: Stealth, 3: Hard (NUMBER)
    10 - Area (ARRAY)
    11 - Position (ARRAY)

USAGE:
	["DACZone1234", 1, 0, 1, [1, 1, 10, 40], [2, 1, 10, 40], [], [], 1, 1, [250, 250, 0, false], [300, 950]] call BRM_FMK_Plugin_DAC_fnc_createDACZone;

RETURNS:
    Nothing.

================================================================================
*/

params ["_name", "_id", "_status", "_faction", "_infantry", "_wheeledVehicles", "_trackedVehicles", "_helicopters", "_side", "_skill", "_area", "_pos"];

if (_status == 2) then {
	_this set [2, 1]; // _status = Deactivate

	private _automaticArea = +_area;
	_automaticArea set [0, _automaticArea # 0 * 5];
	_automaticArea set [1, _automaticArea # 1 * 5];

	private _markerColor = switch (_side) do {
		case 0: { "ColorBlue" }; // BLUFOR
		case 1: { "ColorRed" }; // OPFOR
		case 2: { "ColorGreen" }; // RESISTANCE
		case 3: { "ColorPurple" }; // CIVILIAN
	};

	_automaticArea params ["_aaX", "_aaY", "_aaAngle", "_aaRectangle"];
	["local", _pos, (if (_aaRectangle) then { "RECTANGLE" } else { "ELLIPSE" }), "Solid", _markerColor, [_aaX, _aaY], _aaAngle, 0.5] call BRM_FMK_fnc_newMarkerArea;

	private _trg = createTrigger ["EmptyDetector", _pos];
	_trg setTriggerArea _automaticArea;
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements ["this && time > 10", format ["[%1] call DAC_Activate", _name], format ["[%1] call DAC_Deactivate", _name]];
};

private _trigger = createTrigger ["EmptyDetector", _pos];
_trigger setTriggerArea _area;
_trigger setTriggerActivation ["NONE", "NOT PRESENT", false];
_trigger setTriggerStatements ["true", format (["['%1', [%2, %3, %4], %5, %6, %7, %8, [%9, %9, %10, 0]] call BRM_FMK_Plugin_DAC_fnc_DACZone"] + _this), ""];
missionNamespace setVariable [_name, _trigger];

BRM_FMK_Plugin_DAC_zones pushBack [_name, _id];
