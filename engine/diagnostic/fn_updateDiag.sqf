private _name = if (isServer) then { "Server" } else { format ["HeadlessClient%1", clientOwner] };
_this setMarkerText format (["%1 - FPS: %2, Units: %3, Groups: %4, Scripts: %5 spawn, %6 vm, %7 exec, %8 fsm", _name,
	diag_fps toFixed 0,
	{ local _x } count allUnits,
	{ local _x } count allGroups
] + diag_activeScripts);
