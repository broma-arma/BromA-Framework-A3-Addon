switch (toUpper(_factionStructure)) do {
	case "HIGH-TIER": {
		#include "factions\structures\high.sqf"
	};

	case "MID-TIER": {
		#include "factions\structures\mid.sqf"
	};

	case "LOW-TIER": {
		#include "factions\structures\low.sqf"
	};

	case "FRANCE_STRUCTURE": {
		#include "factions\structures\france.sqf"
	};

	case "US_STRUCTURE": {
		#include "factions\structures\us.sqf"
	};

	default {
		#include "factions\structures\high.sqf"
	};
};
