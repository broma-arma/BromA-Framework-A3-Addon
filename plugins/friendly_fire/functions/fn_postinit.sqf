if !(hasInterface) exitWith {};

if (isNil "friendly_fire_timer_minutes") then { friendly_fire_timer_minutes = 1 };
if (isNil "friendly_fire_count_AI") then { friendly_fire_count_AI = false };
if (isNil "friendly_fire_civilians") then { friendly_fire_civilians = true };

BRM_FMK_Plugin_FriendlyFire_alerts = createHashMap;
player addEventHandler ["Hit", { _this call BRM_FMK_Plugin_FriendlyFire_fnc_alert }];
