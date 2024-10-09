#include "high.sqf"

if (_isReconLeader) then {
	[_unit, [["rhs_weap_M320", 1], [_40mm, 10]]] call BRM_FMK_fnc_addtoBackpack;
};
