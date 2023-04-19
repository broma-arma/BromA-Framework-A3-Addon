#define COMPONENT loadouts
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_LOADOUTS

#ifdef DEBUG_ENABLED_LOADOUTS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_LOADOUTS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_LOADOUTS
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
