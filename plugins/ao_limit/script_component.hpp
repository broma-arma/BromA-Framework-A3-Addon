#define COMPONENT AOLimit
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_AOLIMIT

#ifdef DEBUG_ENABLED_AOLIMIT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_AOLIMIT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_AOLIMIT
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
