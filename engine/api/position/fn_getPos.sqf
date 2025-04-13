/*
================================================================================

NAME:
    BRM_FMK_fnc_getPos

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Get position of an entity.

PARAMETERS:
    0 - Entity (OBJECT / GROUP / MARKER / LOCATION / POSITION / WAYPOINT / ARRAY)

USAGE:
    player call BRM_FMK_fnc_getPos;

RETURNS:
    OBJECT / GROUP / MARKER / LOCATION / WAYPOINT: ASL position
    ARRAY:
        []: [0, 0, 0]
        [n]: ASL position for [n, n]
        [x, y]: ASL position for [x, y]
        [x, y, z(, ...)]: [x, y, z]
    (POSITION)

================================================================================
*/

params [["_entity", [], [objNull, grpNull, "", locationNull, 0, controlNull, []]]];

if (_entity isEqualType 0) then {
	_entity = _this;
};

switch (typeName _entity) do {
	case "OBJECT": { getPosASL _entity };
	case "GROUP": { getPosASL leader _entity };
	case "STRING": { AGLtoASL getMarkerPos [_entity, true] };
	case "LOCATION": { AGLToASL locationPosition _entity };
	case "ARRAY": {
		switch (count _entity) do {
			case 0: { [0, 0, 0] };
			case 1: {
				_entity = [_entity#0, _entity#0];
				_entity + [getTerrainHeightASL _entity]
			};
			case 2: {
				if (_entity select 0 isEqualType 0) then {
					_entity + [getTerrainHeightASL _entity]
				} else { // Waypoint [Group/Object, Number]
					AGLtoASL waypointPosition _entity
				}
			};
			default { _entity select [0, 3]; };
		}
	};
	default { [] };
}
