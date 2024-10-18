#include "includes\macros.sqf"
// INFO ========================================================================
//
//    The structure of a well equipped army.
//
// =============================================================================
if (!_assignLoadoutMode) exitWith {};

// MEDICAL SUPPLIES ============================================================

#include "includes\medicalSupplies.sqf"

// =============================================================================
switch (true) do {
// =============================================================================

	case (_isOfficer): {
		[_unit, _officerHead, _officerUniform, _officerVest, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_grenade,_countGrenades],[_flashlight,1],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, ["ItemGPS"]] call BRM_FMK_fnc_linkItem;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonPistol, _countPistol] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _laserdesignator] call BRM_FMK_fnc_addOptics;
		[_unit, "LR"] call BRM_FMK_fnc_addRadio;
	};

	case (_isSquadLeader): {
		[_unit,_leaderHead, _commonUniform, _slVest, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_grenade,_countGrenades],[_flashlight,1],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, ["ItemGPS"]] call BRM_FMK_fnc_linkItem;
		[_unit, _commonRifle, _countRifle, "", _commonRail, _commonRCO, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonRifle select GUN, _countTracerRifle, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
		[_unit, _commonPistol, _countPistol] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _rangefinder] call BRM_FMK_fnc_addOptics;
		[_unit, "LR"] call BRM_FMK_fnc_addRadio;
	};

	case (_isTeamLeader): {
		[_unit, _leaderHead, _commonUniform, _ftlVest, _commonBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_grenade,_countGrenades],[_flashlight,1]]] call BRM_FMK_fnc_addtoVest;
		if (!isNil "_commonGL") then {
			[_unit,[[_commonGL select RAMMO, _count40mm]]] call BRM_FMK_fnc_addtoBackpack;
			[_unit,[[_commonGL select GUN,1]]] call BRM_FMK_fnc_addtoBackpack;
		};
		[_unit, _commonRifleGL, [_countRifle, _count40mm], "", _commonRail, _commonEOT, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonRifle select GUN, _countTracerRifle, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
		[_unit, _commonPistol, _countPistol] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit, "LR"] call BRM_FMK_fnc_addRadio;
		[_unit, _commonAT, 1] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isReconLeader): {
		[_unit, _reconHead, _reconUniform, _reconVest, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGrenades],[_rChemlight,2],[_bChemlight,2],[_wFlare,2],[_flashlight,1],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, ["ItemGPS"]] call BRM_FMK_fnc_linkItem;
		[_unit, _laserdesignator] call BRM_FMK_fnc_addOptics;
		[_unit, _reconRifle, _countRifleLow, _commonSuppressor, _commonRail, _reconScope, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _reconRifle select GUN, _countTracerRifle, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
		[_unit, _commonPistol, _countPistol, _commonPistolSuppressor, "", "", ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, "LR"] call BRM_FMK_fnc_addRadio;
	};

	case (_isRTO): {
		[_unit, _commonHead, _commonUniform, _commonVest, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2], [_grenade,_countGrenades],[_flashlight,1],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _laserdesignator] call BRM_FMK_fnc_addOptics;
	};

	case (_isRifleman): {
		[_unit, _commonHead, _commonUniform, _commonVest, _commonBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade, _countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonRifle select GUN, _countTracerRifle, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
		[_unit, _commonAT, 1] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isDemo): {
		[_unit, _commonHead, _commonUniform, _commonVest, _bigBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, [[_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call BRM_FMK_fnc_addtoUniform;
		[_unit,[[_apMine,2],[_apMineBounding,2],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit,[[_demoCharge,3],[_demoSatchel,1],[_clackerDM,1]]] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isRiflemanAT): {
		[_unit, _commonHead, _commonUniform, _commonVest, _specATBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _specAT, _countSpecAT, "", "", _specATScope, ""] call BRM_FMK_fnc_addWeaponKit;
		if (!_isSpecATDisposable) then {
			if (_specAT select GUN == _SMAW select GUN) then {
				[_unit,[["rhs_mag_smaw_SR", 5]]] call BRM_FMK_fnc_addtoBackpack;
			};
			[_unit, _specAT select GUN, _countSpecHE, ["HE"]] call BRM_FMK_fnc_addAmmoAuto;
		};
	};

	case (_isWeaponsAT): {
		[_unit, _commonHead, _commonUniform, _commonVest, _bigBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _weaponsAT, 1, "", "", _weaponsATScope, ""] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isWeaponsATAssistant): {
		[_unit, _commonHead, _commonUniform, _commonVest, _bigBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, [[_weaponsAT select RAMMO, _countWeaponsAT]]] call BRM_FMK_fnc_addtoBackpack;
	};

	case (_isWeaponsAA): {
		[_unit, _commonHead, _commonUniform, _commonVest, _commonBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _weaponsAA, 1] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isWeaponsAAAssistant): {
		[_unit, _commonHead, _commonUniform, _commonVest, _bigBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, [[_weaponsAA select RAMMO, _countWeaponsAA]]] call BRM_FMK_fnc_addtoBackpack;
	};

	case (_isMarksman): {
		[_unit, _commonHead, _marksmanUniform, _marksmanVest, _commonBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2], [_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonMarksman, _countRifle, "", _commonRail, _marksmanScope, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonMarksman select GUN, _countTracerRifle, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isAutorifleman): {
		[_unit, _commonHead, _mgUniform, _mgVest, _commonBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_spareBarrel,1],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonAR, _countAR, "", _commonRail, _arScope, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonAR select GUN, (_countTracerRifle), ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isAutoriflemanAsst): {
		[_unit, _commonHead, _commonUniform, _commonVest, _bigBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_spareBarrel,1],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonAR select RAMMO, _countAR/2] call BRM_FMK_fnc_addAmmo;
	};

	case (_isMMG): {
		[_unit, _commonHead, _mgUniform, _mgVest, _commonBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_spareBarrel,1],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonMG, _countMG, "", _commonRail, _mgScope, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonMG select GUN, _countTracerMG, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isMMGAsst): {
		[_unit, _commonHead, _commonUniform, _commonVest, _bigBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit,[[_commonMG select RAMMO, (_countMG*2)]]] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _commonMG select GUN, _countTracerMG, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isGrenadier): {
		[_unit, _commonHead, _commonUniform, _grenadierVest, _commonBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		if (!isNil "_commonGL") then {
			[_unit,[[_commonGL select RAMMO, _count40mm]]] call BRM_FMK_fnc_addtoBackpack;
			[_unit,[[_commonGL select GUN,1]]] call BRM_FMK_fnc_addtoBackpack;
		};
		[_unit, _commonRifleGL, [_countRifleLow, _count40mm], "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isLifeSaver): {
		[_unit, _medicHead, _medicUniform, _medicVest, _medicalBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2], [_gSmoke,3],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _suppliesMedic] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		_defaultInsignia = _medicInsignia;
	};

	case (_isHMG): {
		[_unit, _commonHead, _commonUniform, _commonVest, _hmg] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isStaticAT): {
		[_unit, _commonHead, _commonUniform, _commonVest, _staticAT] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isHMGTripod): {
		[_unit, _commonHead, _commonUniform, _commonVest, _hmgTripod] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isATTripod): {
		[_unit, _commonHead, _commonUniform, _commonVest, _atTripod] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isMortar): {
		[_unit, _commonHead, _commonUniform, _commonVest, _mortar] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isMortarAssistant): {
		[_unit, _commonHead, _commonUniform, _commonVest, _mortarTripod] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isUAVOperator): {
		[_unit, _commonHead, _commonUniform, _slVest, _uavBag] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades],["ACE_UAVBattery", 3]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, _countRifle, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _laserdesignator] call BRM_FMK_fnc_addOptics;
		[_unit, [_uavTerminal]] call BRM_FMK_fnc_linkItem;
	};

	case (_isRecon): {
		[_unit, _reconHead, _reconUniform, _reconVest, _reconBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGrenades],[_rChemlight,2],[_bChemlight,2],[_wFlare,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _reconRifle, _countRifle, _commonSuppressor, _commonRail, _reconScope, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonAT, 1] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isReconAT): {
		[_unit, _reconHead, _reconUniform, _reconVest, _specATBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGrenades],[_rChemlight,2],[_bChemlight,2],[_wFlare,2],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _reconRifle, _countRifleLow, _commonSuppressor, _commonRail, _reconScope, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _specAT, _countSpecAT, "", "", _specATScope, ""] call BRM_FMK_fnc_addWeaponKit;
		if (!_isSpecATDisposable) then {
			if (_specAT select GUN == _SMAW select GUN) then {
				[_unit,[["rhs_mag_smaw_SR", 5]]] call BRM_FMK_fnc_addtoBackpack;
			};
			[_unit, _specAT select GUN, _countSpecHE, ["HE"]] call BRM_FMK_fnc_addAmmoAuto;
		};
	};

	case (_isReconMarksman ): {
		[_unit, _reconHead, _reconUniform, _reconVest, _reconBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGrenades],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonMarksman, _countRifle, _commonSuppressor, _commonRail, _marksmanScope, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonMarksman select GUN, _countTracerRifle, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isReconMedic): {
		[_unit, _reconHead, _reconUniform, _reconVest, _reconBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGrenades],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _suppliesMedic] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _reconRifle, _countRifle, _commonSuppressor, _commonRail, _reconScope, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonAT, 1] call BRM_FMK_fnc_addWeaponKit;
		_defaultInsignia = _medicInsignia;
	};

	case (_isReconDemo): {
		[_unit, _reconHead, _reconUniform, _reconVest, _reconBackpack] call BRM_FMK_fnc_useUniform;
		[_unit, _binocular] call BRM_FMK_fnc_addOptics;
		[_unit, [[_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call BRM_FMK_fnc_addtoUniform;
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGrenades],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit,[[_demoCharge,3],[_demoSatchel,1],[_clackerDM,1]]] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _reconRifle, _countRifleLow, _commonSuppressor, _commonRail, _reconScope, _commonBipod] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isPilot): {
		[_unit, _pilotHead, _pilotUniform, _pilotVest, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_flashlight,1],[_mapTools,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonPistol, _countPistol] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isHelicopterCrew): {
		[_unit, _helicrewHead, _helicrewUniform, _pilotVest, ""] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_rSmoke,2]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonSMG, _countRifleLow] call BRM_FMK_fnc_addWeaponKit;
	};

	case (_isHelicopterPilot): {
		[_unit, _helipilotHead, _helicrewUniform, _pilotVest, ""] call BRM_FMK_fnc_useUniform;
		if (_aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2],[_flashlight,1],[_rSmoke,2]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonSMG, _countRifleLow] call BRM_FMK_fnc_addWeaponKit;
		[_unit,[[_toolKit,1]]] call BRM_FMK_fnc_addtoBackpack;
	};

	case (_isCrewman): {
		[_unit, _crewmanHead, _crewUniform, _commonVest, ""] call BRM_FMK_fnc_useUniform;
		if (_isLeader && _aiBackpackRadios) then {[_unit, "BP"] call BRM_FMK_fnc_addRadio};
		[_unit,[[_wSmoke,2]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonSMG, _countRifleLow] call BRM_FMK_fnc_addWeaponKit;
		if (_isLeader) then {
			[_unit, _binocular] call BRM_FMK_fnc_addOptics;
			[_unit,[[_toolKit,1]]] call BRM_FMK_fnc_addtoBackpack;
		} else {
			[_unit, _commonAT, 1] call BRM_FMK_fnc_addWeaponKit;
		};
	};

	case (_isSniper): {
		[_unit, _sniperHead, _sniperUniform, _commonVest, if (_isLeader) then { "" } else { _commonBackpack }] call BRM_FMK_fnc_useUniform;
		if (_isLeader && _aiBackpackRadios) then { [_unit, "BP"] call BRM_FMK_fnc_addRadio };
		[_unit,[[_wSmoke,2],[_grenade,_countGrenades],[_mapTools,1],[_flashlight,1],[_rangeCard,1],[_weatherMeter,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonSniper, _countSniper, "", "", _sniperScope, ""] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _commonSniper select GUN, (_countSniper/2)+1, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
	};

	case (_isSpotter): {
		[_unit, _sniperHead, _sniperUniform, _commonVest, if (_isLeader) then { "" } else { _commonBackpack }] call BRM_FMK_fnc_useUniform;
		if (_isLeader && _aiBackpackRadios) then { [_unit, "BP"] call BRM_FMK_fnc_addRadio };
		[_unit,[[_wSmoke,2],[_rSmoke,2],[_gSmoke,2],[_grenade,_countGrenades],[_ATragMX,1],[_rangeCard,1],[_flashlight,1],[_mapTools,1],[_weatherMeter,1]]] call BRM_FMK_fnc_addtoVest;
		[_unit,[[_commonSniper select RAMMO, (_countSniper*2)],[_spottingScope,1]]] call BRM_FMK_fnc_addtoBackpack;
		[_unit, _commonRifle, _countRifleLow, "", _commonRail, "", _commonBipod] call BRM_FMK_fnc_addWeaponKit;
		[_unit, _laserdesignator] call BRM_FMK_fnc_addOptics;
	};

	default {
		[_unit, _commonHead, _commonUniform, _commonVest, _commonBackpack] call BRM_FMK_fnc_useUniform;
		[_unit,[[_wSmoke,2],[_grenade,3]]] call BRM_FMK_fnc_addtoVest;
		[_unit, _commonRifle, 5] call BRM_FMK_fnc_addWeaponKit;
	};
};

// ADDS ESSENTIALS =============================================================

if (_rifleScope != "" && { primaryWeapon _unit == _commonRifle select GUN && { _unit weaponAccessories primaryWeapon _unit select 2 == "" } }) then {
	[_unit, "primary", _rifleScope] call BRM_FMK_fnc_attachToWeapon;
};

[_unit, _suppliesNormal] call BRM_FMK_fnc_addtoUniform;

[_unit, ["ItemMap", "ItemCompass", "ItemWatch", _NVG]] call BRM_FMK_fnc_linkItem;

[_unit, "SR"] call BRM_FMK_fnc_addRadio;

[_unit] call BRM_FMK_fnc_addEarplugs;
