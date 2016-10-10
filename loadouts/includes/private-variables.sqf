
private [
    "_unit","_type","_cond","_done","_defaultName", "_defaultColor", "_doFirstName","_doLastName",
    "_doFinalName", "_defaultInsignia", "_isMan", "_factionObjects", "_factionDACCamps",
    "_defaultSide","_commonRIFLE","_commonRIFLEGL","_commonPISTOL","_commonMG", "_factionName",
    "_factionID", "_factionCallsigns", "_factionVehicles", "_factionSkill", "_defaultFace", "_defaultVoice",
    "_factionStructure", "_countTracerRIFLE", "_countTracerMG", "_StaticAT",
    "_commonVEST", "_commonRIFLE", "_commonRIFLEGL", "_commonPISTOL", "_UAVBag", "_UAVTerminal",
    "_commonMG", "_commonMARKSMAN", "_commonSNIPER", "_commonAT", "_specAT",
    "_commonSMG","_commonRCO", "_commonCCO", "_commonMAGNIFIED", "_commonSUPPRESSOR",
    "_commonPISTOLSUPPRESSOR", "_NVG", "_countRIFLE", "_countRIFLELOW", "_countPISTOL",
    "_countMG", "_countSNIPER", "_countAT", "_countGRENADES", "_count40mm", "_countRifleCARGO",
    "_commonRifleATTACHMENTS", "_commonHandgunATTACHMENTS", "_commonMGATTACHMENTS",
    "_commonMarksmanATTACHMENTS", "_commonSniperATTACHMENTS", "_commonSpecATATTACHMENTS",
    "_commonRifleGLATTACHMENTS", "_commonSMGATTACHMENTS",
    "_countPistolCARGO", "_countMgCARGO", "_countSniperCARGO", "_countATCARGO",
    "_countGrenadesCARGO", "_count40mmCARGO", "_commonHEAD", "_leaderHEAD",
    "_officerHEAD", "_medicHEAD", "_crewmanHEAD", "_pilotHEAD", "_helicrewHEAD",
    "_helipilotHEAD", "_sniperHEAD", "_demoHEAD", "_reconHEAD", "_commonUNIFORM",
    "_officerUNIFORM", "_pilotUNIFORM", "_sniperUNIFORM", "_marksmanUNIFORM",
    "_countPAKCARGO", "_countPAK", "_commonMMG", "_countMMGCARGO", "_countMMG",
    "_helicrewUNIFORM", "_crewUNIFORM", "_mgUNIFORM", "_medicUNIFORM", "_demoUNIFORM",
    "_reconUNIFORM", "_commonVEST", "_officerVEST", "_ftlVEST", "_slVEST", "_mgVEST",
    "_grenadierVEST", "_medicVEST", "_demoVEST", "_marksmanVEST", "_reconVEST",
    "_commonBACKPACK", "_bigBACKPACK", "_HMG", "_tripod", "_mortar", "_mortarTripod",
    "_commonMARKSMAN","_commonSNIPER","_commonAT","_specAT","_commonSMG","_commonBACKPACK",
    "_commonRCO","_commonCCO","_commonMAGNIFIED","_NVG","_countRifleCARGO", "_countPistolCARGO",
    "_countMgCARGO", "_countSniperCARGO", "_countATCARGO", "_countGrenadesCARGO", "_count40mmCARGO",
    "_countMorphineCARGO", "_countEpiCARGO", "_countBloodbagCARGO",
    "_isLeader","_bandage","_morphine","_epi","_bloodbag","_radio","_medkit","_wsmoke","_gsmoke","_rsmoke",
    "_backpack","_addBinocs","_addRadio","_addAmmo","_addWeapon","_wep","_ammoamount","_isMan",
    "_fieldDressing", "_packingBandage", "_elasticBandage","_quickClot", "_personalAidKit",
    "_tourniquet", "_atrophine", "_saline1000", "_saline500", "_saline250","_blood1000",
    "_blood500", "_blood250", "_plasma1000", "_plasma500", "_plasma250", "_surgKit", "_bodyBag",
    "_wFLARE", "_rFLARE", "_gFLARE", "_yFLARE", "_cableTie", "_uavBattery", "_mapTools", "_flashlight",
    "_spareBarrel", "_kestrel", "_IRStrobe", "_clacker", "_M26clacker", "_defusalKit","_defib",
    "_deadManSwitch", "_earBuds", "_cellphone", "_microDAGR", "_NVGEN1", "_NVGEN2",
    "_NVGEN4", "_NVWIDE", "_suppliesMEDIC", "_suppliesNORMAL", "_countBANDAGE",
    "_countMORPHINE", "_countEPI", "_countBLOODBAG", "_countBandageCARGO",
    "_countMorphineCARGO", "_countEpiCARGO", "_countBloodbagCARGO", "_countBANDAGEPACKING"
];

#define GUN 0
#define RAMMO 1
#define GL 2

#define CCO 0
#define RCO 1
#define RAIL 2
#define BIPOD 3

_defaultCallsignBLUFOR =
["Zero",
"Alpha", "Bravo", "Charlie", "Delta",
"Razor", "Sierra", "Wizard", "Shocker", "Paradise", "Meteor", "Lancer", "Titan", "Havoc", "Pegasus"];

_defaultCallsignOPFOR =
["Godfather",
"Anaconda", "Boa", "Cobra", "Dragon",
"Raven", "Scorpion", "Weasel", "Sparrow", "Pelican", "Moose", "Lion", "Tiger", "Hawk", "Phoenix"];

_defaultCallsignINDFOR =
["Papa",
"Anna", "Beatrice", "Clara", "Denise",
"Rose", "Sarah", "Whitney", "Shirley", "Penny", "Mary", "Lucy", "Tanya", "Helen", "Petunia"];