/*
================================================================================

DEPRECATED:
    Used by Mission Framework <= 0.7.5

NAME:
    BRM_FMK_fnc_readExtraction

AUTHOR(s):
    Nife

DESCRIPTION:
    Reads all the extraction points in the map and marks them properly.

PARAMETERS:
    None.

USAGE:
    PostInit

RETURNS:
    Nothing.

================================================================================
*/

if (!isServer) exitWith {};

private _sides = [WEST, EAST, RESISTANCE, CIVILIAN];
private _sideStrs = ["blu", "op", "ind", "civ"];
private _colors = ["ColorBLUFOR", "ColorOPFOR", "ColorIndependent", "ColorCivilian"];

private _extractionPoints = [[], [], [], []]; // Blu, Op, Ind, Civ

{
	private _index = _sides find (missionNamespace getVariable format ["side_%1_side", _x]);
	(_extractionPoints select _index) append (missionNamespace getVariable format ["mission_extraction_points_%1", _x]);
} forEach ["a", "b", "c"];

{
	private _extName = str _x splitString "_";
	if (count _extName > 2 && {_extName select 1 == "extraction"}) then {
		private _index = _sideStrs find (_extName select 0);
		private _color = if (_index != -1) then {
			_extractionPoints select _index pushBackUnique _x;
			_colors select _index
		} else {
			["Error: Extraction point '%1' has unknown side '%2'", _x, _extName select 0] call BIS_fnc_error;

			"ColorBlack"
		};

		if (_index != -1) then {
			[_sides select _index, getPos _x, getDir _x, _color, format ["Extraction #%1", _extName select [2, count _extName] joinString "_"]] remoteExec ["BRM_FMK_fnc_createExtractionMarker", 0, format ["BRM_FMK_fnc_createExtractionMarker_%1", _index]];
		};
	};
} forEach (allMissionObjects "");

{
	private _side = missionNamespace getVariable format ["side_%1_side", _x];
	private _index = _sides find _side;
	private _sideExtractionPoints = _extractionPoints select _index;
	if (count _sideExtractionPoints == 0 && { _side in mission_require_extraction }) then {
		["Warning: %1 (%2) requires extraction, but has no extraction points", format ["side_%1", _x], _side] call BIS_fnc_error;
	};
	missionNamespace setVariable [format ["brm_fmk_extraction_%1", _x], [
		missionNamespace getVariable format ["mission_extraction_%1", _sideStrs select _index],
		_sideExtractionPoints
	]];
} forEach ["a", "b", "c"];
