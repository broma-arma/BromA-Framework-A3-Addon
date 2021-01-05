#include "component.hpp"

waitUntil { !isNil "DAC_STRPlayers" };

if (mission_AI_controller) then {
	createGroup sideLogic createUnit ["DAC_Source_Extern", [0, 0, 0], [], 1, "NONE"];
};
