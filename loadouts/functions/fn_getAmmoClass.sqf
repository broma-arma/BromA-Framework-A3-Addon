params ["_weapon", "_type"];

_ret = "";
_magazines = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines"));

if (count _magazines > 1) then {
    {
        _nameArray = [_x, "_"] call CBA_fnc_split;
        { _nameArray set [_forEachIndex, toUpper(_x)] } forEach _nameArray;
        _validType = false;
        { _validType = (toUpper(_x) in _nameArray) } forEach _type;
        if (_validType) exitWith { _ret = _x };
    } forEach _magazines;
};

_ret
