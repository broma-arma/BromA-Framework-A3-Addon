["BRM_FMK_Zeus_fnc_assignCargo", {
	params ["_object", "_faction", "_cargo"];
	_object setVariable ["unit_initialized", false];
	[_object, _faction, _cargo] call BRM_FMK_fnc_assignCargo;
}] call CBA_fnc_addEventHandler;

["BRM_FMK_Zeus_fnc_assignLoadout", {
	params ["_unit", "_faction", "_role"];
	[_unit, _faction, _role] call BRM_FMK_fnc_assignLoadout;
}] call CBA_fnc_addEventHandler;
