#define PREFIX brm_fmk

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR  MAJOR,MINOR,PATCHLVL,BUILD

/*
#ifndef DEBUG_MODE_NORMAL
	#define DEBUG_MODE_FULL
#endif
*/

// Set a default debug mode for the component here (See documentation on how to default to each of the modes).
//#define DEBUG_ENABLED_ENGINE
//#define DEBUG_ENABLED_PLUGINS
//#define DEBUG_ENABLED_LOADOUTS

#if __A3_DEBUG__
	#define RECOMPILE
#else
	// Remove CfgFunction adding headers and disable SCRIPT macro
	#define SKIP_FUNCTION_HEADER
	#define SKIP_SCRIPT_NAME
#endif
