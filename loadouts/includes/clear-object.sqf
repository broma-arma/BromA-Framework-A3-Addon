
if (_isMan) then {
    removeAllItems _unit;
    removeAllWeapons _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    if !(isPlayer _unit) then { removeGoggles _unit };
} else {
    clearMagazineCargoGlobal _object;
    clearItemCargoGlobal _object;
    clearWeaponCargoGlobal _object;
    clearBackpackCargoGlobal _object;
};