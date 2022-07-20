if !(hasInterface && !player_is_spectator && markerShape "ao" != "") exitWith {};

[{
	params ["_args", "_handle"];
	_args params ["_callback"];

    if !(player getVariable ["isDead", false]) then {
		private _targetObject = vehicle player;
        if (_targetObject isKindOf "Land" && !(_targetObject inArea "ao")) then {
			private _pos = _targetObject getPos [1, _targetObject getDir markerPos "ao"];
			[] call _callback;
        };
    };
}, 0.1, [[] call BRM_FMK_AOLimit_fnc_getSettings select 0]] call CBA_fnc_addPerFrameHandler;
