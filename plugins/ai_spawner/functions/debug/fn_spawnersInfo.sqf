#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_spawnersInfo

Description:
	Show information about spawners.

Parameters:
	None

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

0 spawn {
	while { true } do {
		private _lines = ["<t size='1.25' color='#ffcc00'>AI Spawner</t>", "<t align='left'>"];

		if (count BRM_FMK_Plugin_AIS_spawners == 0) then {
			_lines pushBack "No active spawners.";
		} else {
			{
				private _state = _y get "state";
				if (_state < SPAWNER_INIT || _state == SPAWNER_DEAD) then { continue; };

				private _config = _y get "config";

				private _totalUnits = 0;
				{
					_totalUnits = _totalUnits + ({ alive _x } count units _x);
				} forEach (_y get "groups");

				private _pause = _y get "pause";
				if (_pause isEqualType 0) then {
					_pause = format [" (<t color='#ffff00'>Pause %1s</t>)", _pause - time toFixed 1];
				} else {
					_pause = ["", " (<t color='#ff0000'>Pause</t>)"] select _pause;
				};
				_lines pushBack format ["[%1] %2%3", toUpperANSI (CONFIG_TYPE select [0, 1]), _x, _pause];

				//_lines pushBack format ["<t size='0.8'>Total Units: %1/%2", _totalUnits, _unitTotal];
				_lines pushBack format ["<t size='0.8'>Total Units: %1", _totalUnits];
				//_lines pushBack format ["Spawn Count: %1/%2", _y get "groupCount", [_spawnLimit, "INF"] select (_spawnLimit == 9999)];
				_lines pushBack format ["Spawn Count: %1", _y get "groupCount"];
				_lines pushBack format ["Side: %1</t>", CONFIG_SIDE];
			} forEach BRM_FMK_Plugin_AIS_spawners;
		};

		hintSilent parseText ("<t size='1' font='PuristaBold'>" + (_lines joinString "<br/>") + "</t></t>");

		sleep 1;
	};
};
