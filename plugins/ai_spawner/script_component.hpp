#define COMPONENT AIS
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_AIS

#ifdef DEBUG_ENABLED_AIS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_AIS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_AIS
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
