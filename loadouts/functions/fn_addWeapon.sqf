
_unit = _this select 0;
_kind = _this select 1;
_amount = _this select 2;

_isMan = _unit isKindOf "Man";

if (_isMan) then {
    if (typeName _kind == "ARRAY") then { _unit addWeapon (_kind select 0); }
    else { _unit addWeapon _kind; };
} else {
    _amount = _this select 1;
    if (typeName _kind == "ARRAY") then { _unit addWeaponCargoGlobal [_kind select 0,_amount]; }
    else { _unit addWeaponCargoGlobal [_kind,_amount] };
};