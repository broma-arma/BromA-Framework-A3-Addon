BRM_FMK_ContentCargo = createHashMap;
#define CONTENT_CARGO(VAR,COUNT) if (BRM_FMK_ContentCargo set [toLower #VAR, COUNT, false]) then { ["'%1' content cargo overwritten in %2@%3", #VAR, __FILE__, __LINE__] call BIS_fnc_error; };
#define CONTENT_CARGO_N(NAME,VAR,COUNT) if (BRM_FMK_ContentCargo set [toLower #NAME, [#VAR, COUNT], false]) then { ["'%1' content cargo overwritten in %2@%3", #VAR, __FILE__, __LINE__] call BIS_fnc_error; };
#include "\broma_framework\loadouts\content\content-list.sqf"
