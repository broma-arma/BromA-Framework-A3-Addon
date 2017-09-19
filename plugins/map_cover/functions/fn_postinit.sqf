if !(isServer) exitWith {};

private _center = createCenter sideLogic;
private _group = createGroup _center;
private _pos = getMarkerPos "ao";
private _size = getMarkerSize "ao";
private _rot = markerDir "ao";

private _logic = _group createUnit ["Logic", _pos, [], 0, "CAN_COLLIDE"];
_logic setVariable ["objectArea", [_size select 0, _size select 1, _rot, true, 0]];

[_logic, nil, true] call BIS_fnc_moduleCoverMap;

for "_i" from 0 to 270 step 90 do {
    (format ["bis_fnc_moduleCoverMap_%1", _i]) setMarkerBrush "SolidFull";
    (format ["bis_fnc_moduleCoverMap_%1", _i]) setMarkerAlpha 0.8;
};