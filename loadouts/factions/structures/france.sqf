#include "high.sqf"

if (_isRifleman) then {
	[_unit, [["R3F_APAV40", 4], ["R3F_AC58", 4], ["R3F_FUM40", 2]]] call BRM_FMK_fnc_addtoBackpack;
};

if (_isMMG) then {
	[_unit, "primary", "rhsusf_acc_ELCAN"] call BRM_FMK_fnc_attachToWeapon;
};
