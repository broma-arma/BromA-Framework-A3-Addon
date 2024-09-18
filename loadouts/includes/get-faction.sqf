// File is included in mission framework
private _factionInfo = [_faction, _defaultSide] call BRM_FMK_fnc_getFactionInfo;

_faction = _factionInfo select 0;
_factionSide = _factionInfo select 1;
