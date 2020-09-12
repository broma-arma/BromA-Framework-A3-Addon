switch (toUpper(_faction)) do {
    case "PMC": {
        #include "factions\pmc.sqf";
    };
    case "NAPA": {
        #include "factions\napa.sqf"
    };
    case "GERMAN": {
        #include "factions\german.sqf"
    };
    case "RACS": {
        #include "factions\racs.sqf"
    };
    case "76TH": {
        #include "factions\76TH.sqf"
    };
    case "PLA": {
        #include "factions\PLA.sqf"
    };
    case "SLA": {
        #include "factions\sla.sqf"
    };

    case "MUJAHIDEEN": {
        #include "factions\mujahideen.sqf"
    };

    case "ISIS": {
        #include "factions\isis.sqf"
    };

    case "CHEDAKI": {
        #include "factions\chedaki.sqf"
    };

    case "USARMY": {
	#include "factions\usarmy.sqf"
    };

    case "MARINES": {
        #include "factions\marines.sqf"
    };

    case "VDV": {
        #include "factions\vdv.sqf"
    };

    case "IONPMC": {
        #include "factions\ionpmc.sqf"
    };

    case "TKMILITIA": {
        #include "factions\tkmilitia.sqf"
    };

    case "ANA": {
        #include "factions\ana.sqf"
    };

    case "FINNS": {
        #include "factions\finns.sqf"
    };

    case "CSAT": {
        #include "factions\csat.sqf"
    };

    case "NATO": {
        #include "factions\nato.sqf"
    };

    case "NATOP": {
        #include "factions\natop.sqf"
    };

    case "AAF": {
        #include "factions\aaf.sqf"
    };

    case "FIA": {
        #include "factions\fia.sqf"
    };

    case "AHKMA-PMC": {
        #include "factions\ahkma-pmc.sqf"
    };

    case "SPRG": {
        #include "factions\sprg-report.sqf"
    };

    case "NORSF": {
        #include "factions\norsf.sqf"
    };

    case "MOLATIAN": {
        #include "factions\molatian.sqf"
    };

    case "UN": {
        #include "factions\un.sqf"
    };

    case "TKARMY": {
        #include "factions\tkarmy.sqf"
    };

    case "RUSSIA": {
        #include "factions\russia.sqf"
    };

    case "CDF": {
        #include "factions\cdf.sqf"
    };

    case "BAF": {
        #include "factions\baf.sqf"
    };

    case "OFPFIA": {
        #include "factions\ofpfia.sqf"
    };

    case "AFRENIAN": {
        #include "factions\afrenian.sqf"
    };

    case "EMPIRE": {
        #include "factions\empire.sqf"
    };

    case "UNION": {
        #include "factions\union.sqf"
    };

    case "JSDF": {
        #include "factions\jsdf.sqf"
    };

    case "FRWINTER": {
        #include "factions\frwinter.sqf"
    };

    case "FRANCE": {
        #include "factions\frwood.sqf"
    };

    case "MEC": {
        #include "factions\mec.sqf"
    };

    case "USFS": {
        #include "factions\usarmyfuture.sqf"
    };

    case "RUSSIA_AFGHAN": {
        #include "factions\russia-afghan.sqf"
    };

    case "ANZAC": {
        #include "factions\anzac.sqf";
    };
    case "LINGOR_REBELS": {
        #include "factions\lingorrebels.sqf";
    };
 	case "LINGOR_ARMY": {
        #include "factions\lingorarmy.sqf";
    };
 	case "AFRICAN_REBELS": {
        #include "factions\africanrebels.sqf";
    };
 	case "AFRICAN_ARMY": {
        #include "factions\africanarmy.sqf";
    };
 	case "YUGO": {
        #include "factions\yugo.sqf";
    };

    case "DEFAULT": {
        #include "factions\template.sqf"
    };

    default {
        #include "factions\template.sqf"
    };
};
