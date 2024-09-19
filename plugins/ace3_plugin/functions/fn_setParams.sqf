// Backward compatibility
mission_ace3_medical_level = if (mission_ACE3_enabled) then { [2, 1] select (ace_medical_treatment_advancedBandages == 0) } else { 0 };

// Revive system lives
private _reviveLives = ["p_ace3_revive_lives", 3] call BIS_fnc_getParamValue; // 0="Disabled", 1="1", 3="3", 5="5", 9999/-1="Infinite"
if (_reviveLives == 9999) then { _reviveLives = -1; }; // Backward compatibility
mission_ace3_revive_lives = _reviveLives;

// Everyone as a medic
mission_ace3_everyone_medic = ["p_ace3_everyone_medic", 1] call BIS_fnc_getParamValue > 0;
