// INFO ========================================================================
/*

    SPRG Report is the most dedicated team of impetuous war-crawlers, ready to turn
    massacres and genocides into coverage for the highest paying news station.

    Ever since the conflict between CSAT and NATO broke out, their schedule has
    been very, very busy.

*/

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceWHITE];
_defaultInsignia = "";

// =============================================================================
if (!_isMan) exitWith {};
switch (true) do {
// =============================================================================

    case (_type == "reporter"): {
        [_unit, "empty", "UK3CB_CHC_C_U_FUNC_01", "V_Press_F", "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_NVGEN1,1]]] call BRM_FMK_fnc_addtoUniform;
    };

    case (_type == "cameraman"): {
        [_unit, "H_Cap_press", "U_C_Journalist", "V_Press_F", "empty"] call BRM_FMK_fnc_useUniform;
        [_unit,[[_NVGEN1,1]]] call BRM_FMK_fnc_addtoUniform;
        _unit addWeapon "R3F_JIM_LR";
    };
};

// ADDS ESSENTIALS =============================================================

[_unit, ["ItemMap", "ItemCompass", "ItemWatch"]] call BRM_FMK_fnc_linkItem;
