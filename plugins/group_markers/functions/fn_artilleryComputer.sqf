[{ shownArtilleryComputer }, {
	{
		if (ctrlIDD _x == -1 && { !isNull (_x displayCtrl 500) && { ctrlClassName (_x displayCtrl 500) == "CA_TSMap" } }) exitWith {
			[_x displayCtrl 500] call BRM_FMK_Plugin_GroupMarkers_fnc_initMap;
			_x displayAddEventHandler ["Unload", { [] call BRM_FMK_Plugin_GroupMarkers_fnc_artilleryComputer; }];
		};
	} forEach allDisplays;
}] call CBA_fnc_waitUntilAndExecute;
