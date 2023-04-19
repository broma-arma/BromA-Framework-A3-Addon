#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_group"];

#define GRUNT_MARKER_SIZE [0.5, 0.5]
#define SL_MARKER_SIZE [0.85, 0.85]

private _color = [side _group] call FUNC(getSideColor);

private _type = _group getVariable [QGVAR(groupType), ""];
if (_type isNotEqualTo "") then {
	_type = _type + " ";
};

{
	_marker = createMarker [format [QGVAR(mrk_%1), _x call BIS_fnc_objectVar], _x];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_dot_noShadow";
	_marker setMarkerColor _color;

	[_x, _marker, _type] spawn {
		params ["_unit", "_marker", "_type"];

		private _group = group _unit;
		private _wasLeader = _unit == leader _group;

		if (_wasLeader) then {
			_marker setMarkerSize SL_MARKER_SIZE;
		} else {
			_marker setMarkerSize GRUNT_MARKER_SIZE;
		};

		while {alive _unit} do {
			if (_unit == leader _group) then {
				if (!_wasLeader) then {
					_marker setMarkerSize SL_MARKER_SIZE;
					_wasLeader = true;
				};

				private _units = units _group;
				private _text = format ["%1(%2/%3)", _type, {alive _x && !isObjectHidden _x} count _units, {alive _x} count _units];
				if (_text != markerText _marker) then {
					_marker setMarkerText format ["%1(%2/%3)", _type, {alive _x && !isObjectHidden _x} count _units, {alive _x} count _units];
				};
			} else {
				if (_wasLeader) then {
					_marker setMarkerSize GRUNT_MARKER_SIZE;
					_marker setMarkerText "";
					_wasLeader = false;
				};
			};

			_marker setMarkerPos getPos _unit;
			sleep 0.5;
		};

		// group leader dies but doesn't transfer to other unit for some fucking reason
		// TODO Test group leader transfer on death
		/*
		if (_unit == leader _group) then {
			private _units = units _group;
			private _index = _units findIf {alive _x};
			_group selectLeader (units _group select {alive _x} select 0);
		};
		*/

		deleteMarker _marker;
	};
} forEach units _group;
