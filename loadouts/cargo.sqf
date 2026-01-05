#include "\broma_framework\mission\cargo.hpp"
switch (toLower _x) do {
	case "medical": {
		private _supplies = [
			[_earPlugs, 25],

			[_bandage, _countBandageCargo],
			[_fieldDressing, _countBandageCargo],
			[_packingBandage, _countBandageCargo],
			[_elasticBandage, _countBandageCargo],
			[_quickClot, _countBandageCargo],

			[_painkillers, _countMorphineCargo],
			[_morphine, _countMorphineCargo],
			[_epinephrine, _countEpiCargo]
		];

		if (!mission_KAT_enabled) then {
			_supplies pushBack [_adenosine, _countMorphineCargo];
		};

		_supplies append [
			[_tourniquet, _countTourniquetCargo],
			[_splint, _countSplintCargo]
		];

		if (!mission_KAT_enabled) then {
			_supplies append [
				[_blood250, _countBloodbagCargo],
				[_blood500, _countBloodbagCargo],
				[_blood1000, _countBloodbagCargo]
			];
		};

		_supplies append [
			[_personalAidKit, _countPAKCargo],
			[_bodyBag, _countBloodbagCargo],

			[_surgKit, [5, 50] select (ace_medical_treatment_consumeSurgicalKit == 1)],
			[_suture, 100]
		];

		if (mission_KAT_enabled) then {
			if (kat_hypothermia_hypothermiaActive) then {
				_supplies pushBack ["kat_handWarmer", _countBandageCargo];
			};

			_supplies append [
				["kat_IFAK", _countBandageCargo],
				["kat_MFAK", _countBandageCargo / 2],
				["kat_AFAK", _countBandageCargo / 8],
				[["kat_ncdKit", "kat_aatKit"] select kat_breathing_advPtxEnable, _countEpiCargo]
			];

			if (kat_airway_enable) then {
				_supplies pushBack ["kat_larynx", [_countBandageCargo, _countBandageCargo / 4] select kat_airway_ReusableAirwayItems];
			};

			_supplies append [
				["kat_Carbonate", _countEpiCargo],
				["kat_fentanyl", _countMorphineCargo / 3],
				["kat_EACA", _countPAKCargo],
				["kat_TXA", _countPAKCargo],
				["kat_naloxone", _countMorphineCargo],
				["kat_nitroglycerin", _countEpiCargo],
				["kat_phenylephrineAuto", _countEpiCargo],
				["kat_chestSeal", _countEpiCargo],
				["kat_IV_16", [_countMorphineCargo, _countMorphineCargo / 2] select kat_pharma_IVreuse],
				["kat_IO_FAST", [_countEpiCargo, _countEpiCargo / 3] select kat_pharma_IVreuse],
				["kat_epinephrineIV", _countEpiCargo / 2],
				["kat_Painkiller", _countMorphineCargo],
				["kat_bloodIV_O_N", _countBloodbagCargo],
				["ACE_salineIV", _countBloodbagCargo]
			];

			if (kat_hypothermia_hypothermiaActive) then {
				_supplies pushBack ["kat_fluidWarmer", _countBloodbagCargo];
			};

			_supplies append [
				["ACE_plasmaIV", _countBloodbagCargo]
			];
		};
		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "ammo_big";
	case "ammo": {
		private _supplies = [
			[_commonRifle select RAMMO, _countRifleCargo],
			[_commonMG select RAMMO, _countMGCargo],
			[_commonAR select RAMMO, _countARCargo],
			[_commonMarksman select RAMMO, _countRifleCargo],
			[_commonSniper select RAMMO, _countSniperCargo],
			[_commonSMG select RAMMO, _countRifleCargo],
			[_commonRifleGL select GL, _count40mmCargo],
			[_commonRifleGL select RAMMO, _countRifleCargo],
			[_commonPistol select RAMMO, _countPistolCargo],
			[_grenade, _countGrenadesCargo],
			[_rChemlight, _countGrenadesCargo],
			[_gChemlight, _countGrenadesCargo],
			[_bChemlight, _countGrenadesCargo],
			[_yChemlight, _countGrenadesCargo],
			[_wChemlight, _countGrenadesCargo],
			[_oChemlight, _countGrenadesCargo],
			[_irChemlight, _countGrenadesCargo],
			[_wSmoke, _countGrenadesCargo],
			[_rSmoke, _countGrenadesCargo],
			[_gSmoke, _countGrenadesCargo],
			[_ySmoke, _countGrenadesCargo],
			[_pSmoke, _countGrenadesCargo],
			[_bSmoke, _countGrenadesCargo],
			[_oSmoke, _countGrenadesCargo]
		];

		if (!_isCommonATDisposable) then {
			_supplies pushBack [_commonAT select RAMMO, _countCommonATCargo];
		};

		if (!_isSpecATDisposable) then {
			_supplies append [
				[_specAT select RAMMO, _countSpecATCargo],
				[[_specAT, ["HE"]] call BRM_FMK_fnc_getAmmoClass, _countSpecHECargo]
			];
		};

		if (!isNil "_reconRifle") then {
			_supplies pushBack [_reconRifle select RAMMO, _countRifleCargo];
		};

		if (!isNil "_rifleList") then {
			{
				if (_x select GUN != _commonRifle select GUN) then {
					_supplies pushBack [_x select RAMMO, _countRifleCargo];
				};
			} forEach _rifleList;
		};

		if (!isNil "_rifleGLList") then {
			{
				if (_x select GUN != _commonRifleGL select GUN) then {
					_supplies append [
						[_x select GL, _count40mmCargo],
						[_x select RAMMO, _countRifleCargo]
					];
				};
			} forEach _rifleGLList;
		};

		if (!isNil "_arList") then {
			{
				if (_x select GUN != _commonAR select GUN) then {
					_supplies pushBack [_x select RAMMO, _countARCargo];
				};
			} forEach _arList;
		};

		if (!isNil "_smgList") then {
			{
				if (_x select GUN != _commonSMG select GUN) then {
					_supplies pushBack [_x select RAMMO, _countRifleCargo];
				};
			} forEach _smgList;
		};

		if (_x == "ammo_big") then {
			_supplies apply { [_x select 0, (_x select 1) * 3] };
		};

		if (isClass (configFile >> "CfgPatches" >> "UK3CB_BAF_Vehicles_Weapons") && { configSourceMod configOf _object == "@3CB BAF Vehicles" }) then {
			// 3CB Vehicle Ammo
			{
				_x params ["_type", "_ammo"];
				if (_object isKindOf _type) then {
					_supplies append _ammo;
					break;
				};
			} forEach [
				["UK3CB_BAF_Merlin_HC3_Armed_Base", [["UK3CB_BAF_762_200Rnd_T", 15]]],
				["UK3CB_BAF_Coyote_L111A1_Base", [["UK3CB_BAF_762_200Rnd_T", 9], ["UK3CB_BAF_127_100Rnd", 9]]],
				["UK3CB_BAF_Coyote_L134A1_Base", [["UK3CB_BAF_762_200Rnd_T", 9], ["UK3CB_BAF_32Rnd_40mm_G_Box", 9]]],
				["UK3CB_BAF_Husky_GMG_Base", [["UK3CB_BAF_32Rnd_40mm_G_Box", 6]]],
				["UK3CB_BAF_Husky_GPMG_Base", [["UK3CB_BAF_762_200Rnd", 6], ["UK3CB_BAF_762_200Rnd_T", 6]]],
				["UK3CB_BAF_Husky_HMG_Base", [["UK3CB_BAF_127_100Rnd", 8]]],
				["UK3CB_BAF_LandRover_WMIK_HMG_Base", [["UK3CB_BAF_762_200Rnd_T", 6], ["UK3CB_BAF_127_100Rnd", 6]]],
				["UK3CB_BAF_LandRover_WMIK_GMG_Base", [["UK3CB_BAF_762_200Rnd_T", 6], ["UK3CB_BAF_32Rnd_40mm_G_Box", 6]]],
				["UK3CB_BAF_LandRover_WMIK_GPMG_Base", [["UK3CB_BAF_762_200Rnd_T", 12]]],
				["UK3CB_BAF_LandRover_WMIK_Milan_Base", [["UK3CB_BAF_762_200Rnd_T", 6], ["UK3CB_BAF_1Rnd_Milan", 4]]],
				["UK3CB_BAF_FV432_Mk3_GPMG_Sand", [["UK3CB_BAF_762_200Rnd_T", 9]]],
				["UK3CB_BAF_FV432_Mk3_RWS_Sand", [["UK3CB_BAF_127_100Rnd", 9]]],
				["UK3CB_BAF_Panther_GPMG_Sand_A", [["UK3CB_BAF_762_200Rnd_T", 9]]],
				["UK3CB_BAF_RHIB_HMG", [["UK3CB_BAF_127_100Rnd", 9]]],
				["UK3CB_BAF_RHIB_GPMG", [["UK3CB_BAF_762_200Rnd", 6], ["UK3CB_BAF_762_200Rnd_T", 6]]],
				["UK3CB_BAF_Warrior_A3_Base", [["UK3CB_BAF_6Rnd_30mm_L21A1_APDS", 17], ["UK3CB_BAF_6Rnd_30mm_L21A1_HE", 17], ["UK3CB_BAF_762_800Rnd_T", 1], ["UK3CB_BAF_762_200Rnd_T", 3]]]
			];
		};

		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "at": {
		private _supplies = [
			[_specAT select ([RAMMO, GUN] select _isSpecATDisposable), _countSpecATCargo],
			[_weaponsAT select RAMMO, _countWeaponsATCargo],
			[_weaponsAA select RAMMO, _countWeaponsAACargo],
			[_commonAT select ([RAMMO, GUN] select _isCommonATDisposable), _countCommonATCargo]
		];

		if (!("rpg7_ammo" in _type) && _specAT select 0 select [0, 13] isEqualTo "rhs_weap_rpg7") then {
			_type pushBackUnique "rpg7_ammo";
		};

		if (_specAT select GUN == _SMAW select GUN) then {
			_supplies pushBack ["rhs_mag_smaw_SR", 25];
		};

		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "explosives": { [_object,
		[_demoCharge, 10],
		[_demoSatchel, 10]] call BRM_FMK_fnc_addItems;
	};

	case "mines": { [_object,
		[_atMine, 25],
		[_dpMine, 25],
		[_apMine, 25],
		[_apMineWire, 25],
		[_apMineDirectional, 25]] call BRM_FMK_fnc_addItems;
	};

	case "at_mines": { [_object,
		[_atMine, 25],
		[_dpMine, 25]] call BRM_FMK_fnc_addItems;
	};

	case "ap_mines": { [_object,
		[_apMine, 25],
		[_apMineWire, 25],
		[_apMineDirectional, 25]] call BRM_FMK_fnc_addItems;
	};

	case "radio": { [_object,
		[[_factionSide, "SR"] call BRM_FMK_fnc_getRadio, 20],
		[[_factionSide, "LR"] call BRM_FMK_fnc_getRadio, 10],
		[[_factionSide, "BP"] call BRM_FMK_fnc_getRadio, 5]] call BRM_FMK_fnc_addItems;
	};

	case "rifle_grenades": { [_object,
		["R3F_APAV40", 40],
		["R3F_AC58", 40],
		["R3F_FUM40", 40]] call BRM_FMK_fnc_addItems;
	};

	case "rpg7_ammo": { [_object,
		[_RPGV, _countSpecATCargo],
		[_RPGVL, _countSpecATCargo],
		[_RPGVOGV, _countSpecATCargo],
		[_RPGVM, _countSpecATCargo],
		[_RPGVMHEAT, _countSpecATCargo],
		[_RPGVR, _countSpecATCargo],
		[_RPGVS, _countSpecATCargo],
		[_RPGVS, _countSpecATCargo],
		[_RPGTBG, _countSpecATCargo],
		[_RPGTYPE69, _countSpecATCargo]] call BRM_FMK_fnc_addItems;
	};

	case "m203": { [_object,
		[_40mmSwhite, _count40mmCargo],
		[_40mmSred, _count40mmCargo],
		[_40mmSgreen, _count40mmCargo],
		[_40mmSyellow, _count40mmCargo],
		[_40mmSpurple, _count40mmCargo],
		[_40mmSblue, _count40mmCargo],
		[_40mmSorange, _count40mmCargo],

		[_40mmFwhite, _count40mmCargo],
		[_40mmFred, _count40mmCargo],
		[_40mmFgreen, _count40mmCargo],
		[_40mmFyellow, _count40mmCargo],
		[_40mmFir, _count40mmCargo],

		[_40mmIwhite, _count40mmCargo],
		[_40mmIir, _count40mmCargo]] call BRM_FMK_fnc_addItems;
	};

	case "gp": { [_object,
		["rhs_GRD40_Green", _count40mmCargo],
		["rhs_GRD40_Red", _count40mmCargo],
		["rhs_GRD40_White", _count40mmCargo],
		["rhs_VG40OP_green", _count40mmCargo],
		["rhs_VG40OP_red", _count40mmCargo],
		["rhs_VG40OP_white", _count40mmCargo]] call BRM_FMK_fnc_addItems;
	};

	case "type06_ammo": { [_object,
		["BRM_Type06_HE", _count40mmCargo],
		["BRM_Type06_HEAT", _count40mmCargo],
		["BRM_Type06_SMK_W", _count40mmCargo],
		["BRM_Type06_SMK_G", _count40mmCargo],
		["BRM_Type06_SMK_R", _count40mmCargo],
		["BRM_Type06_SMK_P", _count40mmCargo],
		["BRM_Type06_FLR_W", _count40mmCargo],
		["BRM_Type06_FLR_G", _count40mmCargo],
		["BRM_Type06_FLR_R", _count40mmCargo]] call BRM_FMK_fnc_addItems;
	};

	case "rifle": { [_object, _commonRifle select RAMMO, _countRifleCargo] call BRM_FMK_fnc_addItem; };
	case "riflegl": { [_object,
		[_commonRifleGL select RAMMO, _countRifleCargo],
		[_commonRifleGL select GL, _count40mmCargo]] call BRM_FMK_fnc_addItems;
	};
	case "pistol": { [_object, _commonPistol select RAMMO, _countPistolCargo] call BRM_FMK_fnc_addItem; };
	case "ar": { [_object, _commonAR select RAMMO, _countARCargo] call BRM_FMK_fnc_addItem; };
	case "mg": { [_object, _commonMG select RAMMO, _countMGCargo] call BRM_FMK_fnc_addItem; };
	case "marksman": { [_object, _commonMarksman select RAMMO, _countRifleCargo] call BRM_FMK_fnc_addItem; };
	case "sniper": { [_object, _commonSniper select RAMMO, _countSniperCargo] call BRM_FMK_fnc_addItem; };
	case "smg": { [_object, _commonSMG select RAMMO, _countRifleCargo] call BRM_FMK_fnc_addItem; };
	case "lat": { [_object, _commonAT select ([RAMMO, GUN] select _isCommonATDisposable), _countCommonATCargo] call BRM_FMK_fnc_addItem; };
	case "mat": { [_object, _specAT select ([RAMMO, GUN] select _isSpecATDisposable), _countSpecATCargo] call BRM_FMK_fnc_addItem; };
	case "hat": { [_object, _weaponsAT select RAMMO, _countWeaponsATCargo] call BRM_FMK_fnc_addItem; };
	case "haa": { [_object, _weaponsAA select RAMMO, _countWeaponsAACargo] call BRM_FMK_fnc_addItem; };
	case "rifle_recon": { [_object, _reconRifle select RAMMO, _countRifleCargo] call BRM_FMK_fnc_addItem; };
	case "gl": { [_object, _commonGL select RAMMO, _count40mmCargo] call BRM_FMK_fnc_addItem; };

	case "chemlight": { [_object,
		[_rChemlight, _countGrenadesCargo],
		[_gChemlight, _countGrenadesCargo],
		[_bChemlight, _countGrenadesCargo],
		[_yChemlight, _countGrenadesCargo],
		[_wChemlight, _countGrenadesCargo],
		[_oChemlight, _countGrenadesCargo],
		[_irChemlight, _countGrenadesCargo]] call BRM_FMK_fnc_addItems;
	};

	case "chemlight_hi": { [_object,
		[_rChemlightHi, _countGrenadesCargo],
		[_gChemlightHi, _countGrenadesCargo],
		[_bChemlightHi, _countGrenadesCargo],
		[_yChemlightHi, _countGrenadesCargo],
		[_wChemlightHi, _countGrenadesCargo],
		[_oChemlightHi, _countGrenadesCargo],
		[_oChemlightHiU, _countGrenadesCargo]] call BRM_FMK_fnc_addItems;
	};

	case "handheldflares": { [_object,
		[_wFlare, _countGrenadesCargo],
		[_rFlare, _countGrenadesCargo],
		[_gFlare, _countGrenadesCargo],
		[_yFlare, _countGrenadesCargo]] call BRM_FMK_fnc_addItems;
	};

	case "smoke": { [_object,
		[_wSmoke, _countGrenadesCargo],
		[_rSmoke, _countGrenadesCargo],
		[_gSmoke, _countGrenadesCargo],
		[_ySmoke, _countGrenadesCargo],
		[_pSmoke, _countGrenadesCargo],
		[_bSmoke, _countGrenadesCargo],
		[_oSmoke, _countGrenadesCargo]] call BRM_FMK_fnc_addItems;
	};

	case "bandage": { [_object,
		[_bandage, _countBandageCargo],
		[_fieldDressing, _countBandageCargo],
		[_packingBandage, _countBandageCargo],
		[_elasticBandage, _countBandageCargo],
		[_quickClot, _countBandageCargo]] call BRM_FMK_fnc_addItems;
	};

	case "blood": { [_object,
		[_blood250, _countBloodbagCargo],
		[_blood500, _countBloodbagCargo],
		[_blood1000, _countBloodbagCargo]] call BRM_FMK_fnc_addItems;
	};

	case "rangetables": { [_object,
		[_rifleRangetable, 5],
		[_mortarRangetable, 5],
		[_artilleryRangetable, 5]] call BRM_FMK_fnc_addItems;
	};

	case "contraband": { [_object,
		[_matches, 30],
		[_lighter, 30],
		[_cigpack, 50],
		[_cigar, 50],
		[_poppack, 50]] call BRM_FMK_fnc_addItems;
	};


	case "spraypaint": { [_object,
		[_spraypaintBlack, 50],
		[_spraypaintBlue, 50],
		[_spraypaintGreen, 50],
		[_spraypaintRed, 50],
		[_spraypaintWhite, 50],
		[_spraypaintYellow, 50]] call BRM_FMK_fnc_addItems;
	};

	case "markerflags": { [_object,
		[_markerFlagBlack, 50],
		[_markerFlagBlue, 50],
		[_markerFlagGreen, 50],
		[_markerFlagOrange, 50],
		[_markerFlagPurple, 50],
		[_markerFlagRed, 50],
		[_markerFlagWhite, 50],
		[_markerFlagYellow, 50]] call BRM_FMK_fnc_addItems;
	};

	case "towropes": { [_object,
		[_towRope, 50],
		[_towRope3, 50],
		[_towRope6, 50],
		[_towRope12, 50],
		[_towRope15, 50],
		[_towRope18, 50],
		[_towRope27, 50],
		[_towRope36, 50]] call BRM_FMK_fnc_addItems;
	};

	default {
		private _contentCargo = BRM_FMK_Engine_contentCargo get toLower _x;
		if (!isNil "_contentCargo") then { //count | [name, count]
			_contentCargo params ["_name", "_count"];
			if (isNil "_count") then {
				_count = _name;
				_name = _x;
			};
			if (_count isEqualType {}) then {
				_count = call _count;
			};
			[_object, call compile format ["_%1", _name], _count] call BRM_FMK_fnc_addItem;
		} else {
			["Unknown cargo type: '%1' (%2)", _x, _type] call BIS_fnc_error;
		};
	};
};
