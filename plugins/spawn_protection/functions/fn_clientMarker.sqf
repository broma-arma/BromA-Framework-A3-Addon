if (!hasInterface) exitWith {};

if (!BRM_FMK_Engine_initialized) exitWith {
	[{ BRM_FMK_Engine_initialized }, { _this call BRM_FMK_Plugin_SpawnProtection_fnc_clientMarker; }, _this] call CBA_fnc_waitUntilAndExecute;
};

params [["_pos", []], ["_a", 50], ["_b", 50], ["_angle", 0], ["_isRectangle", true], ["_c", 0]];

if (count _pos == 0) exitWith {
	["Alert", ["Spawn protection is disabled!"]] call BIS_fnc_showNotification;
	deleteMarkerLocal "BRM_FMK_SpawnProtection_Marker";
};

private _sideChars = ["a", "b"];
if (mission_enable_side_c) then {
	_sideChars pushBack "c";
};

private _sideIndex = _sideChars apply { missionNamespace getVariable "side_" + _x + "_side" } find (player call BIS_fnc_objectSide);

if (_sideIndex == -1) exitWith {
	private _errorMsg = format ["ERROR [Spawn Protection] Invalid side (%1:%2_%3:%4)", side player, player call BIS_fnc_objectSide, mission_game_mode, mission_enable_side_c];
	systemChat _errorMsg;
	diag_log text _errorMsg;
};

// Create a local marker
private _spawnMarker = createMarkerLocal ["BRM_FMK_SpawnProtection_Marker", _pos];
_spawnMarker setMarkerSizeLocal [_a, _b];
_spawnMarker setMarkerDirLocal _angle;
_spawnMarker setMarkerShapeLocal (if (_isRectangle) then { "RECTANGLE" } else { "ELLIPSE" });
_spawnMarker setMarkerBrushLocal "SolidBorder";
_spawnMarker setMarkerColorLocal "Color" + (_sideChars apply { missionNamespace getVariable "side_" + _x + "_color" } select _sideIndex);
_spawnMarker setMarkerAlphaLocal 0.2;
