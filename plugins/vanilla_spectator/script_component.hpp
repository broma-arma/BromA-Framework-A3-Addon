#define COMPONENT VanillaSpectator
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_VANILLASPECTATOR

#ifdef DEBUG_ENABLED_VANILLASPECTATOR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_VANILLASPECTATOR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_VANILLASPECTATOR
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
