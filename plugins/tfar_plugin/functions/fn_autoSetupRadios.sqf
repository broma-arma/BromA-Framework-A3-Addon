if !(isClass(configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};
if (!hasInterface) exitWith {};

private _playerInfo = str player splitString "_";
_playerInfo params ["_side", "_squad", "_team", "_unit"];

if (!(_side in ["op", "blu", "ind"])) exitWith {};

private _startCondition = {(call TFAR_fnc_haveSWRadio)
	&& !isNil {group player getVariable "tf_sw_frequency"} && !isNil {group player getVariable "tf_lr_frequency"} // Workaround https://github.com/michail-nikolaev/task-force-arma-3-radio/issues/1314
};

[_startCondition, {
    params ["_side", "_squad", "_team", "_unit"];

	{ // Workaround https://github.com/michail-nikolaev/task-force-arma-3-radio/issues/1314
		_x params ["_groupVarName", "_fnc_getSettings", "_fnc_setSettings", "_fnc_radioList"];
		private _groupFrequencies = (group player getVariable _groupVarName) select 2;
		{
			private _settings = _x call _fnc_getSettings;
			if ((_settings select 2) isNotEqualTo _groupFrequencies) then {
				_settings set [2, _groupFrequencies];
				[_x, _settings] call _fnc_setSettings;
			};
		} forEach (player call _fnc_radioList);
	} forEach [
		["tf_sw_frequency", TFAR_fnc_getSwSettings, TFAR_fnc_setSwSettings, TFAR_fnc_radiosList],
		["tf_lr_frequency", TFAR_fnc_getLrSettings, TFAR_fnc_setLrSettings, TFAR_fnc_lrRadiosList]
	];

    private _unitID = format["%1_%2_%3", _squad, _team, _unit];
    private _squadNumber = (call compile _squad);
    private _teamNumber = (call compile _team);
    private _unitNumber = (call compile _unit);

    private _currentRadio = (call TFAR_fnc_activeSwRadio);
    private _currentLRradio = (call TFAR_fnc_activeLRRadio);

    private _unitSquad = format["%1_%2", _side, _squad];
    private _validTeams = [_unitSquad, _teamNumber] call BRM_FMK_fnc_teamsExist;

    private _teamNumberSquadFrequency = format["%1", (_squadNumber + 30)];

    {
        private _teamIndex = _x;
        private _privateFrequency = format["%1.%2", _teamNumberSquadFrequency, _teamIndex];
        [_currentRadio, _teamIndex, _privateFrequency] call TFAR_fnc_SetChannelFrequency;
    } forEach _validTeams;

    private _finalSWChannel = if (_teamNumber == 0) then { 6 } else { _teamNumber - 1 };
    if (count _validTeams == 0) then { _finalSWChannel = 0 };

    if ((_teamNumber == 0)||(count _validTeams == 0)) then {
        private _decimalFreq = if ((_squad == "0") && (_team == "0")) then { 0 } else { 9 };
        [_currentRadio, (_finalSWChannel + 1), format["%1.%2", _teamNumberSquadFrequency, _decimalFreq]] call TFAR_fnc_SetChannelFrequency;
    };

    [_currentRadio, _finalSWChannel] call TFAR_fnc_setSwChannel;

    if ((_unit == "1") && (_squadNumber > 0) && (count _validTeams > 0)) then {
        [_currentRadio, 8, _teamNumberSquadFrequency] call TFAR_fnc_SetChannelFrequency;
        [_currentRadio, 7] call TFAR_fnc_setAdditionalSwChannel;
        [_currentRadio, 2] call TFAR_fnc_setAdditionalSwStereo;
    };

    if (!(isNil "_currentLRradio")) then {
        private _mainCommandNet = 0;
        private _firstPlatoonNet = 1;
        private _secondPlatoonNet = 2;
        private _groundVehicleNet = 3;
        private _logisticsNet = 4;
        private _airAttackNet = 5;

        private _squadsFirstPlatoon = ["0", "1", "2", "3", "4"];
        private _squadsSecondPlatoon = ["5", "6", "7", "10"];
        private _squadsLogisticsTransport = ["8", "9", "13"];
        private _squadsMechanizedArmored = ["10", "11"];
        private _squadsAirSupport = ["12"];

        /* Just using the default frequencies until we can figure out a way to make them manual.
        {
            [_currentLRradio, (_forEachIndex + 1), _x] call TFAR_fnc_SetChannelFrequency;
        } forEach _longRangeFreqs;
        */

        if (_squad in _squadsFirstPlatoon) then { [_currentLRradio, _firstPlatoonNet] call TFAR_fnc_setLRChannel };
        if (_squad in _squadsSecondPlatoon) then { [_currentLRradio, _secondPlatoonNet] call TFAR_fnc_setLRChannel };
        if (_squad in _squadsLogisticsTransport) then { [_currentLRradio, _logisticsNet] call TFAR_fnc_setLRChannel };
        if (_squad in _squadsMechanizedArmored) then { [_currentLRradio, _groundVehicleNet] call TFAR_fnc_setLRChannel };
        if (_squad in _squadsAirSupport) then { [_currentLRradio, _airAttackNet] call TFAR_fnc_setLRChannel };

        if (_squadNumber == 0) then { [_currentLRRadio, _mainCommandNet] call TFAR_fnc_setAdditionalLRChannel };


        if (_unitID == "0_0_2") then {
            [_currentLRradio, _groundVehicleNet] call TFAR_fnc_setLRChannel;
            [_currentLRRadio, _firstPlatoonNet] call TFAR_fnc_setAdditionalLRChannel;
        };
        if (_unitID == "0_2_1") then { [_currentLRradio, _secondPlatoonNet] call TFAR_fnc_setLRChannel };
        if (_unitID == "0_2_2") then {
            [_currentLRradio, _logisticsNet] call TFAR_fnc_setLRChannel;
            [_currentLRRadio, _secondPlatoonNet] call TFAR_fnc_setAdditionalLRChannel;
        };
        if (_unitID == "0_2_4") then { [_currentLRradio, _airAttackNet] call TFAR_fnc_setLRChannel };
        if ((_squadNumber == 0) && (_teamNumber > 2)) then { [_currentLRradio, _airAttackNet] call TFAR_fnc_setLRChannel };

        [_currentLRradio, 0] call TFAR_fnc_setAdditionalLRStereo;
    };

}, _playerInfo] call CBA_fnc_waitUntilAndExecute;
