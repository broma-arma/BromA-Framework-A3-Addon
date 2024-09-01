if (_isMan) then {
	_unit setUnitLoadout [[], [], [], [], [], [], "", ["", nil] select isPlayer _unit, [], ["", "", "", "", "", ""]];
} else {
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearWeaponCargoGlobal _object;
	clearBackpackCargoGlobal _object;
};
