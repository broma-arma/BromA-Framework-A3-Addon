if ("dac_plugin" in usedPlugins) then {
	// TODO I'd assume this is so the hint doesn't interfere with DAC's initialization hint?
	//      Which, DAC shouldn't be intermixed with this, so probably unneeded. Unless, was for testing purposes?
	waitUntil { dac_basic_value == 1 };
};

while {true} do {
	private _lines = ["<t size='1.25' font='PuristaBold' color='#ffcc00'>Spawner Information</t>", ""];

	if (count BRM_FMK_AIS_spawners == 0) then {
		_lines pushBack "No active spawners.";
	} else {
		{
			_x params ["_id", "_type", "_groups", "_spawnCount", "_spawnLimit", "_unitTotal", "_groupTotal", "_side", "_loadout"];

			private _totalUnits = 0;

			sleep 1;

			{
				_x params ["_type", "_group"];
				_totalUnits = _totalUnits + ({alive _x} count units _group);
			} forEach _groups;

			_lines pushBack format ["ID: %1 (%2)", _id, _type];
			_lines pushBack format ["<t size='0.8' font='PuristaBold'>Total Units: %1/%2</t>", _totalUnits, _unitTotal];
			_lines pushBack format ["<t size='0.8' font='PuristaBold'>Spawn Count: %1%2</t>", _spawnCount,
				[format ["/%2", _spawnLimit], ""] select (_spawnLimit == 9999)
			];
			_lines pushBack format ["<t size='0.8' font='PuristaBold'>Side: %1</t>", _side];
		} forEach BRM_FMK_AIS_spawners;
	};

	private _infoText = "<t size='1' font='PuristaBold'>" + (_lines joinString "<br/>") + "</t>";
	hintSilent parseText _infoText;

	sleep 0.05; // TODO Every 50 ms?
};
