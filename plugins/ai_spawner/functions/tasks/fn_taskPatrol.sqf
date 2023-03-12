params ["_group","_zone","_waypointCount","_waypointSettings"];

_waypointSettings = ([_waypointSettings,AIS_waypointSettings] call BRM_FMK_AIS_fnc_getById) select 1;

_waypointSettings params [
	"_waypointRadius",
	"_waypointSearchRadius",
	"_waypointBehaviour",
	"_waypointCombatMode",
	"_waypointFormation",
	"_waypointSpeed",
	"_waypointCodeToExecute",
	"_waypointTimeout"
];

private _firstPosition = [];
private _waypointType = "MOVE";

for "_i" from 1 to _waypointCount do {
	private _position = if (vehicle (leader _group) isKindOf "LandVehicle") then {
		[_zone,0,_zone,10] call BRM_FMK_AIS_fnc_findPosition;
	} else {
		[_zone,0,_zone] call BRM_FMK_AIS_fnc_findPosition;
	};

	if (_i == 1) then {
		_firstPosition = _position;
	};

	if (_i == _waypointCount) then {
		_waypointType = 'CYCLE';
		_position = _firstPosition;
	};

	[
		_group,
		_position,
		_waypointRadius,
		_waypointType,
		_waypointBehaviour,
		_waypointCombatMode,
		_waypointSpeed,
		_waypointFormation,
		_waypointCodeToExecute,
		_waypointTimeout
	] call CBA_fnc_addWaypoint;

};
