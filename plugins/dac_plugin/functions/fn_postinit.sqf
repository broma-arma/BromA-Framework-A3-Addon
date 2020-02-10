waitUntil{!isNil "DAC_STRPlayers"};

#include "includes\settings.sqf"

if (mission_AI_controller) then {
    _group = createGroup sideLogic;
    DAC_module = _group createUnit ["DAC_Source_Extern", [0,0,0],[], 1,"NONE"];
    publicVariable "DAC_module";
};
