#define COMPONENT ACRE2
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_ACRE2

#ifdef DEBUG_ENABLED_ACRE2
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ACRE2
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ACRE2
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
