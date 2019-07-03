if !(hasInterface) exitWith {};

if (isNil "friendly_fire_timer_minutes") then { friendly_fire_timer_minutes = 1 };
if (isNil "friendly_fire_count_AI") then { friendly_fire_count_AI = false };

player addEventHandler ["Hit", BRM_FMK_FriendlyFire_fnc_alert];
