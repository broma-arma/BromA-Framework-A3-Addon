#define PATHTOF2_SYS(var1,var2,var3) broma_framework\var2\var3
#define PATHTOF_SYS(var1,var2,var3) \PATHTOF2_SYS(var1,var2,var3)
#define PATHTO_SYS(var1,var2,var3) PATHTOF_SYS(var1,var2,var3).sqf

#include "\x\cba\addons\main\script_macros_common.hpp"

#undef MAINPREFIX
#undef SUBPREFIX

#undef PREPMAIN_SYS
#define PREPMAIN_SYS(var1,var2,var3) var1##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fn,var3))

#undef PREP_SYS
#define PREP_SYS(var1,var2,var3) var1##_##var2##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fn,var3))

#undef PREP_SYS2
#define PREP_SYS2(var1,var2,var3,var4) var1##_##var2##_fnc_##var4 = COMPILE_FILE_SYS(var1,var3,DOUBLES(fn,var4))

#undef PREP
#undef PREPMAIN
#ifdef DISABLE_COMPILE_CACHE
	#define PREP(var1) FUNC(var1) = COMPILE_FILE_CFG(functions\DOUBLES(fn,var1))
	#define PREPMAIN(var1) FUNCMAIN(var1) = COMPILE_FILE_CFG(functions\DOUBLES(fn,var1))
#else
	#define PREP(var1) ['PATHTO_F(functions\DOUBLES(fn,var1))', 'FUNC(var1)'] call SLX_XEH_COMPILE_NEW
	#define PREPMAIN(var1) ['PATHTO_F(functions\DOUBLES(fn,var1))', 'FUNCMAIN(var1)'] call SLX_XEH_COMPILE_NEW
#endif

#undef PATHTO_FNC
#define PATHTO_FNC(func) class func {\
	file = QPATHTOF(functions\DOUBLES(fn,func).sqf);\
	CFGFUNCTION_HEADER;\
	RECOMPILE;\
}

#undef CFGFNC
#define CFGFNC(func) class func { CFGFUNCTION_HEADER; RECOMPILE; }
#define CFGFNC_1(func,var2) class func { CFGFUNCTION_HEADER; RECOMPILE; var2; }

#define LSTRINGMAINS(var1) QUOTE(TRIPLES(STR,PREFIX,var1))
#define CSTRINGMAINS(var1) QUOTE(TRIPLES($STR,PREFIX,var1))
#define LLSTRINGMAINS(var1) localize QUOTE(TRIPLES(STR,PREFIX,var1))

#define CONCAT(var1,var2) var1##var2
