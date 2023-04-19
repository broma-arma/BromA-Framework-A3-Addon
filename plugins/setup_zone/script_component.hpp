#define COMPONENT SetupZone
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_SETUPZONE

#ifdef DEBUG_ENABLED_SETUPZONE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SETUPZONE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SETUPZONE
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
