#define COMPONENT CivilianCasualtyCap
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_CIVILIANCASUALTYCAP

#ifdef DEBUG_ENABLED_CIVILIANCASUALTYCAP
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CIVILIANCASUALTYCAP
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CIVILIANCASUALTYCAP
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
