#define COMPONENT MPGarage
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_MPGARAGE

#ifdef DEBUG_ENABLED_MPGARAGE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MPGARAGE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MPGARAGE
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
