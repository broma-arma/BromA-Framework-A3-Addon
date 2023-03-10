params ["_position","_radius"];

private _visible = false;
private _positionASL = [_position select 0, _position select 1, getTerrainHeightASL _position];
private _positionASLHigh = _positionASL  vectorAdd [0, 0, 1.5];

{
    // Check if the cursor's position is in the player's view (filter the local player and virtual units)
    if ((side _x != sideLogic) && (((_x getRelDir _positionASLHigh) + 90) mod 360 < 180)) then {
        private _eyePos = eyePos _x;
        if (lineIntersectsSurfaces [_eyePos, _positionASL, _x, objNull] isEqualTo [] || (lineIntersectsSurfaces [_eyePos, _positionASLHigh, _x, objNull] isEqualTo [])) then {
            _visible = true; // is visible by players
        };
    };

    if ([_position,_radius,_x] call BRM_FMK_AIS_checkNearPlayers) then {
        _visible = true;
    };

} forEach allPlayers;

_visible
