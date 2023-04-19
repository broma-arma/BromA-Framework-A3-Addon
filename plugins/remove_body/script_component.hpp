#define COMPONENT remove_body
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_REMOVE_BODY

#ifdef DEBUG_ENABLED_REMOVE_BODY
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_REMOVE_BODY
    #define DEBUG_SETTINGS DEBUG_SETTINGS_REMOVE_BODY
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
