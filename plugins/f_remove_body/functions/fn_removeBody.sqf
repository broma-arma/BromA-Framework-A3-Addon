params [["_unit", objNull]];

if (isNull _unit) exitWith {};

BrmFmk_RemoveBody_queue pushBack [diag_tickTime + f_var_removeBodyDelay, _unit];
BrmFmk_RemoveBody_queue sort true;

if (isNil "BrmFmk_RemoveBody_handler" || {scriptDone BrmFmk_RemoveBody_handler}) then {
	BrmFmk_RemoveBody_handler = 0 spawn {
		while {count BrmFmk_RemoveBody_queue > 0} do {
			for [{private _i = 0}, {_i < count BrmFmk_RemoveBody_queue}, {_i = _i + 1}] do {
				(BrmFmk_RemoveBody_queue select _i) params ["_delay", "_unit"];
				if (_delay >= diag_tickTime) exitWith {
					sleep 1;
				};

				if (f_var_removeBodyDistance <= 0 || { {alive _x && _x distanceSqr _unit < f_var_removeBodyDistance ^ 2} count allPlayers == 0 }) then {
					hideBody _unit;

					BrmFmk_RemoveBody_queue deleteAt _i;
					_i = _i - 1;
				};
			};
		};
	};
};
