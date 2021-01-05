#include "component.hpp"

if !(hasInterface && {!player_is_spectator}) exitWith {};

#include "includes\settings.sqf"

private _aoMarker = "ao";
private _aoPos = [(getMarkerPos _aoMarker) select 0, (getMarkerPos _aoMarker) select 1, 0];

[{
    (_this select 0) params["_aoMarker", "_aoPos"];

    private _targetObject = (vehicle player);
    private _isDead = player getVariable ["isDead", false];

    if (!_isDead) then {
        if (_targetObject isKindOf "Land") then {
            if (!((getPos _targetObject) inArea "ao")) then {
                private _pos = _targetObject getPos [1, _targetObject getDir _aoPos];
                [] call left_ao_do;
            };
        };
    };
}, 0.1, [_aoMarker, _aoPos]] call CBA_fnc_addPerFrameHandler;
