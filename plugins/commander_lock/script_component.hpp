#define COMPONENT CommanderLock
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_COMMANDERLOCK

#ifdef DEBUG_ENABLED_COMMANDERLOCK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COMMANDERLOCK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COMMANDERLOCK
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
