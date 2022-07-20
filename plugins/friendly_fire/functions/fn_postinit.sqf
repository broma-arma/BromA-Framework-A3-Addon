if !(hasInterface) exitWith {};

BRM_FMK_FriendlyFire_alerts = createHashMap;
player addEventHandler ["Hit", { _this call BRM_FMK_FriendlyFire_fnc_alert }];
