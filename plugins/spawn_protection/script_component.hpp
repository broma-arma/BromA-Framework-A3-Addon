#define COMPONENT SpawnProtection
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_SPAWNPROTECTION

#ifdef DEBUG_ENABLED_SPAWNPROTECTION
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SPAWNPROTECTION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPAWNPROTECTION
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
