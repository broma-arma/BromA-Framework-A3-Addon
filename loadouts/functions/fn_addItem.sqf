
_unit = _this select 0;
_kind = _this select 1;
_amount = _this select 2;

_isMan = _unit isKindOf "Man";

if (_isMan) then {
    if (typeName _kind == "ARRAY") then { for "_i" from 1 to _amount do { if ((vest _unit)=="") then {_unit addItem (_kind select 1)} else {_unit addItemToVest (_kind select 1)}};
    } else { for "_i" from 1 to _amount do {if ((vest _unit)=="") then {_unit addItem _kind} else {_unit addItemToVest _kind}}};
} else {
    if (typeName _kind == "ARRAY") then { _unit addItemCargoGlobal [(_kind select 1),_amount];
    } else { _unit addItemCargoGlobal [_kind,_amount] };
};