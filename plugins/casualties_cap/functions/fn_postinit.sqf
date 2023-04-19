#include "script_component.hpp"
if !(isMultiplayer && isServer) exitWith {};

private _cas_cap = ["p_cas_cap", -1] call BIS_fnc_getParamValue;

[{
	if (_cas_cap <= 0) exitWith {};

	private _percent = _cas_cap / 100;
	if (mission_game_mode == "tvt") then {
		private _callback = { ["tvt_end"] call FUNCMAIN(callEnding); };
		[side_a_side, _percent, _callback] call FUNCMAIN(checkCasualties);
		[side_b_side, _percent, _callback] call FUNCMAIN(checkCasualties);

		if (mission_enable_side_c) then {
			[side_c_side, _percent, _callback] call FUNCMAIN(checkCasualties);
		};
	} else {
		[side_a_side, _percent, { ["defeat"] call FUNCMAIN(callEnding); }] call FUNCMAIN(checkCasualties)
	};
}, nil, 5] call CBA_fnc_waitAndExecute;
