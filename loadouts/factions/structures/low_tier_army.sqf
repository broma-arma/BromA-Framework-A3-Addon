// INFO ========================================================================
//
//    The structure of a poorly equipped army.
//
// =============================================================================
if (!_assignLoadoutMode) exitWith {};

// MEDICAL SUPPLIES ============================================================

#include "includes\medicalSupplies.sqf"

// =============================================================================
switch (true) do {
// =============================================================================

    case (_isOfficer): {
        [_unit, _officerHEAD, _officerUNIFORM, _officerVEST, "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_grenade,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit, "LR"] call BRM_FMK_fnc_addRadio;
        if(_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
    };

    case (_isSquadLeader): {
        [_unit,_leaderHEAD, _commonUNIFORM, _slVEST, "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_FMK_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_FMK_fnc_attachToWeapon;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit, "LR"] call BRM_FMK_fnc_addRadio;
        if(_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
    };

    case (_isTeamLeader): {
        [_unit, _leaderHEAD, _commonUNIFORM, _ftlVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_grenade,_countGRENADES],[_flashlight,1]]] call BRM_FMK_fnc_addtoVest;
        if (!isNil "_commonGL") then {
            [_unit,[[_commonGL select RAMMO, _count40mm]]] call BRM_FMK_fnc_addtoBackpack;
            [_unit,[[_commonGL select GUN,1]]] call BRM_FMK_fnc_addtoBackpack;
        } else {
            [_unit,[[_commonRIFLEGL select GL, _count40mm]]] call BRM_FMK_fnc_addtoBackpack;
        };
        [_unit, _commonRIFLEGL, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_FMK_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_FMK_fnc_attachToWeapon;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit, "LR"] call BRM_FMK_fnc_addRadio;
    };

    case (_isReconLeader): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_grenade,_countGRENADES],[_rchemlight,2],[_bchemlight,2],[_wflare,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit, _reconRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _reconRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_FMK_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_FMK_fnc_attachToWeapon;
        [_unit, "primary", _reconSCOPE] call BRM_FMK_fnc_attachToWeapon;
        [_unit, "handgun", _commonPISTOLSUPPRESSOR] call BRM_FMK_fnc_attachToWeapon;
        [_unit, "LR"] call BRM_FMK_fnc_addRadio;
        if(_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
    };

    case (_isRTO): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        if(_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
    };

    case (_isRifleman): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade, _countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
    };

    case (_isDemo): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit, [[_clacker,1],[_mineDetector,1],[_grenade,_countGRENADES],[_defusalKit,1]]] call BRM_FMK_fnc_addtoUniform;
        [_unit,[[_apMINE,2],[_apBoundingMINE,2]]] call BRM_FMK_fnc_addtoVest;
        [_unit,[[_C4,3],[_satchelCharge,1],[_deadManSwitch,1]]] call BRM_FMK_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isRiflemanAT): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _specATBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        if (!_isSpecATDisposable) then {
            [_unit, [[_specAT select RAMMO, _countAT]]] call BRM_FMK_fnc_addtoBackpack;
            [_unit, _specAT select GUN, 1, ["HE"]] call BRM_FMK_fnc_addAmmoAuto;
        };
        [_unit, _specAT] call BRM_FMK_fnc_addWeapon;
        [_unit, "secondary", _specATSCOPE] call BRM_FMK_fnc_attachToWeapon;
    };

    case (_isWeaponsAT): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _weaponsAT, 1] call BRM_FMK_fnc_addWeaponKit;
        if (_specATSCOPE != "" && _weaponsAT select GUN == _specAT select GUN) then {
            [_unit, "secondary", _specATSCOPE] call BRM_FMK_fnc_attachToWeapon;
        };
    };

    case (_isWeaponsATAssistant): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        [_unit, [[_weaponsAT select RAMMO, _countWeaponsAT]]] call BRM_FMK_fnc_addtoBackpack;
    };

    case (_isWeaponsAA): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _weaponsAA, 1] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isWeaponsAAAssistant): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        [_unit, [[_weaponsAA select RAMMO, _countWeaponsAA]]] call BRM_FMK_fnc_addtoBackpack;
    };

    case (_isMarksman): {
        [_unit, _commonHEAD, _marksmanUNIFORM, _marksmanVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonMARKSMAN, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _commonMARKSMAN select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
        [_unit, "primary", _marksmanSCOPE] call BRM_FMK_fnc_attachToWeapon;
    };

    case (_isAutorifleman): {
        [_unit, _commonHEAD, _mgUNIFORM, _mgVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_spareBarrel,1],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonAR, _countAR] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _commonAR select GUN, (_countTracerRIFLE), ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
    };

    case (_isAutoriflemanAsst): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_spareBarrel,1],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _commonAR select RAMMO, _countAR/2] call BRM_FMK_fnc_addAmmo;
    };

    case (_isMMG): {
        [_unit, _commonHEAD, _mgUNIFORM, _mgVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES],[_spareBarrel,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonMG, _countMG] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isMMGAsst): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit,[[_commonMG select RAMMO, (_countMG)]]] call BRM_FMK_fnc_addtoBackpack;
    };

    case (_isGrenadier): {
        [_unit, _commonHEAD, _commonUNIFORM, _grenadierVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        if (!isNil "_commonGL") then {
            [_unit,[[_commonGL select RAMMO, _count40mm]]] call BRM_FMK_fnc_addtoBackpack;
            [_unit,[[_commonGL select GUN,1]]] call BRM_FMK_fnc_addtoBackpack;
        } else {
            [_unit,[[_commonRIFLEGL select GL, _count40mm]]] call BRM_FMK_fnc_addtoBackpack;
        };
        [_unit, _commonRIFLEGL, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isLifeSaver): {
        [_unit, _medicHEAD, _medicUNIFORM, _medicVEST, _medicalBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_gsmoke,3],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _suppliesMEDIC] call BRM_FMK_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        _defaultInsignia = "MedB";
    };

    case (_isHMG): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _HMG] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isStaticAT): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _StaticAT] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isHMGTripod): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _HMGTripod] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isATTripod): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _ATTripod] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isMortar): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _mortar] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isMortarAssistant): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _mortarTripod] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isUAVOperator): {
        [_unit, _commonHEAD, _commonUNIFORM, _slVEST, _UAVBag] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke, 2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
        [_unit,[["ACE_UAVBattery", 3]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit, [_UAVTerminal]] call BRM_FMK_fnc_linkItem;
    };

    case (_isRecon): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _reconBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_grenade,_countGRENADES],[_rchemlight,2],[_bchemlight,2],[_wflare,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _reconRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, "primary", _commonRCO] call BRM_FMK_fnc_attachToWeapon;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_FMK_fnc_attachToWeapon;
        if (!_isCommonATDisposable) then {
            [_unit, [[_commonAT select RAMMO, _countAT] ]] call BRM_FMK_fnc_addtoBackpack;
        };
        [_unit, _commonAT] call BRM_FMK_fnc_addWeapon;
    };

    case (_isReconAT): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _specATBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_grenade,_countGRENADES],[_rchemlight,2],[_bchemlight,2],[_wflare,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _reconRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        if (!_isSpecATDisposable) then {
                [_unit, [[_specAT select RAMMO, _countAT] ]] call BRM_FMK_fnc_addtoBackpack;
                [_unit, _specAT select GUN, 1, ["HE"]] call BRM_FMK_fnc_addAmmoAuto;
        };
        [_unit, _specAT] call BRM_FMK_fnc_addWeapon;
        [_unit, "secondary", _specATSCOPE] call BRM_FMK_fnc_attachToWeapon;
        [_unit, "primary", _reconSCOPE] call BRM_FMK_fnc_attachToWeapon;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_FMK_fnc_attachToWeapon;
    };

     case (_isReconMarksman): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _reconBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonMARKSMAN, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _commonMARKSMAN select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
        [_unit, "primary", _marksmanSCOPE] call BRM_FMK_fnc_attachToWeapon;
    };

    case (_isReconMedic): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _reconBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _suppliesMEDIC] call BRM_FMK_fnc_addtoBackpack;
        [_unit, _reconRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
        [_unit, "primary", _reconSCOPE] call BRM_FMK_fnc_attachToWeapon;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_FMK_fnc_attachToWeapon;
        _defaultInsignia = "MedB";
    };

    case (_isReconDemo): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _reconBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        [_unit, [[_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call BRM_FMK_fnc_addtoUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit,[[_C4,3],[_satchelCharge,1],[_deadManSwitch,1]]] call BRM_FMK_fnc_addtoBackpack;
        [_unit, _reconRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        [_unit, "primary", _reconSCOPE] call BRM_FMK_fnc_attachToWeapon;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_FMK_fnc_attachToWeapon;
    };

    case (_isPilot): {
        [_unit, _pilotHEAD, _pilotUNIFORM, _pilotVEST, "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_FMK_fnc_addWeaponKit;
        if(_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
    };

    case (_isHelicopterCrew): {
        [_unit, _helicrewHEAD, _helicrewUNIFORM, _pilotVEST, "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonSMG, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
    };

    case (_isHelicopterPilot): {
        [_unit, _helipilotHEAD, _helicrewUNIFORM, _pilotVEST, "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonSMG, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        if(_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
        [_unit,[[_toolKit,1]]] call BRM_FMK_fnc_addtoBackpack;
    };

    case (_isCrewman): {
        [_unit, _crewmanHEAD, _crewUNIFORM, _commonVEST, "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonSMG, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        if (_isLeader) then {
            if(_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
            [_unit, _binoc] call BRM_FMK_fnc_addOptics;
            [_unit,[[_toolKit,1]]] call BRM_FMK_fnc_addtoBackpack;
        } else {
            if (!_isCommonATDisposable) then {
                [_unit, [[_commonAT select RAMMO, _countAT] ]] call BRM_FMK_fnc_addtoBackpack;
            };
            [_unit, _commonAT] call BRM_FMK_fnc_addWeapon;
        };
    };

    case (_isSniper): {
        [_unit, _sniperHEAD, _sniperUNIFORM, _commonVEST, if (_isLeader) then { "empty" } else { _commonBACKPACK }] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,_countGRENADES],[_mapTools,1],[_kestrel,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonSNIPER, _countSNIPER] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _commonSNIPER select GUN, (_countSNIPER/2)+1, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
        [_unit, "primary", _commonMAGNIFIED] call BRM_FMK_fnc_attachToWeapon;
        if (_isLeader && _aiBackpackRadios) then { [_unit, "BP"] call BRM_FMK_fnc_addRadio };
    };

    case (_isSpotter): {
        [_unit, _sniperHEAD, _sniperUNIFORM, _commonVEST, if (_isLeader) then { "empty" } else { _commonBACKPACK }] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_grenade,_countGRENADES],[_mapTools,1],[_kestrel,1]]] call BRM_FMK_fnc_addtoVest;
        [_unit,[[_commonSNIPER select RAMMO, (_countSNIPER*2)]]] call BRM_FMK_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
        [_unit, _binoc] call BRM_FMK_fnc_addOptics;
        if (_isLeader && _aiBackpackRadios) then { [_unit, "BP"] call BRM_FMK_fnc_addRadio };
    };

    default {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,3]]] call BRM_FMK_fnc_addtoVest;
        [_unit, _commonRIFLE, 5] call BRM_FMK_fnc_addWeaponKit;
    };
};

// ADDS ESSENTIALS =============================================================

[_unit, _suppliesNORMAL] call BRM_FMK_fnc_addtoUniform;

[_unit, ["ItemMap", "ItemCompass", "ItemWatch"]] call BRM_FMK_fnc_linkItem;

if !(_nightOnlyNVGs && sunOrMoon == 1 && !isPlayer _unit) then {
    [_unit, [_NVG]] call BRM_FMK_fnc_linkItem;
};

[_unit, "SR"] call BRM_FMK_fnc_addRadio;

[_unit] call BRM_FMK_fnc_addEarplugs;
