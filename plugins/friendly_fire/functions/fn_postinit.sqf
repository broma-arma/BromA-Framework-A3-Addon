if !(hasInterface) exitWith {};

player addEventHandler ["Hit", BRM_FMK_FriendlyFire_fnc_alert];

player addEventHandler ["Killed", BRM_FMK_FriendlyFire_fnc_alert];