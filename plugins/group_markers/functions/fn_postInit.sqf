if (!hasInterface) exitWith {};

[] call BRM_FMK_Plugin_GroupMarkers_fnc_artilleryComputer;

[{ _this call BRM_FMK_Plugin_GroupMarkers_fnc_updateMarkers; }, 5] call CBA_fnc_addPerFrameHandler;
