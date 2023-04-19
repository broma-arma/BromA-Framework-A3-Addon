#define COMPONENT TimeAcceleration
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_TIMEACCELERATION

#ifdef DEBUG_ENABLED_TIMEACCELERATION
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_TIMEACCELERATION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TIMEACCELERATION
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
