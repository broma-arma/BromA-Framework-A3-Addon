if !(isServer) exitWith {};

params ["_unit", "_id", "_uid", "_name"];

private _isDead = [_uid, _name, _unit getVariable ["unit_side", side player]] in mission_dead_players;
private _isValidSlot = !("prevent_reslot" in usedPlugins) || {_unit getVariable ["unit_valid_slot", false]};
if (_isDead || !_isValidSlot) exitWith {};

private _fnc_unitSeat = {
	params ["_unit"];

	private _vehicle = objectParent _unit;
	if (isNull _vehicle) exitWith { "" };
	if (_unit == driver _vehicle) exitWith { "driver" };
	if (_unit == gunner _vehicle) exitWith { "gunner" };
	if (_unit == commander _vehicle) exitWith { "commander" };
	"cargo"
};

private _playerVars = [];
private _defaultHandler = { _unit getVariable [_name, _defaultValue] };
{
	_playerVars pushBack (_x apply {
		_x params ["_name", "_defaultValue", "_loadHandler", ["_handler", _defaultHandler]];
		call _handler
	});
} forEach call BRM_FMK_SyncStatus_fnc_playerVars;

private _status = [
	str _unit,
	getDir _unit,
	getPosATL _unit,
	getDammage _unit,
	objectParent _unit,
	[_unit] call _fnc_unitSeat,
	getUnitLoadout _unit,
	_playerVars
];

BrmFmk_SyncStatus_status set [_uid, _status];
