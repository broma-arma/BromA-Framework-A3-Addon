#define COMPONENT SpawnAI
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_SPAWNAI

#ifdef DEBUG_ENABLED_SPAWNAI
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SPAWNAI
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPAWNAI
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
