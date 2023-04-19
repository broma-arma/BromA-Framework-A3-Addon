#define COMPONENT TimeLimit
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_TIMELIMIT

#ifdef DEBUG_ENABLED_TIMELIMIT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_TIMELIMIT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TIMELIMIT
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
