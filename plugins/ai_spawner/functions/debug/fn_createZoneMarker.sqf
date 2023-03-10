params ["_id","_zone",["_alpha",0.25]];

private _area = triggerArea _zone;
_area params ["_areaX","_areaY","_angle","_isRectangle"];

private _side = ([_id] call BRM_FMK_AIS_getSpawner) select AIS_SPAWNER_SIDE;
private _shape = if (_isRectangle) then {"RECTANGLE"} else {"ELLIPSE"};

private _marker = createMarker [(format ["ais_mrk_%1_%2",_id,_zone]), getPos _zone];
_marker setMarkerShape _shape;
_marker setMarkerSize [_areaX,_areaY];
_marker setMarkerColor ([_side,true] call BRM_FMK_AIS_getSideColor);
_marker setMarkerDir _angle;
_marker setMarkerAlpha _alpha;

_markerText = [_id,_zone,"mil_dot",([_side,true] call BRM_FMK_AIS_getSideColor),""] call BRM_FMK_AIS_createIconMarker;
