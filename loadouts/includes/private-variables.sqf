// File is included in mission framework
private [
	"_unit", "_faction", "_type",
	"_isLeader", "_isMan",
	"_initialized",
	"_factionSide",
	"_loadoutCondition",
	"_assignLoadoutMode",

	"_ret", // mission\loadouts\fn_getLoadoutProperty.sqf

	// Factions
	"_factionID", "_factionName", "_factionStructure", "_factionCallsigns",
	"_defaultName", "_defaultSide", "_defaultVoice", "_defaultFace", "_defaultInsignia", "_defaultColor",

	"_factionSkill", "_factionUnits", "_factionVehicles", "_factionObjects", "_factionDACCamps",

	"_rifleList", "_rifleGLList", "_arList", "_smgList",
	"_commonRifle", "_countRifle", "_countRifleLow", "_countTracerRifle", "_countRifleCargo",
	"_reconRifle",
	"_commonRifleGL", "_count40mm", "_count40mmCargo",
	"_commonPistol", "_countPistol", "_countPistolCargo",
	"_commonAR", "_countAR", "_countARCargo",
	"_commonMG", "_countMG", "_countMGCargo", "_countTracerMG",
	"_commonMarksman",
	"_commonSniper", "_countSniper", "_countSniperCargo",
	"_commonAT", "_countCommonATCargo", "_isCommonATDisposable",
	"_specAT", "_countSpecAT", "_countSpecATCargo", "_countSpecHE", "_countSpecHECargo", "_isSpecATDisposable",
	"_commonSMG",
	"_commonGL",
	"_weaponsAA", "_countWeaponsAA", "_countWeaponsAACargo",
	"_weaponsAT", "_countWeaponsAT", "_countWeaponsATCargo",

	"_commonRCO", "_commonCCO", "_commonEOT", "_sniperScope", "_marksmanScope", "_specATScope", "_weaponsATScope",
	"_commonSuppressor", "_commonPistolSuppressor",
	"_commonRail", "_commonBipod",

	"_rifleScope", "_arScope", "_mgScope", "_reconScope",

	"_countGrenades", "_countGrenadesCargo",

	"_commonHead", "_leaderHead", "_officerHead", "_medicHead", "_crewmanHead", "_pilotHead", "_helicrewHead", "_helipilotHead", "_sniperHead", "_demoHead", "_reconHead",
	"_commonUniform", "_officerUniform", "_pilotUniform", "_sniperUniform", "_marksmanUniform", "_helicrewUniform", "_crewUniform", "_mgUniform", "_medicUniform", "_demoUniform", "_reconUniform",
	"_commonVest", "_officerVest", "_ftlVest", "_slVest", "_mgVest", "_grenadierVest", "_medicVest", "_demoVest", "_marksmanVest", "_reconVest", "_pilotVest",
	"_commonBackpack", "_bigBackpack", "_medicalBackpack", "_specATBackpack", "_reconBackpack",

	"_staticAT", "_atTripod",
	"_hmg", "_hmgTripod",
	"_mortar", "_mortarTripod",

	"_uavBag", "_uavTerminal",

	"_countBandage", "_countBandageCargo",
	"_countTourniquet", "_countTourniquetCargo",
	"_countSplint", "_countSplintCargo",

	"_countMorphine", "_countMorphineCargo",
	"_countEpi", "_countEpiCargo",

	"_countBloodbag", "_countBloodbagCargo",

	"_countPAK", "_countPAKCargo",

	"_nightOnlyNVGs",

	"_aiBackpackRadios",

	"_suppliesNormal", "_suppliesMedic",

	// Deprecated
	"_countCAT", "_isATDisposable",
	"_countAT", "_countATCargo", "_countHE",
	"_commonMagnified",

	// Unused
	"_commonRifleATTACHMENTS", "_commonHandgunATTACHMENTS", "_commonMGATTACHMENTS", "_commonMarksmanATTACHMENTS", "_commonSniperATTACHMENTS", "_commonSpecATATTACHMENTS", "_commonRifleGLATTACHMENTS", "_commonSMGATTACHMENTS",

	"_countBANDAGEPACKING", "_medkit", "_radio", "_backpack", "_addBinocs", "_addRadio", "_addAmmo", "_addWeapon", "_wep", "_ammoamount", "_tripod", "_cond", "_done"
];

#define GUN 0
#define RAMMO 1
#define GL 2

private _defaultCallsignBLUFOR = [
	"Zero",
	"Alpha", "Bravo", "Charlie", "Delta",
	"Razor", "Sierra", "Wizard", "Shocker", "Paradise", "Meteor", "Lancer", "Titan", "Havoc", "Pegasus"
];

private _defaultCallsignOPFOR = [
	"Godfather",
	"Anaconda", "Boa", "Cobra", "Dragon",
	"Raven", "Scorpion", "Weasel", "Sparrow", "Pelican", "Moose", "Lion", "Tiger", "Hawk", "Phoenix"
];

private _defaultCallsignINDFOR = [
	"Papa",
	"Anna", "Beatrice", "Clara", "Denise",
	"Rose", "Sarah", "Whitney", "Shirley", "Penny", "Mary", "Lucy", "Tanya", "Helen", "Petunia"
];

private _medicInsignia = ["UK3CB_BAF_Insignia_RedCross", "ACE_insignia_logo", "IDAP", ""];
_medicInsignia = _medicInsignia select (_medicInsignia findIf { isClass (configFile >> "CfgUnitInsignia" >> _x) });
