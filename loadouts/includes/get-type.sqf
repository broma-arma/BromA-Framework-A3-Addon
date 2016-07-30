
if (!(isPlayer _unit)) then { _type = getText(configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName") }
else {
    if ( (count _this) > 2) then {
        _type = _this select 2;
    } else {
        _type = getText(configfile >> "CfgVehicles" >> typeOf _unit >> "displayName");
    };
};
