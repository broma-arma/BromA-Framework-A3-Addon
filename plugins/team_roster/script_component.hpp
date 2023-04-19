#define COMPONENT TeamRoster
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_TEAMROSTER

#ifdef DEBUG_ENABLED_TEAMROSTER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_TEAMROSTER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TEAMROSTER
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
