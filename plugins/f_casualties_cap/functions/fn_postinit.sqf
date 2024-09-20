if !(isMultiplayer && isServer) exitWith {};

private _casCap = ["p_cas_cap", -1] call BIS_fnc_getParamValue; // -1="Disabled", 80="80%", 90="90%", 95="95%", 100="100%"
if (_casCap <= 0) exitWith {};

[{
	params ["_casCap"];

	private _percent = _casCap / 100;
	if (mission_game_mode == "tvt") then {
		private _callback = { [endings_tvt_auto] call BRM_FMK_fnc_callEnding; };
		[side_a_side, _percent, _callback] call BRM_FMK_fnc_checkCasualties;
		[side_b_side, _percent, _callback] call BRM_FMK_fnc_checkCasualties;

		if (mission_enable_side_c) then {
			[side_c_side, _percent, _callback] call BRM_FMK_fnc_checkCasualties;
		};
	} else {
		[side_a_side, _percent, { [endings_defeat] call BRM_FMK_fnc_callEnding; }] call BRM_FMK_fnc_checkCasualties
	};
}, [_casCap], 5] call CBA_fnc_waitAndExecute;
