#define COMPONENT RadioFreq
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_RADIOFREQ

#ifdef DEBUG_ENABLED_RADIOFREQ
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_RADIOFREQ
    #define DEBUG_SETTINGS DEBUG_SETTINGS_RADIOFREQ
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
