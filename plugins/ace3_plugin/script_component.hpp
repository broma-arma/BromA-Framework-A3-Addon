#define COMPONENT ACE3
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_ACE3

#ifdef DEBUG_ENABLED_ACE3
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ACE3
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ACE3
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
