#define COMPONENT engine
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_ENGINE

#ifdef DEBUG_ENABLED_ENGINE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ENGINE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ENGINE
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
