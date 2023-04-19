#define COMPONENT HC
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_HC

#ifdef DEBUG_ENABLED_HC
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HC
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HC
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
