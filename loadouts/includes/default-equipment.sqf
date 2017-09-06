
switch (true) do {
    case (_factionSide == WEST): {

        _commonAR = ["rhs_weap_m249_pip_S", "rhsusf_100Rnd_556x45_soft_pouch"];
        _countAR = 5;
    };
    case (_factionSide == EAST): {

        _commonAR = ["hlc_rifle_rpk74n", "hlc_45Rnd_545x39_t_rpk"];
        _countAR = 7;
    };
    case (_factionSide == RESISTANCE): {

        _commonAR = ["hlc_rifle_rpk74n", "hlc_45Rnd_545x39_t_rpk"];
        _countAR = 7;
    };
    default {

        _commonAR = ["hlc_rifle_rpk74n", "hlc_45Rnd_545x39_t_rpk"];
        _countAR = 7;
    };
};

_countARCARGO = 20;