params ["_id","_entity","_type","_color",["_text",""],["_alpha",1]];

private _position = [_entity] call BRM_FMK_AIS_toPosition;

private _marker = createMarker [format ["ais_ico_%1_%2",_id,_entity], _position];
_marker setMarkerShape "ICON";
_marker setMarkerType _type;
_marker setMarkerColor _color;
_marker setMarkerText _text;
_marker setMarkerAlpha _alpha;

_marker
