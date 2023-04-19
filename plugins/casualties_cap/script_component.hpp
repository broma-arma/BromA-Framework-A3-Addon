#define COMPONENT casualties_cap
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_CASUALTIES_CAP

#ifdef DEBUG_ENABLED_CASUALTIES_CAP
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CASUALTIES_CAP
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CASUALTIES_CAP
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
