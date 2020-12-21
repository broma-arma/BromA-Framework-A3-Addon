/*
================================================================================

NAME:
    BRM_FMK_fnc_getAmmoClass

AUTHOR(s):
    Nife

DESCRIPTION:
    Search weapon compatible magazine config names.

PARAMETERS:
    0 - Config name of the weapon. (STRING)
    1 - (OPTIONAL) Array of search terms. Defaults to [], which will return the first compatible magazine. Multiple terms act as if they're OR'd together. E.g. "CASELESS" OR "TRACER" (ARRAY of STRING)
    2 - (OPTIONAL) Muzzle, default 0. (NUMBER)

USAGE:
    ["arifle_MX_SW_F"] call BRM_FMK_fnc_getAmmoClass;
    ["arifle_MX_SW_F", ["CASELESS"]] call BRM_FMK_fnc_getAmmoClass;
    ["arifle_MX_SW_F", ["RED"]] call BRM_FMK_fnc_getAmmoClass;
    ["hgun_PDW2000_F", ["TRACER"]] call BRM_FMK_fnc_getAmmoClass;
    ["hgun_PDW2000_F", ["GREEN"]] call BRM_FMK_fnc_getAmmoClass;
    ["hgun_PDW2000_F", ["CASELESS", "TRACER"]] call BRM_FMK_fnc_getAmmoClass;

RETURNS:
    The first matching magazine. Empty string if none found. (STRING)

================================================================================
*/

params ["_weapon", ["_type", []], ["_muzzle", 0]];

if (_weapon isEqualType []) then {
	_weapon = _weapon select 0;
};
if (_weapon isEqualTo "") exitWith { "" };

_type = +_type apply { toLower _x };

private _cfgMuzzle = configfile >> "CfgWeapons" >> _weapon;
if (!isClass _cfgMuzzle) exitWith { "" };

_muzzle = [_cfgMuzzle, "muzzles", ["this"]] call BIS_fnc_returnConfigEntry select _muzzle;
if (_muzzle != "this") then { _cfgMuzzle = _cfgMuzzle >> _muzzle; };

private _magazines = getArray (_cfgMuzzle >> "magazines") apply { toLower _x };
{
	{
		{
			_magazines pushBackUnique toLower _x;
		} forEach getArray _x;
	} forEach configProperties [configfile >> "CfgMagazineWells" >> _x, "isArray _x", false];
} forEach getArray (_cfgMuzzle >> "magazineWell");

_magazines = _magazines arrayIntersect _magazines;

private _return = "";
if (count _magazines > 0) then {
	if (_type isEqualTo []) then {
		_return = _magazines select 0;
	} else {
		{
			private _nameArray = _x splitString "_";
			if (_type findIf { _x in _nameArray } != -1) exitWith {
				_return = _x;
			};
		} forEach _magazines;
	};
};

_return
