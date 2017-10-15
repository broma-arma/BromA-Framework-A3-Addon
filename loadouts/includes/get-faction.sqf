
_aliasBLUFOR = ["blufor","west"];
_aliasOPFOR = ["opfor","redfor","east"];
_aliasRESISTANCE = ["independent","resistance","indfor","guerilla"];
_aliasCIVILIAN = ["civilian","civilians","civies"];

_factionSide = "";

switch (true) do {
    case (_faction == "side_a"): { _faction = side_a_faction; _factionSide = side_a_side };
    case (_faction == "side_b"): { _faction = side_b_faction; _factionSide = side_b_side };
    case (_faction == "side_c"): { _faction = side_c_faction; _factionSide = side_c_side };
    case (_faction in _aliasBLUFOR): { _faction = [WEST, "FACTION"] call BRM_FMK_fnc_getSideInfo; _factionSide = WEST };
    case (_faction in _aliasOPFOR): { _faction = [EAST, "FACTION"] call BRM_FMK_fnc_getSideInfo; _factionSide = EAST };
    case (_faction in _aliasRESISTANCE): { _faction = [RESISTANCE, "FACTION"] call BRM_FMK_fnc_getSideInfo; _factionSide = RESISTANCE };
    default {
        switch (true) do {
            case (_faction == side_a_faction): { _factionSide = side_a_side };
            case (_faction == side_b_faction): { _factionSide = side_b_side };
            case (_faction == side_c_faction): { _factionSide = side_c_side };
        };
    };
};

if (typeName _factionSide == "STRING") then {_factionSide = _defaultSide};
