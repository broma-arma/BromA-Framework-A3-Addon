diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];

if (
	_weapon == _muzzle // don't count gl
	&& {primaryWeapon _unit == _weapon || handgunWeapon _unit == _weapon} // only rifles and pistols
) then {
	_unit addMagazine (_oldMagazine select 0);
};
