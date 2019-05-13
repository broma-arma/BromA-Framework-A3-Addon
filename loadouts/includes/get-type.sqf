#include "allowed-classes.sqf"

private _displayName = (getText(configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName"));
private _originalType = _type;
private _restoreDisplay = false;
private _restoreType = false;

if (!(isPlayer _unit)) then { _type = _displayName }
else {
    if ((count _this) > 2) then {
        if ((toLower(_this select 2)) in _allowedClasses) then {
            _type = toLower(_this select 2);
            _restoreDisplay = true;
        } else { _originalType = (_this select 2); _type = _displayName; _restoreType = true; };
    } else {
        _type = _displayName;
    };
};
