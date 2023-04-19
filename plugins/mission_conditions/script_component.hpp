#define COMPONENT MissionConditions
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_MISSIONCONDITIONS

#ifdef DEBUG_ENABLED_MISSIONCONDITIONS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSIONCONDITIONS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSIONCONDITIONS
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
