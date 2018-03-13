
_unit = _this select 0;
_voice = _this select 1;
_face = _this select 2;
_name = _this select 3;
_insignia = _this select 4;

if !(isPlayer _unit) then {
    _unit setFace _face;
    _unit setSpeaker _voice;
    _unit setPitch ([0.85, 1.15] call BIS_fnc_randomNum);
    if (_name != "default") then {
        switch (true) do {
            case (mission_ACE3_enabled): { _unit setVariable ["ACE_Name", _name, true] };
            case (mission_AGM_enabled): { _unit setVariable ["AGM_Name", _name, true] };
        };
        _unit setName _name;
    };
};
if (!isNull ([["CfgUnitInsignia", _insignia], configNull] call BIS_fnc_loadClass)) then {
    [_unit, _insignia] call BIS_fnc_setUnitInsignia;
};
