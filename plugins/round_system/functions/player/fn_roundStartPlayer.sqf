#include "script_component.hpp"
if (!hasInterface) exitWith {};

hint "";

[player, toLower(str(player getVariable ["unit_side",(side player)]))] call FUNCMAIN(assignLoadout);

player setDamage 0;

if (mission_ACE3_enabled) then { [player] spawn EFUNC(ACE3,ACE_RevivePlayer) };

_respawn = [] call FUNC(moveToRespawn);

[_respawn, [] call FUNC(getSettings) select 0, [] call FUNC(getSettings) select 2, [side player, "side"] call FUNCMAIN(getSideInfo)] spawn FUNC(setupZone);

player allowDamage true;

["Alert",[format ["ROUND %1 IS ABOUT TO START!", match_current_round]]] call BIS_fnc_showNotification;
