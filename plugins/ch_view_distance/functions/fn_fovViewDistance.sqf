private ["_ret"];
_minViewDistance = [_this, 0, 0, [0]] call BIS_fnc_param;
_ret = _minViewDistance;

_zoom = call BRM_FMK_Plugin_CHVD_fnc_trueZoom;
if (_zoom >= 1) then {
	_ret = _minViewDistance + ((40000 / 74) * (_zoom - 1)) min viewDistance;
};

//systemChat str _ret;
_ret
