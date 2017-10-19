/*
================================================================================

NAME:
    BRM_fnc_readExtraction

AUTHOR(s):
    Nife

DESCRIPTION:
    Reads all the extraction points in the map and marks them properly.

PARAMETERS:
    None.

USAGE:
    [] call BRM_fnc_readExtraction

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
			"ColorBlack"
		};
		["global", getPos _x, "mil_end", _color, format ["Extraction #%1", _extName select [2, count _extName] joinString "_"], [1, 1], (getDir _x) + 180, 1] call BRM_FMK_fnc_newMarkerIcon;
	};
} forEach (allMissionObjects "");

{
	private _index = _sides find (missionNamespace getVariable format ["side_%1_side", _x]);
	(missionNamespace setVariable [format ["extraction_%1", _x], [
		missionNamespace getVariable format ["mission_extraction_%1", _sideStrs select _index],
		_extractionPoints select _index
	]]);
} forEach ["a", "b", "c"];
