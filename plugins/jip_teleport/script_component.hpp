#define COMPONENT JIPTeleport
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_JIPTELEPORT

#ifdef DEBUG_ENABLED_JIPTELEPORT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_JIPTELEPORT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_JIPTELEPORT
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
