if (!isClass (configFile >> "CfgPatches" >> "ace_spectator")) exitWith {};

if (mission_game_mode != "coop" && !(player isKindOf "VirtualSpectator_F")) then {
	private _side = player call BIS_fnc_objectSide;
	private _friendly = [];
	private _enemy = [];
	{
		[_friendly, _enemy] select (_side getFriend _x < 0.6) pushBack _x;
	} forEach [BLUFOR, OPFOR, INDEPENDENT, CIVILIAN];

	[_friendly, _enemy] call ace_spectator_fnc_updateSides;
};
