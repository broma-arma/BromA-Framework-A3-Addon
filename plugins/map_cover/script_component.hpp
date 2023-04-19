#define COMPONENT MapCover
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_MAPCOVER

#ifdef DEBUG_ENABLED_MAPCOVER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MAPCOVER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAPCOVER
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
