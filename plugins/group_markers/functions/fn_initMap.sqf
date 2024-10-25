params ["_ctrlMap"];

_ctrlMap ctrlAddEventHandler ["Draw", { _this call BRM_FMK_Plugin_GroupMarkers_fnc_handleDraw; }];
