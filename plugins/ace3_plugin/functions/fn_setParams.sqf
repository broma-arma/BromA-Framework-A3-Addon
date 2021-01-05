#include "component.hpp"
// =============================================================================
//  ACE Medical level
// =============================================================================
switch (_this select 0) do {
    case 0: { mission_ace3_medical_level = 1; };
    case 1: { mission_ace3_medical_level = 2; };
};

// =============================================================================
//  ACE Revive Time
// =============================================================================
mission_ace3_revive_time = (_this select 1);
if (mission_ace3_revive_time == 0) then { mission_ace3_revive_enable = 0 };

// =============================================================================
//  ACE Revive Lives
// =============================================================================
mission_ace3_revive_lives = (_this select 2);
if (mission_ace3_revive_lives == 0) then { mission_ace3_revive_enable = 0 };

// =============================================================================
//  ACE Everyone is a medic
// =============================================================================
switch (_this select 3) do {
    case 0: { mission_ace3_everyone_medic = false; };
    case 1: { mission_ace3_everyone_medic = true; };
};
// =============================================================================
