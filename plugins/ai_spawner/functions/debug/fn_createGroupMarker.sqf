#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_createGroupMarker

Description:
	Create markers for a group.

Parameters:
	_group - Group [GROUP]
	_type - Group type [STRING, default ""]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

#define LEADER_MARKER_SIZE 0.85
#define GRUNT_MARKER_SIZE 0.5

_this spawn {
	params ["_group", ["_type", ""]];

	if (_type != "") then {
		_type = _type + " ";
	};

	private _unitMarkers = createHashMap;
	while { !isNull _group } do {
		private _units = units _group;
		if (count _units == 0) then {
			break;
		};
		private _side = side _group;
		private _leader = leader _group;
		private _remove = +_units;
		{
			if (alive _x) then {
				_remove = _remove - [_x];
				private _marker = _unitMarkers getOrDefaultCall [hashValue _x, {
					[true, format ["BRM_FMK_Plugin_AIS_mrk_%1", _x], nil, nil, nil, "mil_dot_noShadow", [_side, true] call BIS_fnc_sideColor] call BRM_FMK_fnc_newMarker
				}, true];

				if (_x == _leader) then {
					_marker setMarkerSizeLocal [LEADER_MARKER_SIZE, LEADER_MARKER_SIZE];
					_marker setMarkerTextLocal format ["%1(%2/%3)", _type, { alive _x } count units _group, { alive _x && !isObjectHidden _x } count units _group];
				} else {
					_marker setMarkerSizeLocal [GRUNT_MARKER_SIZE, GRUNT_MARKER_SIZE];
					_marker setMarkerTextLocal "";
				};

				_marker setMarkerPos _x;
			};
		} forEach _units;

		{
			private _marker = _unitMarkers get hashValue _x;
			if (!isNil "_marker") then {
				deleteMarker _marker;
			};
		} forEach _remove;

		sleep 0.5;
	};

	{
		deleteMarker _y;
	} forEach _unitMarkers;
};
