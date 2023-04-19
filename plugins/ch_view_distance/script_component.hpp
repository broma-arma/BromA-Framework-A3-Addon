#define COMPONENT CHVD
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_CHVD

#ifdef DEBUG_ENABLED_CHVD
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CHVD
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CHVD
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
