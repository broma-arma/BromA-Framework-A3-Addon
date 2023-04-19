#define COMPONENT Intros
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_INTROS

#ifdef DEBUG_ENABLED_INTROS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_INTROS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INTROS
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
