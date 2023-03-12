params ["_group",["_type",""]];

#define GRUNT_MARKER_SIZE 0.5
#define SL_MARKER_SIZE 0.85

private _side = side _group;

{
	private _marker = createMarker ["ais_mrk_"+str(_x), _x];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_dot_noShadow";
	_marker setMarkerColor ([_side] call BRM_FMK_AIS_fnc_getSideColor);

	if (_x != leader _x) then {
		_marker setMarkerSize [GRUNT_MARKER_SIZE,GRUNT_MARKER_SIZE];
	} else {
		_marker setMarkerSize [SL_MARKER_SIZE,SL_MARKER_SIZE];
		_marker setMarkerText (format ["%1 (%2)",_type,count units _group]);
	};

	[_x, _marker,_type] spawn {
		params ["_unit","_marker","_type"];

		private _group = (group _unit);

		while {alive _unit} do {

			if (_unit ==  leader (group _unit)) then {
				_marker setMarkerSize [SL_MARKER_SIZE,SL_MARKER_SIZE];
				if (_type == "") then {
					_marker setMarkerText (format ["(%1/%2)",{alive _x} count units _group,{alive _x && !(isObjectHidden _x)} count units _group]);
				} else {
					_marker setMarkerText (format ["%1 (%2/%3)",_type,{alive _x} count units _group,{alive _x && !(isObjectHidden _x)} count units _group]);
				};
			} else {
				_marker setMarkerSize [GRUNT_MARKER_SIZE,GRUNT_MARKER_SIZE];
				_marker setMarkerText "";
			};

			_marker setMarkerPos getPos _unit;
			sleep 0.5;
		};

		// group leader dies but doesn't transfer to other unit for some fucking reason
		if (_unit ==  leader _group) then {
			_group selectLeader (((units _group) select {alive _x}) select 0);
		};

		deleteMarker _marker;
	};

} forEach units _group;
