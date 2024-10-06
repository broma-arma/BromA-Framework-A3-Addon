if !(hasInterface && { !(player isKindOf "VirtualSpectator_F") && markerShape "ao" != "" }) exitWith {};

if (isNil "left_ao_do") then {
	left_ao_do = { hintSilent "Please remain within the area of operations." };
};

[{
	if (player call BRM_FMK_fnc_alive) then {
		private _targetObject = vehicle player;
		if (_targetObject isKindOf "Land" && !(_targetObject inArea "ao")) then {
			private _pos = _targetObject getPos [1, _targetObject getDir markerPos "ao"];
			[] call left_ao_do;
		};
	};
}, 0.1] call CBA_fnc_addPerFrameHandler;
