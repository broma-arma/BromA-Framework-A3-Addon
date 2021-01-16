// Medical Simulation Level, Bleedout time in seconds, Revive system lives, Everyone as a medic
params [["_medicalLevel", 1], ["_reviveTime", 300], ["_reviveLives", -1], ["_everyoneMedic", 0]];

if (_reviveLives == 9999) then { _reviveLives = -1; }; // Backward compatibility

mission_ace3_revive_lives = _reviveLives;
mission_ace3_everyone_medic = _everyoneMedic > 0;
