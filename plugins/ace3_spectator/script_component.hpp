#define COMPONENT ACE3_SPECTATOR
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_ACE3_SPECTATOR

#ifdef DEBUG_ENABLED_ACE3_SPECTATOR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ACE3_SPECTATOR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ACE3_SPECTATOR
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
