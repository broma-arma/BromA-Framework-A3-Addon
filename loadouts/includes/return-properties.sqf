
_ret set [FACTION_INFO, []];
(_ret select FACTION_INFO) set [FACTION_SIDE, _defaultSide];
(_ret select FACTION_INFO) set [FACTION_COLOR, _defaultColor];
(_ret select FACTION_INFO) set [FACTION_NAME, _factionName];
(_ret select FACTION_INFO) set [FACTION_CALLSIGNS, _factionCallsigns];
(_ret select FACTION_INFO) set [FACTION_SKILL, _factionSkill];

_ret set [FACTION_VEHICLES, _factionVehicles];
_ret set [FACTION_OBJECTS, _factionObjects];

if ((count _this) > 1) then {
    switch toUpper(_this select 1) do {
        case "SIDE": { _ret = _defaultSide };
        case "COLOR": { _ret = _defaultColor };
        case "NAME": { _ret = _factionName };
        case "SKILL": { _ret = _factionSkill };
        case "CALLSIGNS": { _ret = _factionCallsigns };
        case "VEHICLES": { _ret = _factionVehicles };
        case "OBJECTS": { _ret = _factionObjects };
        case "DACCAMPS": { _ret = _factionDACCamps };
    };
};
