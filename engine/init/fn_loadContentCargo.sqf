BRM_FMK_ContentCargo = createHashMap;
#if __A3_DEBUG__
#define CONTENT_CARGO(VAR,VALUE,COUNT) if (BRM_FMK_ContentCargo set [toLower #VAR, COUNT, false]) then { ["'%1' content cargo overwritten in %2@%3", #VAR, __FILE__, __LINE__] call BIS_fnc_error; }; private _##VAR = VALUE
#define CONTENT_CARGO_A(NAME,VAR,COUNT) if (BRM_FMK_ContentCargo set [toLower #NAME, [#VAR, COUNT], false]) then { ["'%1' content cargo overwritten in %2@%3", #VAR, __FILE__, __LINE__] call BIS_fnc_error; };
#define CONTENT_CARGO_N(VAR,VALUE,NAME,COUNT) CONTENT_CARGO_A(NAME,VAR,COUNT) private _##VAR = VALUE
#else
#define CONTENT_CARGO(VAR,VALUE,COUNT) BRM_FMK_ContentCargo set [toLower #VAR, COUNT, false]; private _##VAR = VALUE
#define CONTENT_CARGO_A(NAME,VAR,COUNT) BRM_FMK_ContentCargo set [toLower #NAME, [#VAR, COUNT], false];
#define CONTENT_CARGO_N(VAR,VALUE,NAME,COUNT) CONTENT_CARGO_A(NAME,VAR,COUNT) private _##VAR = VALUE
#endif
#include "\broma_framework\loadouts\content\content-list.sqf"
