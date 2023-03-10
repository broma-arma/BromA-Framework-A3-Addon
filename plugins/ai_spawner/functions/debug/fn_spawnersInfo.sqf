private _infoText = "";

if ("dac_plugin" in usedPlugins) then {
	waitUntil{dac_basic_value == 1};
};

while {true} do {
	_infoText = "<t size='1.25' font='PuristaBold' color='#ffcc00'>Spawner Information</t>";

	if (count AIS_spawners == 0) then {
		_infoText = _infoText + '
			<br/><br/>
			<t size=''1'' font=''PuristaBold''>No spawners are active!</t>
		';
	} else {
		{
			_x params ["_id","_type","_groups","_spawnCount","_spawnLimit","_unitTotal","_groupTotal","_side","_loadout"];

			private _totalUnits = 0;

			sleep 1;

			{
				_x params ["_type","_group"];
				_totalUnits = _totalUnits + ({alive _x} count units _group);
			} forEach _groups;

			_infoText = _infoText + '
			<br/><br/>
			<t size=''1'' font=''PuristaBold''>ID: '+_id+' ('+_type+')</t>
			<br/>
			<t size=''0.8'' font=''PuristaBold''>Total Units: '+str(_totalUnits)+'/'+str(_unitTotal)+'</t>
			<br/>
			<t size=''0.8'' font=''PuristaBold''>Spawn Count: '+(if(_spawnLimit == 9999) then {str(_spawnCount)} else {str(_spawnCount)+'/'+str(_spawnLimit)})+'</t>
			<br/>
			<t size=''0.8'' font=''PuristaBold''>Side: '+str(_side)+'</t>
			';
		} forEach AIS_spawners;
	};

	hintSilent parseText _infoText;

	sleep 0.05;
};
