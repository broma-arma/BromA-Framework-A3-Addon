#define COMPONENT evade_escape
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_EVADE_ESCAPE

#ifdef DEBUG_ENABLED_EVADE_ESCAPE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_EVADE_ESCAPE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_EVADE_ESCAPE
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
