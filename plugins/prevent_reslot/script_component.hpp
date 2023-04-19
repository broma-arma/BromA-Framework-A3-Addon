#define COMPONENT PreventReslot
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_PREVENTRESLOT

#ifdef DEBUG_ENABLED_PREVENTRESLOT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_PREVENTRESLOT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PREVENTRESLOT
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
