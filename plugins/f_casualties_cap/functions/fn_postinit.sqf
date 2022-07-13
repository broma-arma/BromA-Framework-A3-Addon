if !(isMultiplayer && isServer) exitWith {};

private _cas_cap = ["p_cas_cap", -1] call BIS_fnc_getParamValue;

[{
	if (_cas_cap <= 0) exitWith {};

	private _percent = _cas_cap / 100;
	if (mission_game_mode == "tvt") then {
		private _callback = { ["tvt_end"] call BRM_FMK_fnc_callEnding; };
		[side_a_side, _percent, _callback] call BRM_FMK_fnc_checkCasualties;
		[side_b_side, _percent, _callback] call BRM_FMK_fnc_checkCasualties;

		if (mission_enable_side_c) then {
			[side_c_side, _percent, _callback] call BRM_FMK_fnc_checkCasualties;
		};
	} else {
		[side_a_side, _percent, { ["defeat"] call BRM_FMK_fnc_callEnding; }] call BRM_FMK_fnc_checkCasualties
	};
}, nil, 5] call CBA_fnc_waitAndExecute;
