#define COMPONENT FriendlyFire
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_FRIENDLYFIRE

#ifdef DEBUG_ENABLED_FRIENDLYFIRE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FRIENDLYFIRE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FRIENDLYFIRE
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
