if !(hasInterface) exitWith {};

private _delay = 1;
private _showAI = false;
private _showCivilian = true;
if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "friendly_fire_timer_minutes") then { _delay = friendly_fire_timer_minutes * 60; };
	if (!isNil "friendly_fire_count_AI") then { _showAI = friendly_fire_count_AI; };
	if (!isNil "friendly_fire_civilians") then { _showCivilian = friendly_fire_civilians; };
} else {
	if (fileExists "mission\settings\plugins\friendly_fire.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\friendly_fire.sqf";
	};
};
BRM_FMK_Plugin_FriendlyFire_delay = _delay;
BRM_FMK_Plugin_FriendlyFire_showAI = _showAI;
BRM_FMK_Plugin_FriendlyFire_showCivilian = _showCivilian;

BRM_FMK_Plugin_FriendlyFire_alerts = createHashMap;
player addEventHandler ["Hit", { _this call BRM_FMK_Plugin_FriendlyFire_fnc_alert }];
