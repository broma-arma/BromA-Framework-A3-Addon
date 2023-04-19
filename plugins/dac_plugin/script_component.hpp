#define COMPONENT DAC
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_DAC

#ifdef DEBUG_ENABLED_DAC
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_DAC
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DAC
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
