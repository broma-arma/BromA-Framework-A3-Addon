switch (toUpper(_factionStructure)) do {
    case "HIGH-TIER": {
        #include "factions\structures\high_tier_army.sqf"
    };

    case "MID-TIER": {
        #include "factions\structures\mid_tier_army.sqf"
    };

    case "LOW-TIER": {
        #include "factions\structures\low_tier_army.sqf"
    };

    case "GERMAN_STRUCTURE": {
        #include "factions\structures\german_structure.sqf"
    };

    case "FRANCE_STRUCTURE": {
        #include "factions\structures\france_structure.sqf"
    };

    case "US_STRUCTURE": {
        #include "factions\structures\us_structure.sqf"
    };

    default {
        #include "factions\structures\high_tier_army.sqf"
    };
};
