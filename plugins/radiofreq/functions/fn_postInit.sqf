if !(isMultiplayer && hasInterface && isClass (configFile >> "CfgPatches" >> "task_force_radio") && { !(player isKindOf "VirtualMan_F") }) exitWith {};

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
	if (!isNil "_x") then {
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
	};
} forEach _radioNets#0;

str player splitString "_" params ["", "_squadIndex", "_groupIndex"];
[parseNumber _squadIndex, parseNumber _groupIndex, true] call BRM_FMK_Plugin_RadioFreq_fnc_switchGroup;

TF_speak_volume_level = "yelling";
TF_last_speak_volume_level = TF_speak_volume_level;
TF_speak_volume_meters = 60;
TF_last_speak_volume_meters = TF_speak_volume_meters;

BRM_FMK_Plugin_RadioFreq_init = true;

["group", {
    params ["_unit", "_oldGroup", "_newGroup"];

	if (_unit == player) then {
		private _groupVar = _newGroup getVariable "BRM_FMK_Engine_fnc_groupVar";
		if (!isNil "_groupVar") then {
			_groupVar splitString "_" params ["", "_squadIndex", "_groupIndex"];
			[parseNumber _squadIndex, parseNumber _groupIndex, false] call BRM_FMK_Plugin_RadioFreq_fnc_switchGroup;
		};
	};
}] call CBA_fnc_addPlayerEventHandler;

["BRM_FMK_Plugin_RadioFreq_OnRadiosReceived", "OnRadiosReceived", {
	params ["_unit", "_radios"];
	if (_unit != player) exitWith {};

	if (!isNil "BRM_FMK_Plugin_RadioFreq_diaryActiveLines") then {
		player setDiaryRecordText [["Diary", BRM_FMK_Plugin_RadioFreq_diaryRecord], ["Radio", BRM_FMK_Plugin_RadioFreq_diaryActiveLines joinString "<br />", "\z\tfar\addons\core\ui\ACE_Interaction_Radio_Icon.paa"]];
		BRM_FMK_Plugin_RadioFreq_diaryActiveLines = nil;
	};

	if (BRM_FMK_Plugin_RadioFreq_init && { call TFAR_fnc_activeSwRadio in _radios }) then {
		BRM_FMK_Plugin_RadioFreq_init = false;
		private _settings = player getVariable "BRM_FMK_Plugin_RadioFreq_swSettings";
		if (!isNil "_settings") then {
			[call TFAR_fnc_activeSwRadio, _settings] call TFAR_fnc_setSwSettings;
			player setVariable ["BRM_FMK_Plugin_RadioFreq_swSettings", nil];
		} else {
			{
				[call ([TFAR_fnc_activeSwRadio, TFAR_fnc_activeLrRadio] select _forEachIndex), _x] call BRM_FMK_Plugin_RadioFreq_fnc_editRadioSettings;
			} forEach BRM_FMK_Plugin_RadioFreq_radioSettings;
		};
	} else {
		private _radioSettings = BRM_FMK_Plugin_RadioFreq_radioSettings select 0;
		{
			[_x, _radioSettings] call BRM_FMK_Plugin_RadioFreq_fnc_editRadioSettings;
		} forEach _radios;
	};
}, objNull] call TFAR_fnc_addEventHandler;

private _fnc_saveVehicleRadioSettings = {
	params ["_unit", "_radio", "_radioID"];
	[_unit, [_radio, _radioID]] call BRM_FMK_Plugin_RadioFreq_fnc_saveVehicleRadioSettings;
};
{
	[format ["BRM_FMK_Plugin_RadioFreq_%1", _x], _x, _fnc_saveVehicleRadioSettings, objNull] call TFAR_fnc_addEventHandler;
} forEach ["OnLRchannelSet", "OnLRstereoSet", "OnLRvolumeSet", "OnLRspeakersSet"];
["BRM_FMK_Plugin_RadioFreq_OnFrequencyChanged", "OnFrequencyChanged", {
	params ["_unit", "_radio"];

	// Frequency is set after the event is fired...
	[{ _this call BRM_FMK_Plugin_RadioFreq_fnc_saveVehicleRadioSettings; }, [_unit, _radio]] call CBA_fnc_execNextFrame;
}, objNull] call TFAR_fnc_addEventHandler;

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

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	player setVariable ["BRM_FMK_Plugin_RadioFreq_swSettings", call TFAR_fnc_activeSwRadio call TFAR_fnc_getSwSettings];
	player setVariable ["BRM_FMK_Plugin_RadioFreq_lrSettings", call TFAR_fnc_activeLrRadio call TFAR_fnc_getLrSettings];

	BRM_FMK_Plugin_RadioFreq_init = true;
}];

["CBA_loadoutSet", {
	params ["_unit", "_loadoutArray", "_extendedInfo"];

	if (_unit != player || { !(backpack player call TFAR_fnc_isLRRadio) }) exitWith {};

	private _settings = player getVariable "BRM_FMK_Plugin_RadioFreq_lrSettings";
	if (!isNil "_settings") then {
		[{ [call TFAR_fnc_activeLrRadio, _this] call TFAR_fnc_setLrSettings; }, _settings] call CBA_fnc_execNextFrame;
		player setVariable ["BRM_FMK_Plugin_RadioFreq_lrSettings", nil];
	};
}] call CBA_fnc_addEventHandler;
