switch(_x) do {
    case "medical":
    {
        [[_object, "magazine",
            [_bchemlight, 25],
            [_rchemlight, 25],
            [_gchemlight, 25],
            [_wsmoke, 25],
            [_rsmoke, 25],
            [_gsmoke, 25]
        ]] call BRM_FMK_fnc_addtoCargo;
        [[_object, "item",
            [_bandage, _countBandageCARGO],
            [_morphine, _countMorphineCARGO],
            [_epi, _countEpiCARGO],
            [_bloodbag, _countBloodbagCARGO]
        ]] call BRM_FMK_fnc_addtoCargo;
    };
    case "medical_adv":
    {
        if (mission_ACE3_enabled) then {
            [[_object, "item",
                [_fieldDressing, _countBandageCARGO],
                [_packingBandage, _countBandageCARGO],
                [_elasticBandage, _countBandageCARGO],
                [_personalAidKit, _countPAKCARGO],
                [_quickClot, _countBandageCARGO],
                [_tourniquet, _countBandageCARGO],
                [_morphine, _countMorphineCARGO],
                [_atrophine, _countMorphineCARGO],
                [_epi, _countEpiCARGO],
                [_saline1000, _countBloodbagCARGO],
                [_blood1000, _countBloodbagCARGO],
                [_plasma1000, _countBloodbagCARGO],
                [_surgKit, 5],
                [_defib, 5],
                [_bodyBag, _countBloodbagCARGO]
            ]] call BRM_FMK_fnc_addtoCargo;
        };
    };
    case "ammo":
    {
        [[_object, "magazine",
            [_commonRIFLE select RAMMO,_countRifleCARGO],
            [_commonMG select RAMMO, _countMGCARGO],
            [_commonAR select RAMMO, _countARCARGO],
            [_commonMARKSMAN select RAMMO,_countRifleCARGO],
            [_commonSNIPER select RAMMO,_countSNIPERCARGO],
            [_commonSMG select RAMMO,_countRifleCARGO],
            [_specAT select RAMMO, _countATCARGO],
            [_commonRIFLEGL select GL, _count40mmCARGO],
            [_commonRIFLEGL select RAMMO,_countRifleCARGO],
            [_commonPISTOL select RAMMO, _countPistolCARGO],
            [_grenade, _countGRENADESCARGO],
            [_wsmoke, 25],
            [_rsmoke, 25],
            [_gsmoke, 25]
        ]] call BRM_FMK_fnc_addtoCargo;
        [[_object, "item",
            [_earBuds, 25]
        ]] call BRM_FMK_fnc_addtoCargo;
    };

    case "ammo_big":
    {
        [[_object,"magazine",
            [_commonRIFLE select RAMMO,_countRifleCARGO * 3],
            [_commonMG select RAMMO, _countMGCARGO * 3],
            [_commonAR select RAMMO, _countARCARGO * 3],
            [_commonMARKSMAN select RAMMO,_countRifleCARGO * 3],
            [_commonSNIPER select RAMMO,_countSNIPERCARGO * 3],
            [_commonSMG select RAMMO,_countRifleCARGO * 3],
            [_specAT select RAMMO, _countATCARGO * 3],
            [_commonRIFLEGL select GL, _count40mmCARGO * 3],
            [_commonRIFLEGL select RAMMO,_countRifleCARGO * 3],
            [_commonPISTOL select RAMMO, _countPistolCARGO * 3],
            [_grenade, _countGRENADESCARGO * 3],
            [_wsmoke, 25 * 3],
            [_rsmoke, 25 * 3],
            [_gsmoke, 25 * 3]
        ]] call BRM_FMK_fnc_addtoCargo;
    };

    case "at":
    {
        [[_object,"magazine",
            [_specAT select RAMMO, _countATCARGO],
            [_weaponsAT select RAMMO, _countWeaponsATCARGO],
            [_weaponsAA select RAMMO, _countWeaponsAACARGO]
        ]] call BRM_FMK_fnc_addtoCargo;
        [[_object,"weapon",
            [_commonAT select GUN, 10]
        ]] call BRM_FMK_fnc_addtoCargo;
    };

    case "explosives": {
        [[_object, "magazine",
            ["DemoCharge_Remote_Mag", 10],
            ["SatchelCharge_Remote_Mag", 10]
        ]] call BRM_FMK_fnc_addtoCargo;
    };

    case "mines": {
        [[_object, "magazine",
            ["APERSTripMine_Wire_Mag", 30],
            ["ClaymoreDirectionalMine_Remote_Mag", 20]
        ]] call BRM_FMK_fnc_addtoCargo;
    };

    case "handcuffs": {
        [[_object, "item",
            ["ACE_CableTie", 10]
        ]] call BRM_FMK_fnc_addtoCargo;
    };

    case "radio": {
        [_object, "SR", _factionSide, 50] call BRM_FMK_fnc_addRadioToCargo;
        [_object, "LR", _factionSide, 20] call BRM_FMK_fnc_addRadioToCargo;
        [_object, "BP", _factionSide, 5] call BRM_FMK_fnc_addRadioToCargo;
    };

    case "parachutes": {
        [[_object,"backpack",
            [_parachute , 15]
        ]] call BRM_FMK_fnc_addtoCargo;
    };

    case "rifle_grenades": {
       [[_object, "item",
            ["R3F_APAV40", 40],
            ["R3F_AC58", 40],
            ["R3F_FUM40", 40]
        ]] call BRM_FMK_fnc_addtoCargo;
    };
};
