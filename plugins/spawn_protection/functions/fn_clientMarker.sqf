if (!hasInterface) exitWith {};

params [["_pos", []], ["_a", 50], ["_b", 50], ["_angle", 0], ["_isRectangle", true], ["_c", 0]];

if (count _pos == 0) exitWith {
	["Alert", ["Spawn protection is disabled!"]] call BIS_fnc_showNotification;
	deleteMarkerLocal "BRM_FMK_SpawnProtection_Marker";
};

private _sideIndex = [side_a_side, side_b_side, side_c_side] find (player getVariable ["unit_side", side player]);

if (_sideIndex == -1) exitWith {
	private _errorMsg = format ["ERROR [Spawn Protection] Invalid side (%1:%2_%3:%4)", side player, player getVariable ["unit_side", side player], mission_game_mode, mission_enable_side_c];
	systemChat _errorMsg;
	diag_log text _errorMsg;
};

// Create a local marker
private _spawnMarker = createMarkerLocal ["BRM_FMK_SpawnProtection_Marker", _pos];
_spawnMarker setMarkerSizeLocal [_a, _b];
_spawnMarker setMarkerDirLocal _angle;
_spawnMarker setMarkerShapeLocal (if (_isRectangle) then { "RECTANGLE" } else { "ELLIPSE" });
_spawnMarker setMarkerBrushLocal "SolidBorder";
_spawnMarker setMarkerColorLocal "Color" + ([side_a_color, side_b_color, side_c_color] select _sideIndex);
_spawnMarker setMarkerAlphaLocal 0.2;
