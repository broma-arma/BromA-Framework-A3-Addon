// TODO What is the purpose of this?
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_group", "_groupType", "_side", ["_zone", objNull]];

private _initialPosition = getPos leader _group;
private _leader = leader _group;
private _oldUnits = units _group;

sleep 60;

if (!alive _leader || {alive _x} count _oldUnits == 0) exitWith {};

if (
	!alive _leader ||
	getPos _leader distance _initialPosition < 5 ||
	(!alive (vehicle _leader) || count crew (vehicle _leader) == 0 || getPos (vehicle _leader) distance _initialPosition < 5)
) then {

	private _hasVehicle = [_groupType] call BRM_FMK_AIS_fnc_typeHasVehicle;

	private _spawnPosition = if (!(_hasVehicle)) then {
		[_zone, 0, 5] call BRM_FMK_AIS_fnc_findPosition;
	} else {
		[_zone, 0, 10] call BRM_FMK_AIS_fnc_findPosition;
	};

	private _newGroup = [_spawnPosition, _groupType, _side] call BRM_FMK_AIS_fnc_createGroup;
	private _newLeader = leader _newGroup;

	(units _newGroup) joinSilent _group;
	_group selectLeader _newLeader;

	if (!isNull objectParent _leader) then {
		deleteVehicle vehicle _leader;
	};

	{ deleteVehicle _x } forEach _oldUnits;

	[_group, _groupType, _side] spawn BRM_FMK_AIS_fnc_checkBadSpawn;
};
