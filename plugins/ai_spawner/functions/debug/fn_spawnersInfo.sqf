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
				private _config = _y get "config";

				private _totalUnits = 0;
				{
					_totalUnits = _totalUnits + ({ alive _x } count units _x);
				} forEach (_y get "groups");

				_lines pushBack format ["%1 (%2)", _x, CONFIG_TYPE];
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
