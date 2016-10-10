
_unit = _this select 0;
_type = _this select 1;
_kind = _this select 2;

switch (_type) do {
    case "primary": { _unit addPrimaryWeaponItem _kind };
    case "secondary": { _unit addSecondaryWeaponItem _kind };
    case "handgun": { _unit addHandgunItem _kind };
};