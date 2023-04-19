#define COMPONENT SyncStatus
#include "\broma_framework\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_ENABLED_SYNCSTATUS

#ifdef DEBUG_ENABLED_SYNCSTATUS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SYNCSTATUS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SYNCSTATUS
#endif

#define DEBUG_SYNCHRONOUS
#include "\broma_framework\script_macros.hpp"
