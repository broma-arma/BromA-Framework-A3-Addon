#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

/*
if ("dac_plugin" in BRM_plugins) then {
	// TODO I'd assume this is so the hint doesn't interfere with DAC's initialization hint?
	//      Which, DAC shouldn't be intermixed with this, so probably unneeded. Unless, was for testing purposes?
	waitUntil { !isNil "dac_basic_value" && { dac_basic_value == 1 } };
};
*/

while {true} do {
	private _lines = ["<t size='1.25' font='PuristaBold' color='#ffcc00'>AI Spawner</t>", "<t align='left'>"];

	if (count GVAR(spawners) == 0) then {
		_lines pushBack "No active spawners.";
	} else {
		{
			private _id = _x;
			_type = _y getVariable "type";
			_groups = _y getVariable "groups";
			_spawnCount = _y getVariable "spawned";
			_spawnLimit = _y getVariable "spawnLimit";
			_unitTotal = _y getVariable "maxUnits";
			_side = _y getVariable "side";
			_loadout = _y getVariable "loadout";

			private _totalUnits = 0;

			{
				_totalUnits = _totalUnits + ({alive _x} count units _x);
			} forEach _groups;

			_lines pushBack format ["%1 (%2)", _id, _type];
			_lines pushBack format ["<t size='0.8' font='PuristaBold'>Total Units: %1/%2</t>", _totalUnits, _unitTotal];
			_lines pushBack format ["<t size='0.8' font='PuristaBold'>Spawn Count: %1/%2</t>", _spawnCount,
				[_spawnLimit, "INF"] select (_spawnLimit == -1)
			];
			_lines pushBack format ["<t size='0.8' font='PuristaBold'>Side: %1</t>", _side];
		} forEach GVAR(spawners);
	};

	private _infoText = "<t size='1' font='PuristaBold'>" + (_lines joinString "<br/>") + "</t></t>";
	hintSilent parseText _infoText;

	sleep 1; // TODO Every 50 ms?
};
