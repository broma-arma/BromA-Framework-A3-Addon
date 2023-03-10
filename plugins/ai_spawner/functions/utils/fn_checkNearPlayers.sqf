params ["_position","_radius",["_unit",objNull]];

private _isPlayerNear = false;

if (isNull _unit) then {
	{
		if (_x distance2D _position < _radius) then {
			_isPlayerNear = true;
		};
	} forEach allPlayers;
} else {
	_isPlayerNear = (_unit distance2D _position < _radius)
};

_isPlayerNear
