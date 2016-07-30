
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

_sideAProperties = [side_a_faction] call BRM_fnc_getLoadoutProperty;
_factionInfo = _sideAProperties select FACTION_INFO;

side_a_color = ((_factionInfo) select FACTION_COLOR);
side_a_name = ((_factionInfo) select FACTION_NAME);
side_a_callsigns = ((_factionInfo) select FACTION_CALLSIGNS);
side_a_vehicles = ((_sideAProperties) select FACTION_VEHICLES);

_sideBProperties = [side_b_faction] call BRM_fnc_getLoadoutProperty;
_factionInfo = _sideBProperties select FACTION_INFO;

side_b_color = ((_factionInfo) select FACTION_COLOR);
side_b_name = ((_factionInfo) select FACTION_NAME);
side_b_callsigns = ((_factionInfo) select FACTION_CALLSIGNS);
side_b_vehicles = ((_sideBProperties) select FACTION_VEHICLES);

if (mission_enable_side_c) then {
    _sideCProperties = [side_c_faction] call BRM_fnc_getLoadoutProperty;
    _factionInfo = _sideCProperties select FACTION_INFO;

    side_c_color = ((_factionInfo) select FACTION_COLOR);
    side_c_name = ((_factionInfo) select FACTION_NAME);
    side_c_callsigns = ((_factionInfo) select FACTION_CALLSIGNS);
    side_c_vehicles = ((_sideCProperties) select FACTION_VEHICLES);
};