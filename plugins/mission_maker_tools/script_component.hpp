#define COMPONENT MissionMakerTools
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_MISSIONMAKERTOOLS

#ifdef DEBUG_ENABLED_MISSIONMAKERTOOLS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSIONMAKERTOOLS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSIONMAKERTOOLS
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
