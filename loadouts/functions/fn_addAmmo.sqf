
_unit = _this select 0;
_kind = _this select 1;
_amount = _this select 2;

_isMan = _unit isKindOf "Man";

if _isMan then {
    if (typeName _kind == "ARRAY") then {
        for "_i" from 1 to _amount do {
            if ((vest _unit) == "") then {
                _unit addMagazine (_kind select 1);
            } else {
                if (_unit canAddItemToVest (_kind select 1)) exitWith { _unit addItemToVest (_kind select 1) };
                if (_unit canAddItemToBackpack (_kind select 1)) exitWith { _unit addItemToBackpack (_kind select 1) };
                if (_unit canAddItemToUniform (_kind select 1)) exitWith { _unit addItemToUniform (_kind select 1) };
            };
        };
    } else {
        for "_i" from 1 to _amount do {
            if ((vest _unit) == "") then {
                _unit addMagazine _kind;
            } else {
                if (_unit canAddItemToVest (_kind)) exitWith { _unit addItemToVest (_kind) };
                if (_unit canAddItemToBackpack (_kind)) exitWith { _unit addItemToBackpack (_kind) };
                if (_unit canAddItemToUniform (_kind)) exitWith { _unit addItemToUniform (_kind) };
            };
        };
    };
} else {
    if (typeName _kind == "ARRAY") then { _unit addMagazineCargoGlobal [(_kind select 1),_amount];
    } else { _unit addMagazineCargoGlobal [_kind,_amount] };
};
