#include "includes\macros.sqf"
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
		[_unit, _officerHEAD, _officerUNIFORM, _officerVEST, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_grenade,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonPISTOL, _countPISTOL] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit, "LR"] call BRM_FMK_fnc_addRadio;
	};

	case (_isSquadLeader): {
		[_unit,_leaderHEAD, _commonUNIFORM, _slVEST, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE, "", "", _commonCCO, ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
		[_unit, _commonPISTOL, _countPISTOL] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit, "LR"] call BRM_FMK_fnc_addRadio;
	};

	case (_isTeamLeader): {
		[_unit, _leaderHEAD, _commonUNIFORM, _ftlVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_grenade,_countGRENADES],[_flashlight,1]]] call BRM_FMK_fnc_addtoVest;
		if (!isNil "_commonGL") then {
			[_unit,[[_commonGL select RAMMO, _count40mm]]] call BRM_FMK_fnc_addtoBackpack;
			[_unit,[[_commonGL select GUN,1]]] call BRM_FMK_fnc_addtoBackpack;
		};
		[_unit, _commonRIFLEGL, [_countRIFLE, _count40mm], "", "", _commonCCO, ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
		[_unit, _commonPISTOL, _countPISTOL] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit, "LR"] call BRM_FMK_fnc_addRadio;
	};

	case (_isReconLeader): {
		[_unit, _reconHEAD, _reconUNIFORM, _reconVEST, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGRENADES],[_rChemlight,2],[_bChemlight,2],[_wFlare,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit, _reconRIFLE, _countRIFLELOW, _commonSUPPRESSOR, "", _reconSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _reconRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
		[_unit, _commonPISTOL, _countPISTOL, _commonPISTOLSUPPRESSOR, "", "", ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, "LR"] call BRM_FMK_fnc_addRadio;
	};

	case (_isRTO): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2], [_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
	};

	case (_isRifleman): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade, _countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isDemo): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit, [[_clacker,1],[_mineDetector,1],[_grenade,_countGRENADES],[_defusalKit,1]]] call BRM_FMK_fnc_addtoUniform;
		[_unit,[[_apMine,2],[_apMineBounding,2]]] call BRM_FMK_fnc_addtoVest;
		[_unit,[[_demoCharge,3],[_demoSatchel,1],[_clackerDM,1]]] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isRiflemanAT): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _specATBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _specAT, _countSpecAT, "", "", _specATSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
		if (!_isSpecATDisposable) then {
			[_unit, _specAT select GUN, _countSpecHE, ["HE"]] call BRM_FMK_fnc_addAmmoAuto;
		};
	};

	case (_isWeaponsAT): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _weaponsAT, 1, "", "", _weaponsATSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isWeaponsATAssistant): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		[_unit, [[_weaponsAT select RAMMO, _countWeaponsAT]]] call BRM_FMK_fnc_addtoBackpack;
	};

	case (_isWeaponsAA): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _weaponsAA, 1] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isWeaponsAAAssistant): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		[_unit, [[_weaponsAA select RAMMO, _countWeaponsAA]]] call BRM_FMK_fnc_addtoBackpack;
	};

	case (_isMarksman): {
		[_unit, _commonHEAD, _marksmanUNIFORM, _marksmanVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2], [_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonMARKSMAN, _countRIFLE, "", "", _marksmanSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonMARKSMAN select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isAutorifleman): {
		[_unit, _commonHEAD, _mgUNIFORM, _mgVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_spareBarrel,1],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonAR, _countAR] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonAR select GUN, (_countTracerRIFLE), ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isAutoriflemanAsst): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_spareBarrel,1],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonAR select RAMMO, _countAR/2] call BRM_FMK_fnc_addAmmo;
	};

	case (_isMMG): {
		[_unit, _commonHEAD, _mgUNIFORM, _mgVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES],[_spareBarrel,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonMG, _countMG] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isMMGAsst): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit,[[_commonMG select RAMMO, (_countMG)]]] call BRM_FMK_fnc_addtoBackpack;
	};

	case (_isGrenadier): {
		[_unit, _commonHEAD, _commonUNIFORM, _grenadierVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		if (!isNil "_commonGL") then {
			[_unit,[[_commonGL select RAMMO, _count40mm]]] call BRM_FMK_fnc_addtoBackpack;
			[_unit,[[_commonGL select GUN,1]]] call BRM_FMK_fnc_addtoBackpack;
		};
		[_unit, _commonRIFLEGL, [_countRIFLELOW, _count40mm]] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isLifeSaver): {
		[_unit, _medicHEAD, _medicUNIFORM, _medicVEST, _medicalBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2], [_gSmoke,3],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _suppliesMEDIC] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		_defaultInsignia = _medicInsignia;
	};

	case (_isHMG): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _HMG] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isStaticAT): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _StaticAT] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isHMGTripod): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _HMGTripod] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isATTripod): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _ATTripod] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isMortar): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _mortar] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isMortarAssistant): {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _mortarTripod] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isUAVOperator): {
		[_unit, _commonHEAD, _commonUNIFORM, _slVEST, _UAVBag] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke, 2],[_grenade,_countGRENADES]]] call BRM_FMK_fnc_addtoVest;
		[_unit,[["ACE_UAVBattery", 3]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRIFLE, _countRIFLE] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit, [_UAVTerminal]] call BRM_FMK_fnc_linkItem;
	};

	case (_isRecon): {
		[_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _reconBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGRENADES],[_rChemlight,2],[_bChemlight,2],[_wFlare,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _reconRIFLE, _countRIFLE, _commonSUPPRESSOR, "", _commonRCO, ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonAT, 1] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isReconAT): {
		[_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _specATBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGRENADES],[_rChemlight,2],[_bChemlight,2],[_wFlare,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _reconRIFLE, _countRIFLELOW, _commonSUPPRESSOR, "", _reconSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _specAT, _countSpecAT, "", "", _specATSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
		if (!_isSpecATDisposable) then {
			[_unit, _specAT select GUN, _countSpecHE, ["HE"]] call BRM_FMK_fnc_addAmmoAuto;
		};
	};

	case (_isReconMarksman): {
		[_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _reconBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonMARKSMAN, _countRIFLE, "", "", _marksmanSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonMARKSMAN select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isReconMedic): {
		[_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _reconBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _suppliesMEDIC] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _reconRIFLE, _countRIFLE, _commonSUPPRESSOR, "", _reconSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
		_defaultInsignia = _medicInsignia;
	};

	case (_isReconDemo): {
		[_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _reconBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit, [[_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call BRM_FMK_fnc_addtoUniform;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGRENADES],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit,[[_demoCharge,3],[_demoSatchel,1],[_clackerDM,1]]] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _reconRIFLE, _countRIFLELOW, _commonSUPPRESSOR, "", _reconSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isPilot): {
		[_unit, _pilotHEAD, _pilotUNIFORM, _pilotVEST, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonPISTOL, _countPISTOL] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isHelicopterCrew): {
		[_unit, _helicrewHEAD, _helicrewUNIFORM, _pilotVEST, ""] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_rSmoke,2]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonSMG, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isHelicopterPilot): {
		[_unit, _helipilotHEAD, _helicrewUNIFORM, _pilotVEST, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_rSmoke,2]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonSMG, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		[_unit,[[_toolKit,1]]] call BRM_FMK_fnc_addtoBackpack;
	};

	case (_isCrewman): {
		[_unit, _crewmanHEAD, _crewUNIFORM, _commonVEST, ""] call BRM_FMK_fnc_useUniform;
		if (_isLeader && _aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonSMG, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		if (_isLeader) then {
			[_unit, _binocular] call BRM_FMK_fnc_addOptics;
			[_unit,[[_toolKit,1]]] call BRM_FMK_fnc_addtoBackpack;
		} else {
			[_unit, _commonAT, 1] call BRM_FMK_fnc_addWeaponKit;
		};
	};

	case (_isSniper): {
		[_unit, _sniperHEAD, _sniperUNIFORM, _commonVEST, if (_isLeader) then { "" } else { _commonBACKPACK }] call BRM_FMK_fnc_useUniform;
		if (_isLeader && _aiBackpackRadios) then { [_unit, "BP"] call BRM_FMK_fnc_addRadio };
		[_unit,[[_wSmoke,2],[_grenade,_countGRENADES],[_mapTools,1],[_weatherMeter,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonSNIPER, _countSNIPER, "", "", _sniperSCOPE, ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonSNIPER select GUN, (_countSNIPER/2)+1, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isSpotter): {
		[_unit, _sniperHEAD, _sniperUNIFORM, _commonVEST, if (_isLeader) then { "" } else { _commonBACKPACK }] call BRM_FMK_fnc_useUniform;
		if (_isLeader && _aiBackpackRadios) then { [_unit, "BP"] call BRM_FMK_fnc_addRadio };
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGRENADES],[_mapTools,1],[_weatherMeter,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit,[[_commonSNIPER select RAMMO, (_countSNIPER*2)]]] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _commonRIFLE, _countRIFLELOW] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
	};

	default {
		[_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _commonBACKPACK] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,3]]] call BRM_FMK_fnc_addtoVest;
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
