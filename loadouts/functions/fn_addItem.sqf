/*
================================================================================

NAME:
    BRM_FMK_fnc_addItem

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Add an item, weapon, magazine or backpack to an object.

PARAMETERS:
    0 - Object to add the item to. (OBJECT)
    1 - Config name of the item to add. (STRING)
    2 - (OPTIONAL) Amount to add, default 1. (NUMBER)
    3 - (OPTIONAL) Man object only: priority of the uniform, vest, backpack, default "uvb". (STRING)
    4 - (OPTIONAL) Man object only: True to return the amount added according to amount added to the uniform, vest, and backpack. (STRING)

USAGE:
    [player, "FirstAidKit"] call BRM_FMK_fnc_addItem; // [1, 0, 0]
    [player, "FirstAidKit", 2] call BRM_FMK_fnc_addItem; // [2, 0, 0]
    [player, "NLAW_F", 2, "bvu"] call BRM_FMK_fnc_addItem; // [0, 0, 2]
    [crate, "arifle_MX_F"] call BRM_FMK_fnc_addItem; // 1
    [crate, "B_AssaultPack_rgr", 2] call BRM_FMK_fnc_addItem; // 2

RETURNS:
    The amount that was added. If parameter 4 is true and parameter 0 is a Man object: [addedToUniform, addedToVest, addedToBackpack] (NUMBER/ARRAY)

================================================================================
*/

params ["_object", "_kind", ["_amount", 1], ["_order", "uvb"], ["_splitAdded", false]];

if (_amount < 1) exitWith {};

if (_kind isEqualType []) then {
	_kind = _kind select 1;
};
if (_kind isEqualTo "") exitWith {};

private _isBackpack = getNumber (configFile >> "CfgVehicles" >> _kind >> "isBackpack") != 0;

if (_object isKindOf "Man") then {
	_order = toLower _order;
	if (["uvb", "ubv", "vub", "vbu", "buv", "bvu", "uv", "ub", "vu", "vb", "bu", "bv", "u", "v", "b"] find _order == -1) then {
		["Invalid order '%1', defaulting to 'uvb'", _order] call BIS_fnc_error;
		_order = "uvb";
	};
	_order = _order splitString "";

	private _added = 0;
	if (_splitAdded) then { _added = [0, 0, 0]; };
	private _fnc_added = {
		params ["_index"];

		if (_splitAdded) then {
			_added set [_index, (_added select _index) + 1];
		} else {
			_added = _added + 1;
		};

		_index
	};

	for "_i" from 1 to _amount do {
		private _result = -1;
		private _removed = 0;
		for "_j" from 0 to count _order - 1 do {
			private _k = _j - _removed;
			_result = switch (_order select _k) do {
				case "u": {
					if (_object canAddItemToUniform _kind) exitWith {
						if (_isBackpack) exitWith { ["canAddItemToUniform returned true for a backpack: '%1'", _kind] call BIS_fnc_error; };
						_object addItemToUniform _kind;

						0 call _fnc_added
					};
					-1
				};
				case "v": {
					if (_object canAddItemToVest _kind) exitWith {
						if (_isBackpack) exitWith { ["canAddItemToVest returned true for a backpack: '%1'", _kind] call BIS_fnc_error; };
						_object addItemToVest _kind;

						1 call _fnc_added
					};
					-1
				};
				case "b": {
					if (_object canAddItemToBackpack _kind) exitWith {
						if (_isBackpack) then {
							backpackContainer _object addBackpackCargoGlobal [_kind, 1];
						} else {
							_object addItemToBackpack _kind;
						};

						2 call _fnc_added
					};
					-1
				};
			};
			if (_result != -1) exitWith {};
			_order deleteAt _k;
			_removed = _removed + 1;
		};
		if (_result == -1) exitWith {};
	};

	_added
} else {
	if (_isBackpack) then {
		_object addBackpackCargoGlobal [_kind, _amount];
	} else {
		_object addItemCargoGlobal [_kind, _amount];
	};

	_amount
};
