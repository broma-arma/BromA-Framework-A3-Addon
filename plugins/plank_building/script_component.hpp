#define COMPONENT PlankBuilding
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_PLANKBUILDING

#ifdef DEBUG_ENABLED_PLANKBUILDING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_PLANKBUILDING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PLANKBUILDING
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
