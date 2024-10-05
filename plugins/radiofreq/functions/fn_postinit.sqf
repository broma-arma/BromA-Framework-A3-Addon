if (!hasInterface || !isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

private _sideID = player call BIS_fnc_objectSide call BIS_fnc_sideID;
if (_sideID > 3) exitWith {};

private _lrChannels = ["Infantry", "Support/Logistics"];

str player splitString "_" params ["", "_squadIndex", "_groupIndex"];
_squadIndex = parseNumber _squadIndex;
_groupIndex = parseNumber _groupIndex;

private _radioNets = BRM_FMK_Plugin_RadioFreq_radioNets select _sideID;

private _defaultCallsigns = [[OPFOR, BLUFOR, INDEPENDENT, CIVILIAN] select _sideID, "callsigns"] call BRM_FMK_fnc_getSideInfo;

{
	private _squadIndex = _forEachIndex;
	{
		private _groupIndex = _forEachIndex - 1;
		if (!isNil "_x") then {
			_x params ["_name", ""];

			if (_name == "") then {
				if (_defaultCallsigns isEqualType []) then {
					private _groupName = _defaultCallsigns param [_squadIndex, ""];
					if (_groupIndex > 0 && _groupName != "") then {
						_groupName = format ["%1 %2", _groupName, _groupIndex];
					};
					_x set [0, if (_groupIndex == -1) then {
						_groupName splitString " " param [0, ""]
					} else {
						_groupName
					}];
				} else {
					_x set [0, _defaultCallsigns];
				};
			};
		};
	} forEach _x;
} forEach _radioNets#0;

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

_srSettings#2 set [6, _squadRadioNets#0#1]; // Channel 7 frequency
_lines set [7, format (["CH%1: %2 (Squad Net, %3)", 7] + _squadRadioNets#0)];

_srSettings#2 set [7, _radioNets#0#0#0#1]; // Channel 8 frequency
_lines set [8, format (["CH%1: %2 (Squad Net, %3)", 8] + _radioNets#0#0#0)];

if (_squadIndex != 0 || _groupIndex != 0) then {
	_srSettings set [3, 1]; // Stereo, Left
};
_srSettings set [5, 7]; // Additional channel
_srSettings set [6, 2]; // Additional stereo, Right

_lines = _lines select { !isNil "_x" };
_lines append ["", "<font color='#ffc030' size='16' face='RobotoCondensedBold'>Long Range</font>"];

// Long range
{
	_lrSettings#2 set [_forEachIndex, _x];
	_lines pushBack format (["CH%1: %2 (%3)", _forEachIndex + 1, _lrChannels#_forEachIndex, _x]);
} foreach _radioNets#1; // [_lrChannel0 frequency, _lrChannel1 frequency, ...]

if (_squadIndex > 7 || { player getVariable "unitInit" param [2, ""] == "rto" }) then {
	_lrSettings set [0, 1]; // Switch to channel 2
};

BRM_FMK_Plugin_RadioFreq_radioSettings = [_srSettings, _lrSettings];

if (!isNil "BRM_FMK_Plugin_RadioFreq_diary") then { player removeDiaryRecord ["Diary", BRM_FMK_Plugin_RadioFreq_diary]; };
BRM_FMK_Plugin_RadioFreq_diaryRecord = player createDiaryRecord ["Diary", ["Radio", _lines joinString "<br />", "\z\tfar\addons\core\ui\ACE_Interaction_Radio_Icon.paa"]];

// Short range nets
_lines append [
	"",
	"<font color='#ffc030' size='16' face='RobotoCondensedBold'>Short Range Nets</font>",
	"Group (Squad)"
];

{
	_x#0 params ["_squadName", "_squadFrequency"];
	{
		if (_forEachIndex == 0) then { continue; };
		if (!isNil "_x") then {
			_x params ["_groupName", "_frequency"];
			_lines pushBack format ["<execute expression=""private _radio = call TFAR_fnc_activeSwRadio; [_radio, 6, '%2'] call TFAR_fnc_setChannelFrequency; [_radio, 5] call TFAR_fnc_setSwChannel; [_radio, false] call TFAR_fnc_showRadioInfo;"">%1</execute> (<execute expression=""private _radio = call TFAR_fnc_activeSwRadio; [_radio, 6, '%4'] call TFAR_fnc_setChannelFrequency; [_radio, 5] call TFAR_fnc_setSwChannel; [_radio, false] call TFAR_fnc_showRadioInfo;"">%3</execute>)", _groupName, _frequency, _squadName, _squadFrequency];
		};
	} forEach _x;
} forEach _radioNets#0;

// Long range nets
_lines append ["", "<font color='#ffc030' size='16' face='RobotoCondensedBold'>Long Range Nets</font>"];

{
	_lines pushBack format ["%1: CH%2 (%3)", _lrChannels#_forEachIndex, _forEachIndex + 1, _x];
} forEach _radioNets#1;

BRM_FMK_Plugin_RadioFreq_diaryActiveLines = _lines;

["BRM_FMK_Plugin_RadioFreq", "OnRadiosReceived", {
	{
		private _radio = call ([TFAR_fnc_activeSwRadio, TFAR_fnc_activeLrRadio] select _forEachIndex);
			if (!isNil "_radio") then {
			private _settings = _radio call ([TFAR_fnc_getSwSettings, TFAR_fnc_getLrSettings] select _forEachIndex);

			{
				if (_forEachIndex == 2) then { // Channel frequencies
					{
						if (!isNil "_x") then {
							_settings#2 set [_forEachIndex, _x];
						};
					} forEach _x;
				} else {
					if (!isNil "_x") then {
						_settings set [_forEachIndex, _x];
					};
				};
			} forEach _x;

			[_radio, _settings] call ([TFAR_fnc_setSwSettings, TFAR_fnc_setLrSettings] select _forEachIndex);
		};
	} forEach BRM_FMK_Plugin_RadioFreq_radioSettings;

	player setDiaryRecordText [["Diary", BRM_FMK_Plugin_RadioFreq_diaryRecord], ["Radio", BRM_FMK_Plugin_RadioFreq_diaryActiveLines joinString "<br />", "\z\tfar\addons\core\ui\ACE_Interaction_Radio_Icon.paa"]];
	BRM_FMK_Plugin_RadioFreq_diaryRecord = nil;
	BRM_FMK_Plugin_RadioFreq_diaryActiveLines = nil;
}, player] call TFAR_fnc_addEventHandler;
