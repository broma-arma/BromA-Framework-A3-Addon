
_array = _this select 0;
_unit = _array select 0;
_type = _array select 1;

for "_i" from 2 to (count _array) do {
    switch(_type) do {
        case("weapon"): { _unit addWeaponCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
        case("magazine"): { _unit addMagazineCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
        case("item"): { _unit addItemCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
        case("backpack"): { _unit addBackpackCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
    };
};