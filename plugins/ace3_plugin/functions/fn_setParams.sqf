// Medical Simulation Level, Bleedout time in seconds, Revive system lives, Everyone as a medic
params [["_medicalLevel", 1], ["_reviveTime", 300], ["_reviveLives", -1], ["_everyoneMedic", 0]];

mission_ace3_medical_level = if (mission_ACE3_enabled) then { [2, 1] select (ace_medical_treatment_advancedBandages == 0) } else { 0 };

if (_reviveLives == 9999) then { _reviveLives = -1; }; // Backward compatibility

mission_ace3_revive_lives = _reviveLives;
mission_ace3_everyone_medic = _everyoneMedic > 0;
