#include "component.hpp"
// =============================================================================
//  Mission setup time parameter
// =============================================================================

params [
	"_setupTime" // Setup time index. 0: 15 seconds, 1: 1 minutes, 2: 3 minutes, 3: 5 minutes, 4: 10 minutes
];

mission_setup_time = [15, 60, 180, 300, 600] select _setupTime;

// =============================================================================
