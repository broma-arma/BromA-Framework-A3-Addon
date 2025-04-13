#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_countGroupType

Description:
	Get maximum number of units in a group type.

Parameters:
	_groupType - Group Settings ID [STRING/ARRAY]
	_side - Side [SIDE]
	_faction - Faction [STRING]

Returns:
	Number of units in group type [NUMBER]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

private _fnc_typeCount = {
	if (_this isKindOf "Man") then {
		1
	} else {
		count ([_this, ["cargo", "turret"]] call BRM_FMK_Plugin_AIS_fnc_getVehicleSeats)
	}
};

private _count = 0;
{
	if (_x isEqualType []) then {
		private _c = 0;
		{ _c = _c max (_x call _fnc_typeCount); } forEach _x;
		_count = _count + _c;
	} else {
		_count = _count + (_x call _fnc_typeCount);
	};
} forEach (_this call BRM_FMK_Plugin_AIS_fnc_getGroupSettings);

_count
