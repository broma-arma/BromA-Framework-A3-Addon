#include "component.hpp"

if !(hasInterface) exitWith {};
if (player_is_spectator) exitWith {};

0 spawn {
	waitUntil {!isNull player && !isNil "mission_groups_init" && {mission_groups_init}};

	player createDiaryRecord ["Diary", ["Team Roster", "<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />"]];
};
