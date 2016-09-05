
switch (toUpper(_factionStructure)) do {
    case "HIGH-TIER": {
        #include "factions\structures\high_tier_army.sqf"
    };
    
    case "HIGH-TIER-CCO": {
        #include "factions\structures\high_tier_army_riflemanCCO.sqf"
    };

    case "MID-TIER": {
        #include "factions\structures\mid_tier_army.sqf"
    };

    case "LOW-TIER": {
        #include "factions\structures\low_tier_army.sqf"
    };

    default {
        #include "factions\structures\high_tier_army.sqf"
    };
};
