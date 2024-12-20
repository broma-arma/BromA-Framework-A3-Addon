if (!hasInterface || !isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

private _sideID = player call BIS_fnc_objectSide call BIS_fnc_sideID;
if (_sideID > 2) exitWith {};

params ["_squadIndex", "_groupIndex", ["_init", false]];

private _lrChannels = ["Infantry", "Support/Logistics"];

private _radioNets = BRM_FMK_Plugin_RadioFreq_radioNets select _sideID;

/*
0: activeChannel <NUMBER>
1: volume <NUMBER>
2: channelFrequencies, sr=8, lr=9 <ARRAY>
3: stereo <NUMBER>
4: encryption <STRING>
5: additionalChannel <NUMBER>
6: additionalChannelStereo <NUMBER>
7: ownerUID (SR), nil (LR) <STRING>
8: speaker <NUMBER>
9: on <BOOL>
*/
private _srSettings = [nil, nil, [nil, nil, nil, nil, nil, nil, nil, nil], nil, nil, nil, nil, nil, nil, nil];
private _lrSettings = [nil, nil, [nil, nil, nil, nil, nil, nil, nil, nil, nil], nil, nil, nil, nil, nil, nil, nil];

// Short range
private _lines = ["<font color='#ffc030' size='16' face='RobotoCondensedBold'>Short Range</font>"];

private _squadRadioNets = _radioNets#0#_squadIndex; // [[_squad0Name, squad0Frequency], [group0Name, group0Frequency], [group1Name, group1Frequency], [group2Name, group2Frequency]]
private _groupCount = count _squadRadioNets - 1;
private _j = 2;
for "_i" from 1 to _groupCount do {
	if (_groupIndex == _i - 1) then {
		_srSettings#2 set [0, _squadRadioNets#_i#1]; // Channel 1 frequency
		_lines set [1, format (["CH%1: %2 (Group Net, %3)", 1] + _squadRadioNets#_i)];
	} else {
		if (_i == 1) then {
			_srSettings#2 set [_groupCount - 1, _squadRadioNets#_i#1]; // Channel _groupCount frequency
			_lines set [_groupCount, format (["CH%1: %2 (Group Net, %3)", _groupCount] + _squadRadioNets#_i)];
		} else {
			_srSettings#2 set [_j - 1, _squadRadioNets#_i#1]; // Channel _j frequency
			_lines set [_j, format (["CH%1: %2 (Group Net, %3)", _j] + _squadRadioNets#_i)];
			_j = _j + 1;
		};
	};
};

_srSettings set [0, 0]; // Active channel 1

_srSettings#2 set [6, _squadRadioNets#0#1]; // Channel 7 frequency
_lines set [7, format (["CH%1: %2 (Squad Net, %3)", 7] + _squadRadioNets#0)];

_srSettings#2 set [7, _radioNets#0#0#0#1]; // Channel 8 frequency
_lines set [8, format (["CH%1: %2 (Squad Net, %3)", 8] + _radioNets#0#0#0)];

_srSettings set [3, parseNumber (_squadIndex != 0 || _groupIndex != 0)]; // Stereo, Left (Both for command)
_srSettings set [5, 7]; // Active additional channel 8
_srSettings set [6, parseNumber (_squadIndex != 0 || _groupIndex != 0) + 1]; // Additional stereo, Right (Left for command)

_lines = _lines select { !isNil "_x" };
_lines append ["", "<font color='#ffc030' size='16' face='RobotoCondensedBold'>Long Range</font>"];

// Long range
{
	_lrSettings#2 set [_forEachIndex, _x];
	_lines pushBack format (["CH%1: %2 (%3)", _forEachIndex + 1, _lrChannels#_forEachIndex, _x]);
} foreach _radioNets#1; // [_lrChannel0 frequency, _lrChannel1 frequency, ...]

_lrSettings set [0, parseNumber (_squadIndex > 7 || { player getVariable "unitInit" param [2, ""] == "rto" })]; // Active channel 1/2
_lrSettings set [3, 2]; // Stereo, Right

BRM_FMK_Plugin_RadioFreq_radioSettings = [_srSettings, _lrSettings];

if (_init) then {
	BRM_FMK_Plugin_RadioFreq_diaryRecord = player createDiaryRecord ["Diary", ["Radio", _lines joinString "<br />", "\z\tfar\addons\core\ui\ACE_Interaction_Radio_Icon.paa"]];
};

// Short range nets
_lines append ["", "<font color='#ffc030' size='16' face='RobotoCondensedBold'>Short Range Nets</font>", "Group (Squad)"];
{
	//[[_squad0Name, squad0Frequency], [group0Name, group0Frequency], [group1Name, group1Frequency], ...],
	//...
	if (!isNil "_x") then {
		private _squadIndex = _forEachIndex;
		_x#0 params ["_squadName", "_squadFrequency"];
		{
			private _groupIndex = _forEachIndex - 1;
			if (_forEachIndex == 0) then { continue; };
			if (!isNil "_x") then {
				_x params ["_groupName", "_frequency"];
				_lines pushBack format ["<execute expression=""private _radio = call TFAR_fnc_activeSwRadio; [_radio, 6, '%2'] call TFAR_fnc_setChannelFrequency; [_radio, 5] call TFAR_fnc_setSwChannel; [_radio, false] call TFAR_fnc_showRadioInfo;"">%1</execute> (<execute expression=""private _radio = call TFAR_fnc_activeSwRadio; [_radio, 6, '%4'] call TFAR_fnc_setChannelFrequency; [_radio, 5] call TFAR_fnc_setSwChannel; [_radio, false] call TFAR_fnc_showRadioInfo;"">%3</execute>) - <execute expression=""[%5, %6] call BRM_FMK_Plugin_RadioFreq_fnc_switchGroup;"">Join</execute> Group", _groupName, _frequency, _squadName, _squadFrequency, _squadIndex, _groupIndex];
			};
		} forEach _x;
	};
} forEach _radioNets#0;

// Long range nets
_lines append ["", "<font color='#ffc030' size='16' face='RobotoCondensedBold'>Long Range Nets</font>"];
{
	_lines pushBack format ["%1: CH%2 (%3)", _lrChannels#_forEachIndex, _forEachIndex + 1, _x];
} forEach _radioNets#1;

_lines append ["", format ["Reset to: <execute expression=""(str player splitString '_' select [1, 2] apply { parseNumber _x }) call BRM_FMK_Plugin_RadioFreq_fnc_switchGroup;"">Default</execute>, <execute expression=""[%1, %2] call BRM_FMK_Plugin_RadioFreq_fnc_switchGroup;"">Current</execute>", _squadIndex, _groupIndex]];

if (_init) then {
	BRM_FMK_Plugin_RadioFreq_diaryActiveLines = _lines;

	["BRM_FMK_Plugin_RadioFreq_OnRadiosReceived", "OnRadiosReceived", {
		if (!isNil "BRM_FMK_Plugin_RadioFreq_diaryActiveLines") then {
			/*Yelling*/60 call TFAR_fnc_setVoiceVolume;

			{
				[call ([TFAR_fnc_activeSwRadio, TFAR_fnc_activeLrRadio] select _forEachIndex), _x] call BRM_FMK_Plugin_RadioFreq_fnc_editRadioSettings;
			} forEach BRM_FMK_Plugin_RadioFreq_radioSettings;

			player setDiaryRecordText [["Diary", BRM_FMK_Plugin_RadioFreq_diaryRecord], ["Radio", BRM_FMK_Plugin_RadioFreq_diaryActiveLines joinString "<br />", "\z\tfar\addons\core\ui\ACE_Interaction_Radio_Icon.paa"]];
			BRM_FMK_Plugin_RadioFreq_diaryActiveLines = nil;
		};
	}, player] call TFAR_fnc_addEventHandler;

	private _fnc_saveVehicleRadioSettings = {
		params ["_unit", "_radio", "_radioID"];
		[_unit, [_radio, _radioID]] call BRM_FMK_Plugin_RadioFreq_fnc_saveVehicleRadioSettings;
	};
	{
		[format ["BRM_FMK_Plugin_RadioFreq_%1", _x], _x, _fnc_saveVehicleRadioSettings, player] call TFAR_fnc_addEventHandler;
	} forEach ["OnLRchannelSet", "OnLRstereoSet", "OnLRvolumeSet", "OnLRspeakersSet"];
	["BRM_FMK_Plugin_RadioFreq_OnFrequencyChanged", "OnFrequencyChanged", {
		params ["_unit", "_radio"];

		// Frequency is set after the event is fired...
		[{ _this call BRM_FMK_Plugin_RadioFreq_fnc_saveVehicleRadioSettings; }, [_unit, _radio]] call CBA_fnc_execNextFrame;
	}, player] call TFAR_fnc_addEventHandler;

	player addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];

		[_unit] call BRM_FMK_Plugin_RadioFreq_fnc_handleVehicleRadio;
	}];

	player addEventHandler ["GetOutMan", {
		params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];

		[_unit, true] call BRM_FMK_Plugin_RadioFreq_fnc_handleVehicleRadio;
	}];

	player addEventHandler ["SeatSwitchedMan", {
		params ["_unit", "_otherUnit", "_vehicle"];

		[_unit, true] call BRM_FMK_Plugin_RadioFreq_fnc_handleVehicleRadio;
		[_unit] call BRM_FMK_Plugin_RadioFreq_fnc_handleVehicleRadio;
	}];
} else {
	{
		[call ([TFAR_fnc_activeSwRadio, TFAR_fnc_activeLrRadio] select _forEachIndex), _x] call BRM_FMK_Plugin_RadioFreq_fnc_editRadioSettings;
	} forEach BRM_FMK_Plugin_RadioFreq_radioSettings;

	player setDiaryRecordText [["Diary", BRM_FMK_Plugin_RadioFreq_diaryRecord], ["Radio", _lines joinString "<br />", "\z\tfar\addons\core\ui\ACE_Interaction_Radio_Icon.paa"]];

	[call TFAR_fnc_activeSwRadio, false] call TFAR_fnc_showRadioInfo;
};
