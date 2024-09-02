private [
	"_unit", "_faction", "_type",
	"_isLeader", "_isMan",
	"_initialized",
	"_factionSide",
	"_loadoutCondition",
	"_assignLoadoutMode",

	"_isOfficer", "_isSquadLeader", "_isTeamLeader",
	"_isRifleman", "_isRiflemanAT",
	"_isMarksman",
	"_isAutorifleman", "_isAutoriflemanAsst",
	"_isLifeSaver",
	"_isGrenadier",
	"_isHelicopterPilot", "_isHelicopterCrew",
	"_isEngineer",
	"_isCrewman",
	"_isPilot",
	"_isRTO",
	"_isReconLeader", "_isRecon", "_isReconDemo", "_isReconMedic", "_isReconAT", "_isReconMarksman",
	"_isDemo",
	"_isHMG", "_isHMGTripod",
	"_isStaticAT",
	"_isUAVOperator",
	"_isATTripod",
	"_isMortar", "_isMortarAssistant",
	"_isWeaponsAT", "_isWeaponsATAssistant",
	"_isWeaponsAA", "_isWeaponsAAAssistant",
	"_isSniper", "_isSpotter",
	"_isMMG", "_isMMGAsst",

	"_ret",

	"_factionID", "_factionName", "_factionStructure", "_factionCallsigns",
	"_defaultName", "_defaultSide", "_defaultVoice", "_defaultFace", "_defaultInsignia", "_defaultColor",

	"_factionSkill", "_factionUnits", "_factionVehicles", "_factionObjects", "_factionDACCamps",

	"_randomLIST","_rifleLIST",
	"_commonRIFLE", "_countRifle", "_countRifleLOW", "_countTracerRIFLE", "_countRifleCARGO",
	"_reconRIFLE",
	"_commonRIFLEGL", "_count40mm", "_count40mmCARGO",
	"_commonPistol", "_countPISTOL", "_countPistolCARGO",
	"_commonAR", "_countAR", "_countArCARGO",
	"_commonMG", "_countMG", "_countMgCARGO", "_countTracerMG",
	"_commonMarksman",
	"_commonSniper", "_countSniper", "_countSniperCARGO",
	"_commonAT", "_countAT", "_countATCARGO", "_isCommonATDisposable",
	"_specAT", "_countSpecATCARGO", "_isSpecATDisposable",
	"_commonSMG",
	"_commonGL",
	"_weaponsAA", "_countWeaponsAA", "_countWeaponsAACARGO",
	"_weaponsAT", "_countWeaponsAT", "_countWeaponsATCARGO",

	"_commonRCO", "_commonCCO","_commonEOT", "_commonMAGNIFIED","_marksmanSCOPE","_specATSCOPE",
	"_commonSUPPRESSOR", "_commonPISTOLSUPPRESSOR",
	"_commonRAIL","_commonBIPOD",

	"_rifleSCOPE","_mgSCOPE","_reconSCOPE",

	"_binoc","_rangefinder","_laserdesignator",

	"_countGRENADES", "_countGrenadesCARGO",

	"_countHE",

	"_commonHEAD", "_leaderHEAD", "_officerHEAD", "_medicHEAD", "_crewmanHEAD", "_pilotHEAD", "_helicrewHEAD", "_helipilotHEAD", "_sniperHEAD", "_demoHEAD", "_reconHEAD",
	"_commonUNIFORM", "_officerUNIFORM", "_pilotUNIFORM", "_sniperUNIFORM", "_marksmanUNIFORM", "_helicrewUNIFORM", "_crewUNIFORM", "_mgUNIFORM", "_medicUNIFORM", "_demoUNIFORM", "_reconUNIFORM",
	"_commonVEST", "_officerVEST", "_ftlVEST", "_slVEST","_mgVEST", "_grenadierVEST", "_medicVEST", "_demoVEST", "_marksmanVEST", "_reconVEST","_pilotVEST",
	"_commonBACKPACK", "_bigBACKPACK","_medicalBACKPACK","_specATBACKPACK","_reconBACKPACK",

	"_StaticAT", "_ATTripod",
	"_HMG", "_HMGTripod",
	"_mortar", "_mortarTripod",

	"_UAVBag", "_UAVTerminal",

	"_wsmoke", "_gsmoke", "_rsmoke",
	"_wFLARE", "_rFLARE", "_gFLARE", "_yFLARE",

	"_bandage", "_countBANDAGE", "_countBandageCARGO",
	"_fieldDressing", "_packingBandage", "_elasticBandage", "_quickClot",
	"_tourniquet", "_countTourniquet", "_countTourniquetCARGO",
	"_splint", "_countSplint", "_countSplintCARGO",

	"_morphine", "_countMORPHINE", "_countMorphineCARGO",
	"_atropine", "_adenosine",
	"_epi", "_countEPI", "_countEpiCARGO",

	"_bloodbag", "_countBLOODBAG", "_countBloodbagCARGO",
	"_blood1000", "_blood500", "_blood250", "_plasma1000", "_plasma500", "_plasma250", "_saline1000", "_saline500", "_saline250",
	"_bodyBag",

	"_personalAidKit", "_countPAK", "_countPAKCARGO",

	"_cableTie", "_earPlugs", "_flashlight", "_mapTools", "_spareBarrel", "_IRStrobe", "_uavBattery", "_microDAGR",
	"_clacker", "_M26clacker", "_deadManSwitch", "_cellphone", "_defusalKit",
	"_spottingScope", "_rangeCard", "_kestrel", "_ATragMX",
	"_surgKit",

	"_NVG",
	"_NVGEN1", "_NVGEN2", "_NVGEN4", "_NVWIDE",

	"_nightOnlyNVGs",

	"_aiBackpackRadios",

	"_suppliesNORMAL", "_suppliesMEDIC",

	// Deprecated
	"_countCAT", "_defib", "_isATDisposable", "_atrophine", "_earBuds",

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
