#define COMPONENT LoadingScreen
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_LOADINGSCREEN

#ifdef DEBUG_ENABLED_LOADINGSCREEN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_LOADINGSCREEN
    #define DEBUG_SETTINGS DEBUG_SETTINGS_LOADINGSCREEN
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
