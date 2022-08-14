// Included by Mission Framework <= 0.7.5
switch (toUpper(_factionStructure)) do {
    case "HIGH-TIER": {
        #include "oldFactions\structures\high_tier_army.sqf"
    };

    case "MID-TIER": {
        #include "oldFactions\structures\mid_tier_army.sqf"
    };

    case "LOW-TIER": {
        #include "oldFactions\structures\low_tier_army.sqf"
    };

    case "FRANCE_STRUCTURE": {
        #include "oldFactions\structures\france_structure.sqf"
    };

    case "US_STRUCTURE": {
        #include "oldFactions\structures\us_structure.sqf"
    };

    default {
        #include "oldFactions\structures\high_tier_army.sqf"
    };
};
