// AMMUNITION
private _30rnd65red   =  "30Rnd_65x39_caseless_mag";
private _30rnd65green =  "30Rnd_65x39_caseless_green";
private _100rnd65     = "100Rnd_65x39_caseless_mag";
private _150rnd762    = "150Rnd_762x51_Box";
private _200rnd65     = "200Rnd_65x39_cased_Box";
private _30rnd556     =  "30Rnd_556x45_Stanag";
private _30rndACP     =  "30Rnd_45ACP_Mag_SMG_01";
private _20rndUW      =  "20Rnd_556x45_UW_mag";
private _30rnd9mm     =  "30Rnd_9x21_Mag";
private _20rnd762     =  "20Rnd_762x51_Mag";
private _10rnd762     =  "10Rnd_762x54_Mag";
private _40mm         =   "1Rnd_HE_Grenade_shell";
private _40mmSwhite   =   "1Rnd_Smoke_Grenade_shell";
private _40mmSgreen   =   "1Rnd_SmokeGreen_Grenade_shell";
private _40mmSred     =   "1Rnd_SmokeRed_Grenade_shell";
private _40mmSblue    =   "1Rnd_SmokeBlue_Grenade_shell";
private _40mmFwhite   =    "UGL_FlareWhite_F";
private _40mmFgreen   =    "UGL_FlareGreen_F";
private _40mmFred     =    "UGL_FlareRed_F";
private _30rnd762     =  "30Rnd_762x39_Mag_F";
private _30rnd545     =  "30Rnd_545x39_Mag_F";
private _30rnd580     =  "30Rnd_580x42_Mag_F";
private _100rnd580    = "100Rnd_580x42_Mag_F";
private _5rnd127      =   "5Rnd_127x108_Mag";
private _150rnd556    = "150Rnd_556x45_Drum_Mag_F";
private _200rnd556    = "200Rnd_556x45_Box_F";
private _20rnd650     =  "20Rnd_650x39_Cased_Mag_F";

// NATO
private _MX        = ["arifle_MX_F",            _30rnd65red];
private _MXBlack   = ["arifle_MX_Black_F",      _30rnd65red];
private _MXGL      = ["arifle_MX_GL_F",         _30rnd65red, _40mm];
private _MXGLBlack = ["arifle_MX_GL_Black_F",   _30rnd65red, _40mm];
private _MXSW      = ["arifle_MX_SW_F",         _100rnd65];
private _MXSWBlack = ["arifle_MX_SW_Black_F",   _100rnd65];
private _MXC       = ["arifle_MXC_F",           _30rnd65red];
private _MXCBlack  = ["arifle_MXC_Black_F",     _30rnd65red];
private _MXM       = ["arifle_MXM_F",           _30rnd65red];
private _MXMBlack  = ["arifle_MXM_Black_F",     _30rnd65red];
private _MAR       = ["srifle_DMR_02_sniper_F", "10Rnd_338_Mag"];
private _MARBlack  = ["srifle_dmr_02_f",        "10Rnd_338_Mag"];
private _EMR       = ["srifle_DMR_03_tan_F",    _20rnd762];
private _EMRBlack  = ["srifle_dmr_03_f",        _20rnd762];
private _Vermin    = ["SMG_01_F",               _30rndACP];
private _SDAR      = ["arifle_SDAR_F",          _20rndUW];
private _M200      = ["srifle_LRR_F",           "7Rnd_408_Mag"];
private _SPMG      = ["MMG_02_sand_F",          "130Rnd_338_Mag"];
private _SPMGBlack = ["MMG_02_black_F",         "130Rnd_338_Mag"];
private _P07       = ["hgun_P07_F",             "16Rnd_9x21_Mag"];
private _4Five     = ["hgun_Pistol_heavy_01_F", "11Rnd_45ACP_Mag"];
private _PCML      = ["launch_NLAW_F",          ["NLAW_F", ""] select isClass (configFile >> "CfgPatches" >> "ace_disposable")];

// FIA
private _TRG       = ["arifle_TRG20_F",        _30rnd556];
private _TRGGL     = ["arifle_TRG21_GL_F",     _30rnd556, _40mm];
private _Mk14      = ["srifle_DMR_06_olive_F", _20rnd762];
private _PDW       = ["hgun_PDW2000_F",        _30rnd9mm];
private _Mk200     = ["LMG_Mk200_F",           _200rnd65];

// CSAT
private _Katiba   = ["arifle_Katiba_F",        _30rnd65green];
private _KatibaGL = ["arifle_Katiba_GL_F",     _30rnd65green, _40mm];
private _KatibaC  = ["arifle_Katiba_C_F",      _30rnd65green];
private _Zafir    = ["LMG_Zafir_F",            "150Rnd_762x54_Box"];
private _Cyrus    = ["srifle_dmr_05_blk_f",    "10Rnd_93x64_DMR_05_Mag"];
private _Kir      = ["srifle_dmr_04_f",        "10Rnd_127x54_Mag"];
private _Navid    = ["MMG_01_tan_F",           "150Rnd_93x64_Mag"];
private _Sting    = ["SMG_02_F",               _30rnd9mm];
private _GM6      = ["srifle_GM6_F",           "5Rnd_127x108_APDS_Mag"];
private _Rahim    = ["srifle_DMR_01_F",        _10rnd762];
private _Zubr     = ["hgun_Pistol_heavy_02_F", "6Rnd_45ACP_Cylinder"];
private _Rook     = ["hgun_Rook40_F",          "16Rnd_9x21_Mag"];
private _RPG42    = ["launch_RPG32_F",         "RPG32_F", "RPG32_HE_F"];

// AAF
private _Mk20       = ["arifle_Mk20_plain_F",    _30rnd556];
private _Mk20Camo   = ["arifle_Mk20_F",          _30rnd556];
private _Mk20C      = ["arifle_Mk20C_plain_F",   _30rnd556];
private _Mk20CCamo  = ["arifle_Mk20C_F",         _30rnd556];
private _Mk20GL     = ["arifle_Mk20_GL_plain_F", _30rnd556, _40mm];
private _Mk20GLCamo = ["arifle_Mk20_GL_F",       _30rnd556, _40mm];
private _Mk18       = ["srifle_EBR_F",           _20rnd762];
private _ACP45      = ["hgun_ACPC2_F",           "9Rnd_45ACP_Mag"];

// LAUNCHERS
private _TitanAA = ["launch_I_Titan_F",       "Titan_AA"];
private _TitanAT = ["launch_I_Titan_short_F", "Titan_AT", "Titan_AP"];

// APEX
private _Makarov    = ["hgun_Pistol_01_F",            "10Rnd_9x21_Mag"];
private _P07Khk     = ["hgun_P07_khk_F",              "16Rnd_9x21_Mag"];
private _AK12       = ["arifle_AK12_F",               _30rnd762];
private _AK12GL     = ["arifle_AK12_GL_F",            _30rnd762, _40mm];
private _AKM        = ["arifle_AKM_F",                _30rnd762];
private _AK74U      = ["arifle_AKS_F",                _30rnd545];
private _CTAR       = ["arifle_CTAR_blk_F",           _30rnd580];
private _CTARGL     = ["arifle_CTAR_GL_blk_F",        _30rnd580, _40mm];
private _CTARGhx    = ["arifle_CTAR_ghex_F",          _30rnd580];
private _CTARGLGhx  = ["arifle_CTAR_GL_ghex_F",       _30rnd580];
private _CTARHex    = ["arifle_CTAR_hex_F",           _30rnd580];
private _CTARGLHex  = ["arifle_CTAR_GL_hex_F",        _30rnd580];
private _CTARS      = ["arifle_CTARS_blk_F",          _100rnd580];
private _CTARSGhx   = ["arifle_CTARS_ghex_F",         _100rnd580];
private _CTARSHex   = ["arifle_CTARS_hex_F",          _100rnd580];
private _GM6Ghx     = ["srifle_GM6_ghex_F",           _5rnd127];
private _SPAR       = ["arifle_SPAR_01_blk_F",        _30rnd556];
private _SPARKhk    = ["arifle_SPAR_01_khk_F",        _30rnd556];
private _SPARSnd    = ["arifle_SPAR_01_snd_F",        _30rnd556];
private _SPARGL     = ["arifle_SPAR_01_GL_blk_F",     _30rnd556, _40mm];
private _SPARKhkGL  = ["arifle_SPAR_01_GL_khk_F",     _30rnd556, _40mm];
private _SPARSndGL  = ["arifle_SPAR_01_GL_snd_F",     _30rnd556, _40mm];
private _SPARLMG    = ["arifle_SPAR_02_blk_F",        _150rnd556];
private _SPARLMGKhk = ["arifle_SPAR_02_khk_F",        _150rnd556];
private _SPARLMGSnd = ["arifle_SPAR_02_snd_F",        _150rnd556];
private _SPARDMR    = ["arifle_SPAR_03_blk_F",        _20rnd762];
private _SPARDMRKhk = ["arifle_SPAR_03_khk_F",        _20rnd762];
private _SPARDMRSnd = ["arifle_SPAR_03_snd_F",        _20rnd762];
private _SAW        = ["LMG_03_F",                    _200rnd556];
private _MP5K       = ["SMG_05_F",                    "30Rnd_9x21_Mag_SMG_02"];
private _MXKhk      = ["arifle_MX_khk_F",             _30rnd65red];
private _MXGLKhk    = ["arifle_MX_GL_khk_F",          _30rnd65red, _40mm];
private _MXSWKhk    = ["arifle_MX_SW_khk_F",          _100rnd65];
private _MXCKhk     = ["arifle_MXC_khk_F",            _30rnd65red];
private _MXMKhk     = ["arifle_MXM_khk_F",            _30rnd65red];
private _QBU88      = ["srifle_DMR_07_blk_F",         _20rnd650];
private _QBU88Hex   = ["srifle_DMR_07_hex_F",         _20rnd650];
private _QBU88Ghx   = ["srifle_DMR_07_ghex_F",        _20rnd650];
private _ARX        = ["arifle_ARX_blk_F",            _30rnd65green, "10Rnd_50BW_Mag_F"];
private _ARXHex     = ["arifle_ARX_hex_F",            _30rnd65green, "10Rnd_50BW_Mag_F"];
private _ARXGhx     = ["arifle_ARX_ghex_F",           _30rnd65green, "10Rnd_50BW_Mag_F"];
private _M200G      = ["srifle_LRR_tna_F",            "7Rnd_408_Mag"];
private _RPG32Ghx   = ["launch_RPG32_ghex_F",         "RPG32_F", "RPG32_HE_F"];
private _RPG7       = ["launch_RPG7_F",               "RPG7_F"];
private _TitanGhx   = ["launch_O_Titan_short_ghex_F", "Titan_AT", "Titan_AP"];
