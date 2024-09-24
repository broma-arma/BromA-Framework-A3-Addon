// File is included in mission framework
private _factionInfo = [_faction, if (!isNil "_defaultSide") then { _defaultSide } else { nil }] call BRM_FMK_fnc_getFactionInfo;

_faction = _factionInfo select 0;
_factionSide = _factionInfo select 1;
