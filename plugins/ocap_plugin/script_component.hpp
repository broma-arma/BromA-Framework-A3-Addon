#define COMPONENT OCAP
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_OCAP

#ifdef DEBUG_ENABLED_OCAP
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_OCAP
    #define DEBUG_SETTINGS DEBUG_SETTINGS_OCAP
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
