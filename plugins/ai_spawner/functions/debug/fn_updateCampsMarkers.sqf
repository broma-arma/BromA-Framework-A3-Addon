params ["_id","_camps","_zone"];

{
	_x params ["_camp","_type","_spawns"];

	if (_spawns > 0) then {
		format ["BRM_FMK_AIS_ico_%1_%2",_id,_camp] setMarkerText format [
			"%1 (%2)",
			_type,
			_spawns
		];
	};
} forEach _camps;
