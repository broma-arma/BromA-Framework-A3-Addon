#include "\broma_framework\mission\cargo.hpp"
switch (toLower _x) do {
	case "medical": { [_object,
		[_earPlugs, 25],

		[_bandage, _countBandageCargo],
		[_fieldDressing, _countBandageCargo],
		[_packingBandage, _countBandageCargo],
		[_elasticBandage, _countBandageCargo],
		[_quickClot, _countBandageCargo],

		[_painkillers, _countMorphineCargo],
		[_morphine, _countMorphineCargo],
		[_epinephrine, _countEpiCARGO],
		[_adenosine, _countMorphineCargo],

		[_tourniquet, _countTourniquetCargo],
		[_splint, _countSplintCargo],

		[_blood250, _countBloodbagCargo],
		[_blood500, _countBloodbagCargo],
		[_blood1000, _countBloodbagCargo],
		[_personalAidKit, _countPAKCargo],
		[_bodyBag, _countBloodbagCargo],

		[_surgKit, [5, 50] select (ace_medical_treatment_consumeSurgicalKit == 1)],
		[_suture, 100]] call BRM_FMK_fnc_addItems;
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

	case "Type06_ammo": { [_object,
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
