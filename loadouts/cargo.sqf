#include "\broma_framework\mission\cargo.hpp"
switch (toLower _x) do {
	case "medical": { [_object,
		[_earPlugs, 25],

		[_bandage, _countBandageCARGO],
		[_fieldDressing, _countBandageCARGO],
		[_packingBandage, _countBandageCARGO],
		[_elasticBandage, _countBandageCARGO],
		[_quickClot, _countBandageCARGO],

		[_painkillers, _countMorphineCARGO],
		[_morphine, _countMorphineCARGO],
		[_epinephrine, _countEpiCARGO],
		[_adenosine, _countMorphineCARGO],

		[_tourniquet, _countTourniquetCARGO],
		[_splint, _countSplintCARGO],

		[_blood250, _countBloodbagCARGO],
		[_blood500, _countBloodbagCARGO],
		[_blood1000, _countBloodbagCARGO],
		[_personalAidKit, _countPAKCARGO],
		[_bodyBag, _countBloodbagCARGO],

		[_surgKit, [5, 50] select (ace_medical_treatment_consumeSurgicalKit == 1)],
		[_suture, 100]] call BRM_FMK_fnc_addItems;
	};

	case "ammo_big";
	case "ammo": {
		private _supplies = [
			[_commonRIFLE select RAMMO, _countRifleCARGO],
			[_commonMG select RAMMO, _countMGCARGO],
			[_commonAR select RAMMO, _countARCARGO],
			[_commonMARKSMAN select RAMMO, _countRifleCARGO],
			[_commonSNIPER select RAMMO, _countSNIPERCARGO],
			[_commonSMG select RAMMO, _countRifleCARGO],
			[_commonRIFLEGL select GL, _count40mmCARGO],
			[_commonRIFLEGL select RAMMO, _countRifleCARGO],
			[_commonPISTOL select RAMMO, _countPistolCARGO],
			[_grenade, _countGRENADESCARGO],
			[_rChemlight, _countGRENADESCARGO],
			[_gChemlight, _countGRENADESCARGO],
			[_bChemlight, _countGRENADESCARGO],
			[_yChemlight, _countGRENADESCARGO],
			[_wChemlight, _countGRENADESCARGO],
			[_oChemlight, _countGRENADESCARGO],
			[_irChemlight, _countGRENADESCARGO],
			[_wSmoke, _countGRENADESCARGO],
			[_rSmoke, _countGRENADESCARGO],
			[_gSmoke, _countGRENADESCARGO],
			[_ySmoke, _countGRENADESCARGO],
			[_pSmoke, _countGRENADESCARGO],
			[_bSmoke, _countGRENADESCARGO],
			[_oSmoke, _countGRENADESCARGO]
		];

		if (!_isCommonATDisposable) then {
			_supplies pushBack [_commonAT select RAMMO, _countCommonATCARGO];
		};

		if (!_isSpecATDisposable) then {
			_supplies pushBack [_specAT select RAMMO, _countSpecATCARGO];
		};

		if (!isNil "_reconRIFLE") then {
			_supplies pushBack [_reconRIFLE select RAMMO, _countRifleCARGO];
		};

		if (!isNil "_rifleLIST") then {
			{
				if (_x select GUN != _commonRIFLE select GUN) then {
					_supplies pushBack [_x select RAMMO, _countRifleCARGO];
				};
			} forEach _rifleLIST;
		};

		if (!isNil "_rifleGLList") then {
			{
				if (_x select GUN != _commonRIFLEGL select GUN) then {
					_supplies append [
						[_x select GL, _count40mmCARGO],
						[_x select RAMMO, _countRifleCARGO]
					];
				};
			} forEach _rifleGLList;
		};

		if (!isNil "_arLIST") then {
			{
				if (_x select GUN != _commonAR select GUN) then {
					_supplies pushBack [_x select RAMMO, _countARCARGO];
				};
			} forEach _arLIST;
		};

		if (!isNil "_smgLIST") then {
			{
				if (_x select GUN != _commonSMG select GUN) then {
					_supplies pushBack [_x select RAMMO, _countRifleCARGO];
				};
			} forEach _smgLIST;
		};

		if (_x == "ammo_big") then {
			_supplies apply { [_x select 0, (_x select 1) * 3] };
		};

		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "at": {
		private _supplies = [
			[_specAT select ([RAMMO, GUN] select _isSpecATDisposable), _countSpecATCARGO],
			[_weaponsAT select RAMMO, _countWeaponsATCARGO],
			[_weaponsAA select RAMMO, _countWeaponsAACARGO],
			[_commonAT select ([RAMMO, GUN] select _isCommonATDisposable), _countCommonATCARGO]
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
		[_RPGV, _countSpecATCARGO],
		[_RPGVL, _countSpecATCARGO],
		[_RPGVOGV, _countSpecATCARGO],
		[_RPGVM, _countSpecATCARGO],
		[_RPGVMHEAT, _countSpecATCARGO],
		[_RPGVR, _countSpecATCARGO],
		[_RPGVS, _countSpecATCARGO],
		[_RPGVS, _countSpecATCARGO],
		[_RPGTBG, _countSpecATCARGO],
		[_RPGTYPE69, _countSpecATCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "Type06_ammo": { [_object,
		["BRM_Type06_HE", _count40mmCARGO],
		["BRM_Type06_HEAT", _count40mmCARGO],
		["BRM_Type06_SMK_W", _count40mmCARGO],
		["BRM_Type06_SMK_G", _count40mmCARGO],
		["BRM_Type06_SMK_R", _count40mmCARGO],
		["BRM_Type06_SMK_P", _count40mmCARGO],
		["BRM_Type06_FLR_W", _count40mmCARGO],
		["BRM_Type06_FLR_G", _count40mmCARGO],
		["BRM_Type06_FLR_R", _count40mmCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "rifle": { [_object, _commonRIFLE select RAMMO, _countRifleCARGO] call BRM_FMK_fnc_addItem; };
	case "riflegl": { [_object,
		[_commonRIFLEGL select RAMMO, _countRifleCARGO],
		[_commonRIFLEGL select GL, _count40mmCARGO]] call BRM_FMK_fnc_addItems;
	};
	case "pistol": { [_object, _commonPISTOL select RAMMO, _countPistolCARGO] call BRM_FMK_fnc_addItem; };
	case "ar": { [_object, _commonAR select RAMMO, _countARCARGO] call BRM_FMK_fnc_addItem; };
	case "mg": { [_object, _commonMG select RAMMO, _countMGCARGO] call BRM_FMK_fnc_addItem; };
	case "marksman": { [_object, _commonMARKSMAN select RAMMO, _countRifleCARGO] call BRM_FMK_fnc_addItem; };
	case "sniper": { [_object, _commonSNIPER select RAMMO, _countSNIPERCARGO] call BRM_FMK_fnc_addItem; };
	case "smg": { [_object, _commonSMG select RAMMO, _countRifleCARGO] call BRM_FMK_fnc_addItem; };
	case "lat": { [_object, _commonAT select ([RAMMO, GUN] select _isCommonATDisposable), _countCommonATCARGO] call BRM_FMK_fnc_addItem; };
	case "mat": { [_object, _specAT select ([RAMMO, GUN] select _isSpecATDisposable), _countSpecATCARGO] call BRM_FMK_fnc_addItem; };
	case "hat": { [_object, _weaponsAT select RAMMO, _countWeaponsATCARGO] call BRM_FMK_fnc_addItem; };
	case "haa": { [_object, _weaponsAA select RAMMO, _countWeaponsAACARGO] call BRM_FMK_fnc_addItem; };
	case "rifle_recon": { [_object, _reconRIFLE select RAMMO, _countRifleCARGO] call BRM_FMK_fnc_addItem; };
	case "gl": { [_object, _commonGL select RAMMO, _count40mmCARGO] call BRM_FMK_fnc_addItem; };

	case "chemlight": { [_object,
		[_rChemlight, _countGRENADESCARGO],
		[_gChemlight, _countGRENADESCARGO],
		[_bChemlight, _countGRENADESCARGO],
		[_yChemlight, _countGRENADESCARGO],
		[_wChemlight, _countGRENADESCARGO],
		[_oChemlight, _countGRENADESCARGO],
		[_irChemlight, _countGRENADESCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "chemlight_hi": { [_object,
		[_rChemlightHi, _countGRENADESCARGO],
		[_gChemlightHi, _countGRENADESCARGO],
		[_bChemlightHi, _countGRENADESCARGO],
		[_yChemlightHi, _countGRENADESCARGO],
		[_wChemlightHi, _countGRENADESCARGO],
		[_oChemlightHi, _countGRENADESCARGO],
		[_oChemlightHiU, _countGRENADESCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "smoke": { [_object,
		[_wSmoke, _countGRENADESCARGO],
		[_rSmoke, _countGRENADESCARGO],
		[_gSmoke, _countGRENADESCARGO],
		[_ySmoke, _countGRENADESCARGO],
		[_pSmoke, _countGRENADESCARGO],
		[_bSmoke, _countGRENADESCARGO],
		[_oSmoke, _countGRENADESCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "bandage": { [_object,
		[_bandage, _countBandageCARGO],
		[_fieldDressing, _countBandageCARGO],
		[_packingBandage, _countBandageCARGO],
		[_elasticBandage, _countBandageCARGO],
		[_quickClot, _countBandageCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "blood": { [_object,
		[_blood250, _countBloodbagCARGO],
		[_blood500, _countBloodbagCARGO],
		[_blood1000, _countBloodbagCARGO]] call BRM_FMK_fnc_addItems;
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
