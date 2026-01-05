// AMMUNITION - copyToClipboard ("getNumber (_x >> 'scope') == 2 && !(configName _x isKindOf ['VehicleMagazine', configfile >> 'CfgMagazines'])" configClasses (configfile >> "CfgMagazines") apply { private _dlcInfo = getAssetDLCInfo [configName _x, configfile >> "CfgMagazines"]; format ["""%1""; // %2 - %3%4 %5", configName _x, getText (_x >> "displayName"), ["", format ["%2 (%1), ", _dlcInfo#4, _dlcInfo#5]] select _dlcInfo#0, configSourceModList _x, configName _x call BIS_fnc_itemType] } joinString toString [13])
private _30rnd556     = "30Rnd_556x45_Stanag"; // 5.56 mm 30rnd Reload Tracer (Yellow) Mag
//"30Rnd_556x45_Stanag_green"; // 5.56 mm 30rnd Reload Tracer (Green) Mag
//"30Rnd_556x45_Stanag_red"; // 5.56 mm 30rnd Reload Tracer (Red) Mag
//"30Rnd_556x45_Stanag_Tracer_Red"; // 5.56 mm 30rnd Tracer (Red) Mag
//"30Rnd_556x45_Stanag_Tracer_Green"; // 5.56 mm 30rnd Tracer (Green) Mag
//"30Rnd_556x45_Stanag_Tracer_Yellow"; // 5.56 mm 30rnd Tracer (Yellow) Mag
//"30Rnd_556x45_Stanag_Sand"; // 5.56 mm 30rnd Reload Tracer (Yellow) Sand Mag
//"30Rnd_556x45_Stanag_Sand_green"; // 5.56 mm 30rnd Reload Tracer (Green) Sand Mag
//"30Rnd_556x45_Stanag_Sand_red"; // 5.56 mm 30rnd Reload Tracer (Red) Sand Mag
//"30Rnd_556x45_Stanag_Sand_Tracer_Red"; // 5.56 mm 30rnd Tracer (Red) Sand Mag
//"30Rnd_556x45_Stanag_Sand_Tracer_Green"; // 5.56 mm 30rnd Tracer (Green) Sand Mag
//"30Rnd_556x45_Stanag_Sand_Tracer_Yellow"; // 5.56 mm 30rnd Tracer (Yellow) Sand Mag
private _20rndUW      = "20Rnd_556x45_UW_mag"; // 5.56 mm 20Rnd Dual Purpose Mag
private _30rnd65red   = "30Rnd_65x39_caseless_mag"; // 6.5 mm 30Rnd Sand Mag
//"30Rnd_65x39_caseless_khaki_mag"; // 6.5 mm 30Rnd Khaki Mag
//"30Rnd_65x39_caseless_black_mag"; // 6.5 mm 30Rnd Black Mag
private _30rnd65green = "30Rnd_65x39_caseless_green"; // 6.5 mm 30Rnd Caseless Mag
//"30Rnd_65x39_caseless_mag_Tracer"; // 6.5 mm 30Rnd Tracer Sand Mag
//"30Rnd_65x39_caseless_khaki_mag_Tracer"; // 6.5 mm 30Rnd Tracer Khaki Mag
//"30Rnd_65x39_caseless_black_mag_Tracer"; // 6.5 mm 30Rnd Tracer Black Mag
//"30Rnd_65x39_caseless_green_mag_Tracer"; // 6.5 mm 30Rnd Tracer (Green) Caseless Mag
private _20rnd762     = "20Rnd_762x51_Mag"; // 7.62 mm 20Rnd Mag
//"7Rnd_408_Mag"; // .408 7Rnd LRR Mag
private _5rnd127      = "5Rnd_127x108_Mag"; // 12.7 mm 5Rnd Mag
private _100rnd65     = "100Rnd_65x39_caseless_mag"; // 6.5 mm 100Rnd Sand Mag
//"100Rnd_65x39_caseless_khaki_mag"; // 6.5 mm 100Rnd Khaki Mag
//"100Rnd_65x39_caseless_black_mag"; // 6.5 mm 100Rnd Black Mag
//"100Rnd_65x39_caseless_mag_Tracer"; // 6.5 mm 100Rnd Tracer Sand Mag
//"100Rnd_65x39_caseless_khaki_mag_tracer"; // 6.5 mm 100Rnd Tracer Khaki Mag
//"100Rnd_65x39_caseless_black_mag_tracer"; // 6.5 mm 100Rnd Tracer Black Mag
private _200rnd65     = "200Rnd_65x39_cased_Box"; // 6.5 mm 200Rnd Belt
//"200Rnd_65x39_cased_Box_Tracer"; // 6.5 mm 200Rnd Belt Tracer (Yellow)
//"200Rnd_65x39_cased_Box_Red"; // 6.5 mm 200Rnd Reload Tracer (Red) Belt
//"200Rnd_65x39_cased_Box_Tracer_Red"; // 6.5mm 200Rnd Belt Tracer (Red)
private _30rnd9mm     = "30Rnd_9x21_Mag"; // 9 mm 30Rnd Mag
//"30Rnd_9x21_Red_Mag"; // 9 mm 30Rnd Reload Tracer (Red) Mag
//"30Rnd_9x21_Yellow_Mag"; // 9 mm 30Rnd Reload Tracer (Yellow) Mag
//"30Rnd_9x21_Green_Mag"; // 9 mm 30Rnd Reload Tracer (Green) Mag
//"16Rnd_9x21_Mag"; // 9 mm 16Rnd Mag
//"30Rnd_9x21_Mag_SMG_02"; // 9 mm 30Rnd Mag
//"30Rnd_9x21_Mag_SMG_02_Tracer_Red"; // 9 mm 30Rnd Reload Tracer (Red) Mag
//"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"; // 9 mm 30Rnd Reload Tracer (Yellow) Mag
//"30Rnd_9x21_Mag_SMG_02_Tracer_Green"; // 9 mm 30Rnd Reload Tracer (Green) Mag
//"16Rnd_9x21_red_Mag"; // 9 mm 16Rnd Reload Tracer (Red) Mag
//"16Rnd_9x21_green_Mag"; // 9 mm 16Rnd Reload Tracer (Green) Mag
//"16Rnd_9x21_yellow_Mag"; // 9 mm 16Rnd Reload Tracer (Yellow) Mag
private _30rndACP     = "30Rnd_45ACP_Mag_SMG_01"; // .45 ACP 30Rnd Vermin Mag
//"30Rnd_45ACP_Mag_SMG_01_Tracer_Green"; // .45 ACP 30Rnd Vermin Tracers (Green) Mag
//"30Rnd_45ACP_Mag_SMG_01_Tracer_Red"; // .45 ACP 30Rnd Vermin Tracers (Red) Mag
//"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow"; // .45 ACP 30Rnd Vermin Tracers (Yellow) Mag
//"9Rnd_45ACP_Mag"; // .45 ACP 9Rnd Mag
private _150rnd762    = "150Rnd_762x51_Box"; // 7.62 mm 150Rnd Box
//"150Rnd_762x51_Box_Tracer"; // 7.62 mm 150Rnd Tracer (Green) Box
//"150Rnd_762x54_Box"; // 7.62 mm 150Rnd Box
//"150Rnd_762x54_Box_Tracer"; // 7.62 mm 150Rnd Tracer (Green) Box
//"11Rnd_45ACP_Mag"; // .45 ACP 11Rnd Mag
//"6Rnd_45ACP_Cylinder"; // .45 ACP 6Rnd Cylinder
//"10Rnd_762x51_Mag"; // 7.62 mm 10Rnd Mag
private _10rnd762     = "10Rnd_762x54_Mag"; // 7.62 mm 10Rnd Mag
//"5Rnd_127x108_APDS_Mag"; // 12.7 mm 5Rnd APDS Mag
//"50Rnd_570x28_SMG_03"; // 5.7 mm 50Rnd ADR-97 Mag

// Kart
//"6Rnd_GreenSignal_F"; // 6Rnd Signal Cylinder (Green)
//"6Rnd_RedSignal_F"; // 6Rnd Signal Cylinder (Red)

// Mark
//"10Rnd_338_Mag"; // .338 LM 10Rnd Mag
//"130Rnd_338_Mag"; // .338 NM 130Rnd Belt
//"10Rnd_127x54_Mag"; // 12.7 mm 10Rnd Mag
//"150Rnd_93x64_Mag"; // 9.3mm 150Rnd Belt
//"10Rnd_93x64_DMR_05_Mag"; // 9.3 mm 10Rnd Mag

// Expansion
//"10Rnd_9x21_Mag"; // 9 mm 10Rnd Mag
private _30rnd580     = "30Rnd_580x42_Mag_F"; // 5.8 mm 30Rnd Mag
//"30Rnd_580x42_Mag_Tracer_F"; // 5.8 mm 30Rnd Tracer (Green) Mag
private _100rnd580    = "100Rnd_580x42_Mag_F"; // 5.8 mm 100Rnd Mag
//"100Rnd_580x42_Mag_Tracer_F"; // 5.8 mm 100Rnd Tracer (Green) Mag
//"100Rnd_580x42_hex_Mag_F"; // 5.8 mm 100Rnd Hex Mag
//"100Rnd_580x42_hex_Mag_Tracer_F"; // 5.8 mm 100Rnd Tracer (Green) Hex Mag
//"100Rnd_580x42_ghex_Mag_F"; // 5.8 mm 100Rnd Green Hex Mag
//"100Rnd_580x42_ghex_Mag_Tracer_F"; // 5.8 mm 100Rnd Tracer (Green) Green Hex Mag
private _20rnd650     = "20Rnd_650x39_Cased_Mag_F"; // 6.5 mm 20Rnd Mag
//"10Rnd_50BW_Mag_F"; // .50 BW 10Rnd Caseless Mag
private _150rnd556    = "150Rnd_556x45_Drum_Mag_F"; // 5.56 mm 150Rnd Mag
//"150Rnd_556x45_Drum_Sand_Mag_F"; // 5.56 mm 150Rnd Sand Mag
//"150Rnd_556x45_Drum_Sand_Mag_Tracer_F"; // 5.56 mm 150Rnd Tracer (Red) Sand Mag
//"150Rnd_556x45_Drum_Green_Mag_F"; // 5.56 mm 150Rnd Green Mag
//"150Rnd_556x45_Drum_Green_Mag_Tracer_F"; // 5.56 mm 150Rnd Tracer (Red) Green Mag
//"150Rnd_556x45_Drum_Mag_Tracer_F"; // 5.56 mm 150Rnd Tracer (Red) Mag
private _30rnd762     = "30Rnd_762x39_Mag_F"; // 7.62 mm 30Rnd AKM Reload Tracer (Yellow) Mag
//"30Rnd_762x39_Mag_Green_F"; // 7.62 mm 30Rnd AKM Reload Tracer (Green) Mag
//"30Rnd_762x39_Mag_Tracer_F"; // 7.62 mm 30Rnd AKM Tracer (Yellow) Mag
//"30Rnd_762x39_Mag_Tracer_Green_F"; // 7.62 mm 30Rnd AKM Tracer (Green) Mag
private _30rnd762AK12 = "30Rnd_762x39_AK12_Mag_F"; // 7.62 mm 30rnd AK12 Mag
//"30Rnd_762x39_AK12_Mag_Tracer_F"; // 7.62 mm 30rnd AK12 Tracer Mag
private _30rnd545     = "30Rnd_545x39_Mag_F"; // 5.45 mm 30Rnd Reload Tracer (Yellow) Mag
//"30Rnd_545x39_Mag_Green_F"; // 5.45 mm 30Rnd Reload Tracer (Green) Mag
//"30Rnd_545x39_Mag_Tracer_F"; // 5.45 mm 30Rnd Tracer (Yellow) Mag
//"30Rnd_545x39_Mag_Tracer_Green_F"; // 5.45 mm 30Rnd Tracer (Green) Mag
private _200rnd556    = "200Rnd_556x45_Box_F"; // 5.56 mm 200Rnd Reload Tracer (Yellow) Box
//"200Rnd_556x45_Box_Red_F"; // 5.56 mm 200Rnd Reload Tracer (Red) Box
//"200Rnd_556x45_Box_Tracer_F"; // 5.56 mm 200Rnd Tracer (Yellow) Box
//"200Rnd_556x45_Box_Tracer_Red_F"; // 5.56 mm 200Rnd Tracer (Red) Box

// Enoch
private _75rnd762         = "75Rnd_762x39_Mag_F"; // 7.62 mm 75Rnd AKM Mag
//"75Rnd_762x39_Mag_Tracer_F"; // 7.62 mm 75Rnd AKM Tracer Mag
private _30rnd762AK12Lush = "30rnd_762x39_AK12_Lush_Mag_F"; // 7.62 mm 30rnd AK12 Khaki Mag
//"30rnd_762x39_AK12_Lush_Mag_Tracer_F"; // 7.62 mm 30rnd AK12 Tracer Khaki Mag
private _30rnd762AK12Arid = "30rnd_762x39_AK12_Arid_Mag_F"; // 7.62 mm 30rnd AK12 Sand Mag
//"30rnd_762x39_AK12_Arid_Mag_Tracer_F"; // 7.62 mm 30rnd AK12 Tracer Sand Mag
private _75rnd762AK12     = "75rnd_762x39_AK12_Mag_F"; // 7.62 mm 75rnd AK12 Mag
//"75rnd_762x39_AK12_Mag_Tracer_F"; // 7.62 mm 75rnd AK12 Tracer Mag
private _75rnd762AK12Lush = "75rnd_762x39_AK12_Lush_Mag_F"; // 7.62 mm 75rnd AK12 Lush Mag
//"75rnd_762x39_AK12_Lush_Mag_Tracer_F"; // 7.62 mm 75rnd AK12 Tracer Lush Mag
private _75rnd762AK12Arid = "75rnd_762x39_AK12_Arid_Mag_F"; // 7.62 mm 75rnd AK12 Arid Mag
//"75rnd_762x39_AK12_Arid_Mag_Tracer_F"; // 7.62 mm 75rnd AK12 Tracer Arid Mag
private _10rnd762Mk14     = "10Rnd_Mk14_762x51_Mag"; // 7.62 mm 10rnd Mk14 Mag
private _30rnd65Promet    = "30Rnd_65x39_caseless_msbs_mag"; // 6.5 mm 30Rnd Promet Mag
//"30Rnd_65x39_caseless_msbs_mag_Tracer"; // 6.5 mm 30Rnd Promet Tracer Mag
private _2rnd12G00Buck    = "2Rnd_12Gauge_Pellets"; // 12 Gauge 2Rnd Pellets
private _2rnd12GSlug      = "2Rnd_12Gauge_Slug"; // 12 Gauge 2Rnd Slug
private _6rnd12G00Buck    = "6Rnd_12Gauge_Pellets"; // 12 Gauge 6Rnd Pellets
private _6rnd12GSlug      = "6Rnd_12Gauge_Slug"; // 12 Gauge 6Rnd Slug

//"FlareWhite_F"; // Flare (White)
//"FlareGreen_F"; // Flare (Green)
//"FlareRed_F"; // Flare (Red)
//"FlareYellow_F"; // Flare (Yellow)
//"Titan_AA"; // Titan AA Missile
//"Titan_AP"; // Titan AP Missile
//"Titan_AT"; // Titan AT Missile
//"RPG32_F"; // RPG-42 Rocket
//"RPG32_HE_F"; // RPG-42 HE Rocket
//"NLAW_F"; // PCML Missile

// Tank
//"Vorona_HEAT"; // 9M135 HEAT Missile
//"Vorona_HE"; // 9M135 HE Missile
//"MRAWS_HEAT_F"; // MAAWS HEAT 75 Round
//"MRAWS_HE_F"; // MAAWS HE 44 Round
//"MRAWS_HEAT55_F"; // MAAWS HEAT 55 Round
//"O_R_IR_Grenade"; // IR Grenade [Spetsnaz]

// Enoch
//"I_E_IR_Grenade"; // IR Grenade [LDF]

// DLC Exclusive
//  Apex
//"RPG7_F"; // PG-7VM HEAT Grenade
//  Laws of War
//"APERSMineDispenser_Mag"; // APERS Mine Dispenser
//"TrainingMine_Mag"; // Training Mine

private _40mm        = "1Rnd_HE_Grenade_shell"; // 40 mm HE Grenade Round
private _40mmSwhite  = "1Rnd_Smoke_Grenade_shell"; // Smoke Round (White)
private _40mmSred    = "1Rnd_SmokeRed_Grenade_shell"; // Smoke Round (Red)
private _40mmSgreen  = "1Rnd_SmokeGreen_Grenade_shell"; // Smoke Round (Green)
private _40mmSyellow = "1Rnd_SmokeYellow_Grenade_shell"; // Smoke Round (Yellow)
private _40mmSpurple = "1Rnd_SmokePurple_Grenade_shell"; // Smoke Round (Purple)
private _40mmSblue   = "1Rnd_SmokeBlue_Grenade_shell"; // Smoke Round (Blue)
private _40mmSorange = "1Rnd_SmokeOrange_Grenade_shell"; // Smoke Round (Orange)

private _40mm3        = "3Rnd_HE_Grenade_shell"; // 40 mm 3Rnd HE Grenade
private _40mm3Swhite  = "3Rnd_Smoke_Grenade_shell"; // 3Rnd 3GL Smoke Rounds (White)
private _40mm3Sred    = "3Rnd_SmokeRed_Grenade_shell"; // 3Rnd 3GL Smoke Rounds (Red)
private _40mm3Sgreen  = "3Rnd_SmokeGreen_Grenade_shell"; // 3Rnd 3GL Smoke Rounds (Green)
private _40mm3Syellow = "3Rnd_SmokeYellow_Grenade_shell"; // 3Rnd 3GL Smoke Rounds (Yellow)
private _40mm3Spurple = "3Rnd_SmokePurple_Grenade_shell"; // 3Rnd 3GL Smoke Rounds (Purple)
private _40mm3Sblue   = "3Rnd_SmokeBlue_Grenade_shell"; // 3Rnd 3GL Smoke Rounds (Blue)
private _40mm3Sorange = "3Rnd_SmokeOrange_Grenade_shell"; // 3Rnd 3GL Smoke Rounds (Orange)

private _40mmFwhite  = "UGL_FlareWhite_F"; // Flare Round (White)
private _40mmFred    = "UGL_FlareRed_F"; // Flare Round (Red)
private _40mmFgreen  = "UGL_FlareGreen_F"; // Flare Round (Green)
private _40mmFyellow = "UGL_FlareYellow_F"; // Flare Round (Yellow)
private _40mmFir     = "UGL_FlareCIR_F"; // Flare Round (IR)

private _40mm3Fwhite  = "3Rnd_UGL_FlareWhite_F"; // 3Rnd 3GL Flares (White)
private _40mm3Fred    = "3Rnd_UGL_FlareRed_F"; // 3Rnd 3GL Flares (Red)
private _40mm3Fgreen  = "3Rnd_UGL_FlareGreen_F"; // 3Rnd 3GL Flares (Green)
private _40mm3Fyellow = "3Rnd_UGL_FlareYellow_F"; // 3Rnd 3GL Flares (Yellow)
private _40mm3Fir     = "3Rnd_UGL_FlareCIR_F"; // 3Rnd 3GL Flares (IR)

private _40mmIwhite   = "UGL_FlareWhite_Illumination_F"; // Illumination Round (White)
private _40mmIred     = "UGL_FlareRed_Illumination_F"; // Illumination Round (Red)
private _40mmIgreen   = "UGL_FlareGreen_Illumination_F"; // Illumination Round (Green)
private _40mmIyellow  = "UGL_FlareYellow_Illumination_F"; // Illumination Round (Yellow)
private _40mmIir      = "";

// Rifle - copyToClipboard ("getNumber (_x >> 'scope') == 2 && configName _x call BIS_fnc_itemType select 0 == 'Weapon' && { !isClass (_x >> 'LinkedItems') || getText (_x >> 'baseWeapon') == configName _x }" configClasses (configfile >> "CfgWeapons") apply { private _dlcInfo = getAssetDLCInfo [configName _x, configfile >> "CfgWeapons"]; format ["""%1""; // %2 - %3%4 %5", configName _x, getText (_x >> "displayName"), ["", format ["%2 (%1), ", _dlcInfo#4, _dlcInfo#5]] select _dlcInfo#0, configSourceModList _x, configName _x call BIS_fnc_itemType] } joinString toString [13])
private _Katiba     = ["arifle_Katiba_F",        _30rnd65green]; // Katiba 6.5 mm
private _KatibaC    = ["arifle_Katiba_C_F",      _30rnd65green]; // Katiba Carbine 6.5 mm
private _KatibaGL   = ["arifle_Katiba_GL_F",     _30rnd65green, _40mm]; // Katiba GL 6.5 mm
private _Mk20Camo   = ["arifle_Mk20_F",          _30rnd556]; // Mk20 5.56 mm (Camo)
private _Mk20       = ["arifle_Mk20_plain_F",    _30rnd556]; // Mk20 5.56 mm
private _Mk20CCamo  = ["arifle_Mk20C_F",         _30rnd556]; // Mk20C 5.56 mm (Camo)
private _Mk20C      = ["arifle_Mk20C_plain_F",   _30rnd556]; // Mk20C 5.56 mm
private _Mk20GLCamo = ["arifle_Mk20_GL_F",       _30rnd556, _40mm]; // Mk20 EGLM 5.56 mm (Camo)
private _Mk20GL     = ["arifle_Mk20_GL_plain_F", _30rnd556, _40mm]; // Mk20 EGLM 5.56 mm
private _MXC        = ["arifle_MXC_F",           _30rnd65red]; // MXC 6.5 mm
private _MX         = ["arifle_MX_F",            _30rnd65red]; // MX 6.5 mm
private _MXGL       = ["arifle_MX_GL_F",         _30rnd65red, _40mm]; // MX 3GL 6.5 mm
private _MXM        = ["arifle_MXM_F",           _30rnd65red]; // MXM 6.5 mm
private _MXCBlack   = ["arifle_MXC_Black_F",     _30rnd65red]; // MXC 6.5 mm (Black)
private _MXBlack    = ["arifle_MX_Black_F",      _30rnd65red]; // MX 6.5 mm (Black)
private _MXGLBlack  = ["arifle_MX_GL_Black_F",   _30rnd65red, _40mm]; // MX 3GL 6.5 mm (Black)
private _MXMBlack   = ["arifle_MXM_Black_F",     _30rnd65red]; // MXM 6.5 mm (Black)
private _SDAR       = ["arifle_SDAR_F",          _20rndUW]; // SDAR 5.56 mm
//"arifle_TRG21_F"; // TRG-21 5.56 mm
private _TRG        = ["arifle_TRG20_F",         _30rnd556]; // TRG-20 5.56 mm
private _TRGGL      = ["arifle_TRG21_GL_F",      _30rnd556, _40mm]; // TRG-21 EGLM 5.56 mm
private _PDW        = ["hgun_PDW2000_F",         _30rnd9mm]; // PDW2000 9 mm
//"SMG_03_TR_black"; // ADR-97 TR 5.7 mm (Black)
//"SMG_03_TR_camo"; // ADR-97 TR 5.7 mm (Camo)
//"SMG_03_TR_khaki"; // ADR-97 TR 5.7 mm (Khaki)
//"SMG_03_TR_hex"; // ADR-97 TR 5.7 mm (Hex)
//"SMG_03C_TR_black"; // ADR-97C TR 5.7 mm (Black)
//"SMG_03C_TR_camo"; // ADR-97C TR 5.7 mm (Camo)
//"SMG_03C_TR_khaki"; // ADR-97C TR 5.7 mm (Khaki)
//"SMG_03C_TR_hex"; // ADR-97C TR 5.7 mm (Hex)
//"SMG_03_black"; // ADR-97 5.7 mm (Black)
//"SMG_03_camo"; // ADR-97 5.7 mm (Camo)
//"SMG_03_khaki"; // ADR-97 5.7 mm (Khaki)
//"SMG_03_hex"; // ADR-97 5.7 mm (Hex)
//"SMG_03C_black"; // ADR-97C 5.7 mm (Black)
//"SMG_03C_camo"; // ADR-97C 5.7 mm (Camo)
//"SMG_03C_khaki"; // ADR-97C 5.7 mm (Khaki)
//"SMG_03C_hex"; // ADR-97C 5.7 mm (Hex)
//  Expansion
private _MXKhk      = ["arifle_MX_khk_F",        _30rnd65red]; // MX 6.5 mm (Khaki)
private _MXGLKhk    = ["arifle_MX_GL_khk_F",     _30rnd65red, _40mm]; // MX 3GL 6.5 mm (Khaki)
private _MXCKhk     = ["arifle_MXC_khk_F",       _30rnd65red]; // MXC 6.5 mm (Khaki)
private _MXMKhk     = ["arifle_MXM_khk_F",       _30rnd65red]; // MXM 6.5 mm (Khaki)

// SMG
private _Vermin = ["SMG_01_F", _30rndACP]; // Vermin SMG .45 ACP
private _Sting  = ["SMG_02_F", _30rnd9mm]; // Sting 9 mm

// Machine Gun
//  Mark
private _Mk200     = ["LMG_Mk200_F",          _200rnd65]; // Mk200 6.5 mm
private _Zafir     = ["LMG_Zafir_F",          "150Rnd_762x54_Box"]; // Zafir 7.62 mm
private _MXSW      = ["arifle_MX_SW_F",       _100rnd65]; // MX SW 6.5 mm
private _MXSWBlack = ["arifle_MX_SW_Black_F", _100rnd65]; // MX SW 6.5 mm (Black)
//  Expansion
private _MXSWKhk   = ["arifle_MX_SW_khk_F",   _100rnd65]; // MX SW 6.5 mm (Khaki)
//  Enoch
private _Mk200Blk  = ["LMG_Mk200_black_F",    _200rnd65]; // Mk200 6.5 mm (Black)

// Sniper Rifle
private _Rahim  = ["srifle_DMR_01_F",   _10rnd762]; // Rahim 7.62 mm
private _Mk18   = ["srifle_EBR_F",      _20rnd762]; // Mk18 ABR 7.62 mm
//  Mark
private _GM6    = ["srifle_GM6_F",      "5Rnd_127x108_APDS_Mag"]; // GM6 Lynx 12.7 mm
//"srifle_GM6_camo_F"; // GM6 Lynx 12.7 mm (Camo)
private _M200   = ["srifle_LRR_F",      "7Rnd_408_Mag"]; // M320 LRR .408
//"srifle_LRR_camo_F"; // M320 LRR .408 (Camo)
//  Expansion
private _M200G  = ["srifle_LRR_tna_F",  "7Rnd_408_Mag"]; // M320 LRR .408 (Tropic)
private _GM6Ghx = ["srifle_GM6_ghex_F", _5rnd127]; // GM6 Lynx 12.7 mm (Green Hex)

// Handgun
private _ACP45    = ["hgun_ACPC2_F",                 "9Rnd_45ACP_Mag"]; // ACP-C2 .45 ACP
private _P07      = ["hgun_P07_F",                   "16Rnd_9x21_Mag"]; // P07 9 mm
private _4Five    = ["hgun_Pistol_heavy_01_F",       "11Rnd_45ACP_Mag"]; // 4-five .45 ACP
private _Zubr     = ["hgun_Pistol_heavy_02_F",       "6Rnd_45ACP_Cylinder"]; // Zubr .45 ACP
private _Rook     = ["hgun_Rook40_F",                "16Rnd_9x21_Mag"]; // Rook-40 9 mm
//  Expansion
private _P07Khk   = ["hgun_P07_khk_F",               "16Rnd_9x21_Mag"]; // P07 9 mm (Khaki)
//"hgun_P07_blk_F"; // P07 9 mm (Black)
//  Enoch
private _4FiveGrn = ["hgun_Pistol_heavy_01_green_F", "11Rnd_45ACP_Mag"];

// Rocket Launcher
private _PCML     = ["launch_NLAW_F",        ["NLAW_F", ""] select isClass (configFile >> "CfgPatches" >> "ace_disposable")]; // PCML
private _RPG42    = ["launch_RPG32_F",       "RPG32_F"/*, "RPG32_HE_F"*/]; // RPG-42 Alamut
//  Expansion
private _RPG32Ghx = ["launch_RPG32_ghex_F",  "RPG32_F"/*, "RPG32_HE_F"*/]; // RPG-42 Alamut (Green Hex)
//  Tank
//"launch_MRAWS_olive_F"; // MAAWS Mk4 Mod 1 (Olive)
//"launch_MRAWS_olive_rail_F"; // MAAWS Mk4 Mod 0 (Olive)
//"launch_MRAWS_green_F"; // MAAWS Mk4 Mod 1 (Green)
//"launch_MRAWS_green_rail_F"; // MAAWS Mk4 Mod 0 (Green)
//"launch_MRAWS_sand_F"; // MAAWS Mk4 Mod 1 (Sand)
//"launch_MRAWS_sand_rail_F"; // MAAWS Mk4 Mod 0 (Sand)
//  Enoch
private _RPG42Grn = ["launch_RPG32_green_F", "RPG32_F"/*, "RPG32_HE_F"*/]; // RPG-42 (Green)

//  Missile Launcher
//"launch_B_Titan_F"; // Titan MPRL (Sand)
private _TitanAA  = ["launch_I_Titan_F",            "Titan_AA"]; // Titan MPRL (Digital)
//"launch_O_Titan_F"; // Titan MPRL (Hex)
//"launch_B_Titan_short_F"; // Titan MPRL Compact (Sand)
private _TitanAT  = ["launch_I_Titan_short_F",      "Titan_AT"/*, "Titan_AP"*/]; // Titan MPRL Compact (Olive)
//"launch_O_Titan_short_F"; // Titan MPRL Compact (Coyote)
//  Expansion
//"launch_B_Titan_tna_F"; // Titan MPRL (Tropic)
//"launch_B_Titan_short_tna_F"; // Titan MPRL Compact (Tropic)
//"launch_O_Titan_ghex_F"; // Titan MPRL (Green Hex)
private _TitanGhx = ["launch_O_Titan_short_ghex_F", "Titan_AT"/*, "Titan_AP"*/]; // Titan MPRL Compact (Green Hex)
//  Tank
//"launch_O_Vorona_brown_F"; // 9M135 Vorona (Brown)
//"launch_O_Vorona_green_F"; // 9M135 Vorona (Green)
//  Enoch
private _TitanAAGeo = ["launch_I_Titan_eaf_F",   "Titan_AA"]; // Titan MPRL (Geometric)
private _TitanAAOli = ["launch_B_Titan_olive_F", "Titan_AA"]; // Titan MPRL (Olive)

// DLC Exclusive
//  Rifle
//   Apex
private _AK12       = ["arifle_AK12_F",           _30rnd762AK12]; // AK-12 7.62 mm
private _AK12GL     = ["arifle_AK12_GL_F",        _30rnd762AK12, _40mm]; // AK-12 GL 7.62 mm
private _AKM        = ["arifle_AKM_F",            _30rnd762]; // AKM 7.62 mm
private _AK74U      = ["arifle_AKS_F",            _30rnd545]; // AKS-74U 5.45 mm
private _ARX        = ["arifle_ARX_blk_F",        _30rnd65green, "10Rnd_50BW_Mag_F"]; // Type 115 6.5 mm (Black)
private _ARXGhx     = ["arifle_ARX_ghex_F",       _30rnd65green, "10Rnd_50BW_Mag_F"]; // Type 115 6.5 mm (Green Hex)
private _ARXHex     = ["arifle_ARX_hex_F",        _30rnd65green, "10Rnd_50BW_Mag_F"]; // Type 115 6.5 mm (Hex)
private _CTAR       = ["arifle_CTAR_blk_F",       _30rnd580]; // CAR-95 5.8 mm (Black)
private _CTARHex    = ["arifle_CTAR_hex_F",       _30rnd580]; // CAR-95 5.8 mm (Hex)
private _CTARGhx    = ["arifle_CTAR_ghex_F",      _30rnd580]; // CAR-95 5.8 mm (Green Hex)
private _CTARGL     = ["arifle_CTAR_GL_blk_F",    _30rnd580, _40mm]; // CAR-95 GL 5.8 mm (Black)
private _CTARGLHex  = ["arifle_CTAR_GL_hex_F",    _30rnd580]; // CAR-95 GL 5.8 mm (Hex)
private _CTARGLGhx  = ["arifle_CTAR_GL_ghex_F",   _30rnd580]; // CAR-95 GL 5.8 mm (Green Hex)
private _CTARS      = ["arifle_CTARS_blk_F",      _100rnd580]; // CAR-95-1 5.8mm (Black)
private _CTARSHex   = ["arifle_CTARS_hex_F",      _100rnd580]; // CAR-95-1 5.8mm (Hex)
private _CTARSGhx   = ["arifle_CTARS_ghex_F",     _100rnd580]; // CAR-95-1 5.8mm (Green Hex)
private _SPAR       = ["arifle_SPAR_01_blk_F",    _30rnd556]; // SPAR-16 5.56 mm (Black)
private _SPARKhk    = ["arifle_SPAR_01_khk_F",    _30rnd556]; // SPAR-16 5.56 mm (Khaki)
private _SPARSnd    = ["arifle_SPAR_01_snd_F",    _30rnd556]; // SPAR-16 5.56 mm (Sand)
private _SPARGL     = ["arifle_SPAR_01_GL_blk_F", _30rnd556, _40mm]; // SPAR-16 GL 5.56 mm (Black)
private _SPARKhkGL  = ["arifle_SPAR_01_GL_khk_F", _30rnd556, _40mm]; // SPAR-16 GL 5.56 mm (Khaki)
private _SPARSndGL  = ["arifle_SPAR_01_GL_snd_F", _30rnd556, _40mm]; // SPAR-16 GL 5.56 mm (Sand)
private _AK12Lush   = ["arifle_AK12_lush_F",      _30rnd762AK12Lush]; // AK-12 7.62 mm (Lush)
private _AK12Arid   = ["arifle_AK12_arid_F",      _30rnd762AK12Arid]; // AK-12 7.62 mm (Arid)
private _AK12GLLush = ["arifle_AK12_GL_lush_F",   _30rnd762AK12Lush, _40mm]; // AK-12 GL 7.62 mm (Lush)
private _AK12GLArid = ["arifle_AK12_GL_arid_F",   _30rnd762AK12Arid, _40mm]; // AK-12 GL 7.62 mm (Arid)

//   Contact
//"arifle_RPK12_F"; // RPK-12 7.62 mm
//"arifle_RPK12_lush_F"; // RPK-12 7.62 mm (Lush)
//"arifle_RPK12_arid_F"; // RPK-12 7.62 mm (Arid)
private _AKU12         = ["arifle_AK12U_F",             _30rnd762AK12]; // AKU-12 7.62 mm
private _AKU12Lush     = ["arifle_AK12U_lush_F",        _30rnd762AK12Lush]; // AKU-12 7.62 mm (Lush)
private _AKU12Arid     = ["arifle_AK12U_arid_F",        _30rnd762AK12Arid]; // AKU-12 7.62 mm (Arid)
private _Promet        = ["arifle_MSBS65_F",            _30rnd65Promet]; // Promet 6.5 mm
private _PrometDMR     = ["arifle_MSBS65_Mark_F",       _30rnd65Promet]; // Promet MR 6.5 mm
private _PrometGL      = ["arifle_MSBS65_GL_F",         _30rnd65Promet, _40mm]; // Promet GL 6.5 mm
private _PrometSG      = ["arifle_MSBS65_UBS_F",        _30rnd65Promet, _6rnd12G00Buck]; // Promet SG 6.5 mm
private _PrometBlk     = ["arifle_MSBS65_black_F",      _30rnd65Promet]; // Promet 6.5 mm (Black)
private _PrometDMRBlk  = ["arifle_MSBS65_Mark_black_F", _30rnd65Promet]; // Promet MR 6.5 mm (Black)
private _PrometGLBlk   = ["arifle_MSBS65_GL_black_F",   _30rnd65Promet, _40mm]; // Promet GL 6.5 mm (Black)
private _PrometSGBlk   = ["arifle_MSBS65_UBS_black_F",  _30rnd65Promet, _6rnd12G00Buck]; // Promet SG 6.5 mm (Black)
private _PrometSand    = ["arifle_MSBS65_sand_F",       _30rnd65Promet]; // Promet 6.5 mm (Sand)
private _PrometDMRSand = ["arifle_MSBS65_Mark_sand_F",  _30rnd65Promet]; // Promet MR 6.5 mm (Sand)
private _PrometGLSand  = ["arifle_MSBS65_GL_sand_F",    _30rnd65Promet, _40mm]; // Promet GL 6.5 mm (Sand)
private _PrometSGSand  = ["arifle_MSBS65_UBS_sand_F",   _30rnd65Promet, _6rnd12G00Buck]; // Promet SG 6.5 mm (Sand)
private _PrometCamo    = ["arifle_MSBS65_camo_F",       _30rnd65Promet]; // Promet 6.5 mm (Camo)
private _PrometDMRCamo = ["arifle_MSBS65_Mark_camo_F",  _30rnd65Promet]; // Promet MR 6.5 mm (Camo)
private _PrometGLCamo  = ["arifle_MSBS65_GL_camo_F",    _30rnd65Promet, _40mm]; // Promet GL 6.5 mm (Camo)
private _PrometSGCamo  = ["arifle_MSBS65_UBS_camo_F",   _30rnd65Promet, _6rnd12G00Buck]; // Promet SG 6.5 mm (Camo)

//  SMG
//   Apex
private _MP5K = ["SMG_05_F", "30Rnd_9x21_Mag_SMG_02"]; // Protector 9 mm

//  Machine Gun
//   Marksmen
//"MMG_01_hex_F"; // Navid 9.3 mm (Hex)
private _Navid      = ["MMG_01_tan_F",         "150Rnd_93x64_Mag"]; // Navid 9.3 mm (Tan)
//"MMG_02_camo_F"; // SPMG .338 (MTP)
private _SPMGBlack  = ["MMG_02_black_F",       "130Rnd_338_Mag"]; // SPMG .338 (Black)
private _SPMG       = ["MMG_02_sand_F",        "130Rnd_338_Mag"]; // SPMG .338 (Sand)
//   Apex
private _SAW        = ["LMG_03_F",             _200rnd556]; // LIM-85 5.56 mm
//"LMG_03_Vehicle_F"; // LIM-85 5.56 mm
private _SPARLMG    = ["arifle_SPAR_02_blk_F", _150rnd556]; // SPAR-16S 5.56 mm (Black)
private _SPARLMGKhk = ["arifle_SPAR_02_khk_F", _150rnd556]; // SPAR-16S 5.56 mm (Khaki)
private _SPARLMGSnd = ["arifle_SPAR_02_snd_F", _150rnd556]; // SPAR-16S 5.56 mm (Sand)

//  Sniper Rifle
//   Marksmen
private _MARBlack    = ["srifle_dmr_02_f",        "10Rnd_338_Mag"]; // MAR-10 .338 (Black)
//"srifle_DMR_02_camo_F"; // MAR-10 .338 (Camo)
private _MAR         = ["srifle_DMR_02_sniper_F", "10Rnd_338_Mag"]; // MAR-10 .338 (Sand)
private _EMRBlack    = ["srifle_dmr_03_f",        _20rnd762]; // Mk-I EMR 7.62 mm (Black)
//"srifle_DMR_03_khaki_F"; // Mk-I EMR 7.62 mm (Khaki)
private _EMR         = ["srifle_DMR_03_tan_F",    _20rnd762]; // Mk-I EMR 7.62 mm (Sand)
//"srifle_DMR_03_multicam_F"; // Mk-I EMR 7.62 mm (Camo)
//"srifle_DMR_03_woodland_F"; // Mk-I EMR 7.62 mm (Woodland)
private _Kir         = ["srifle_dmr_04_f",        "10Rnd_127x54_Mag"]; // ASP-1 Kir 12.7 mm (Black)
//"srifle_DMR_04_Tan_F"; // ASP-1 Kir 12.7 mm (Tan)
private _Cyrus       = ["srifle_dmr_05_blk_f",    "10Rnd_93x64_DMR_05_Mag"]; // Cyrus 9.3 mm (Black)
//"srifle_DMR_05_hex_F"; // Cyrus 9.3 mm (Hex)
//"srifle_DMR_05_tan_f"; // Cyrus 9.3 mm (Tan)
//"srifle_DMR_06_camo_F"; // Mk14 7.62 mm (Camo)
private _Mk14        = ["srifle_DMR_06_olive_F",  _20rnd762]; // Mk14 7.62 mm (Olive)
//   Apex
private _QBU88       = ["srifle_DMR_07_blk_F",    _20rnd650]; // CMR-76 6.5 mm (Black)
private _QBU88Hex    = ["srifle_DMR_07_hex_F",    _20rnd650]; // CMR-76 6.5 mm (Hex)
private _QBU88Ghx    = ["srifle_DMR_07_ghex_F",   _20rnd650]; // CMR-76 6.5 mm (Green Hex)
private _SPARDMR     = ["arifle_SPAR_03_blk_F",   _20rnd762]; // SPAR-17 7.62 mm (Black)
private _SPARDMRKhk  = ["arifle_SPAR_03_khk_F",   _20rnd762]; // SPAR-17 7.62 mm (Khaki)
private _SPARDMRSnd  = ["arifle_SPAR_03_snd_F",   _20rnd762]; // SPAR-17 7.62 mm (Sand)
//   Contact
private _Mk14Classic = ["srifle_DMR_06_hunter_F", _10rnd762Mk14]; // Mk14 7.62 mm (Classic)

//  Shotgun
//   Contact
private _Kozlice         = ["sgun_HunterShotgun_01_F",          _2rnd12G00Buck]; // Kozlice 12G
private _KozliceSawedOff = ["sgun_HunterShotgun_01_sawedoff_F", _2rnd12G00Buck]; // Kozlice 12G (Sawed-Off)

//  Handgun
//   Karts
//"hgun_Pistol_Signal_F"; // Starter Pistol
//   Apex
private _Makarov = ["hgun_Pistol_01_F", "10Rnd_9x21_Mag"]; // PM 9 mm
//   Contact
//"hgun_esd_01_F"; // Spectrum Device

//  Rocket Launcher
//   Apex
private _RPG7 = ["launch_RPG7_F", "RPG7_F"]; // RPG-7
