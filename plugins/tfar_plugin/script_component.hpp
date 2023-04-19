#define COMPONENT TFAR
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_TFAR

#ifdef DEBUG_ENABLED_TFAR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_TFAR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TFAR
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
