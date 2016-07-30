
_unit = _this select 0;
_array = _this select 1;

for "_i" from 0 to (count _array) do {
    for "_j" from 1 to ((_array select _i)select 1) do {
        _unit addItemToUniform ((_array select _i)select 0);
    };
};