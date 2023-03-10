/*
	state - true - force start spawner / false - force end spawner
*/
if (!mission_ai_controller) exitWith {};

params ["_id","_state"];

private _spawner = [];
private _spawnerIndex = 0;

{
	if (_x select 0 == _id) then {
		_spawner = _x;
		_spawnerIndex = _forEachIndex;
	}
} forEach AIS_spawners;

if (count _spawner > 0) then {
	private _conditions = if (_state) then {
		[{(true)},((_spawner select 11) select 1)];
	} else {
		[((_spawner select 11) select 0),{(true)}];
	};

	_spawner set [11,_conditions];
	AIS_spawners set [_spawnerIndex,_spawner];
};
