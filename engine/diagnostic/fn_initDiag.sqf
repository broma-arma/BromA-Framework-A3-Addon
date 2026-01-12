private _marker = if (isServer) then {
	[true, "BRM_FMK_Engine_diagServer", [0, -100, 0], nil, nil, "mil_dot_noShadow"] call BRM_FMK_fnc_newMarker
} else {
	_this
};
[{ _this select 0 call BRM_FMK_Engine_fnc_updateDiag; }, 5, _marker] call CBA_fnc_addPerFrameHandler;

if !(isServer) exitWith {};

_marker call BRM_FMK_Engine_fnc_updateDiag;

BRM_FMK_Engine_diagHCs = []; // Don't change to hashmap, used for ordering.

addMissionEventHandler ["PlayerConnected", {
	params ["", "_uid", "", "", "_owner", ""];

	if (_uid find "HC" == 0) then {
		private _i = BRM_FMK_Engine_diagHCs pushBack _owner;
		private _marker = [true, format ["BRM_FMK_Engine_diagHC%1", _owner], [0, (_i + 1) * -150 - 100, 0], nil, nil, "mil_dot_noShadow"] call BRM_FMK_fnc_newMarker;
		_marker remoteExec ["BRM_FMK_Engine_fnc_initDiag", _owner];
	};
}];

addMissionEventHandler ["PlayerDisconnected", {
	params ["", "_uid", "", "", "_owner", ""];

	if (_uid find "HC" == 0) then {
		private _i = BRM_FMK_Engine_diagHCs find _owner;
		if (_i != -1) then {
			deleteMarker format ["BRM_FMK_Engine_diagHC%1", _owner];
			BRM_FMK_Engine_diagHCs deleteAt _i;
			for "_j" from _i to count BRM_FMK_Engine_diagHCs - 1 do {
				format ["BRM_FMK_Engine_diagHC%1", BRM_FMK_Engine_diagHCs select _j] setMarkerPos [0, (_j + 1) * -150 - 100, 0];
			};
		};
	};
}];
