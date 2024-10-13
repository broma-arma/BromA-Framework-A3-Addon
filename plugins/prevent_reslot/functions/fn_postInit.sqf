if !(isMultiplayer && hasInterface && { !(player isKindOf "VirtualSpectator_F") }) exitWith {};

[getPlayerUID player, str player, name player, roleDescription player] remoteExec ["BRM_FMK_Plugin_PreventReslot_fnc_checkSlot", 2];
