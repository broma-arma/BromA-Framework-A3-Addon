if !(isServer && mission_running) exitWith {};

params ["_unit", "_killer", "_instigator"];

if (side _unit == civilian) then {
	if (isNull _instigator) then {
		_instigator = _killer;

		// Handle UAV road kill (Note: unitIsUAV doesn't work for UAV AI)
		if (_instigator isKindOf "CAManBase" && {getText (configFile >> "CfgVehicles" >> typeOf _instigator >> "simulation") == "UAVPilot"}) then {
			_instigator = vehicle _instigator;
		};
		if (unitIsUAV _instigator) then {
			_instigator = UAVControl _instigator select 0;
		};
	};

	if (!isNull _instigator && {isPlayer _instigator}) then {
		private _instigatorSide = _instigator getVariable ["unit_side", side _instigator];
		private _sideIndex = call {
			if (_instigatorSide == side_a_side) exitWith { 0 };
			if (_instigatorSide == side_b_side) exitWith { 1 };
			if (_instigatorSide == side_c_side) exitWith { 2 };
			-1
		};
		if (_instigatorSide in responsible_sides && _sideIndex > -1) then {
			private _deadCivilians = (BRM_FMK_CivilianCasualtyCap_civsKilled select _sideIndex) + 1;
			BRM_FMK_CivilianCasualtyCap_civsKilled set [_sideIndex, _deadCivilians];

			[format ["CIVILIAN CASUALTIES: %1 out of %2", _deadCivilians, mission_dead_civilian_limit]] remoteExec ["hint", _instigatorSide];
			["SERVER", "F_LOG", format ["[CivCasCap] %1 WAS KILLED BY %2", name _unit, name _instigator]] call BRM_FMK_fnc_doLog;

			if (_deadCivilians >= mission_dead_civilian_limit) then {
				if (mission_game_mode == "coop" && _sideIndex == 0) then {
					["defeat"] spawn BRM_FMK_fnc_callEnding;
				} else {
					(["side_a_defeat", "side_b_defeat", "side_c_defeat"] select _sideIndex) spawn BRM_FMK_fnc_callEnding;
				};
			};
		};
	};
};
