params ["_unit", ["_leave", false]];

if (_leave) exitWith {
	private _previousLrRadio = _unit getVariable "BRM_FMK_Plugin_RadioFreq_previousLrRadio";
	if (!isNil "_previousLrRadio") then {
		[_previousLrRadio, true] call TFAR_fnc_radioOn;
		_previousLrRadio call TFAR_fnc_setActiveLrRadio;
		_unit setVariable ["BRM_FMK_Plugin_RadioFreq_previousLrRadio", nil];
	};
};

private _vehicleRadio = _unit call TFAR_fnc_vehicleLR;
if (!isNil "_vehicleRadio") then {
	private _lrRadio = call TFAR_fnc_activeLrRadio;
	if (!isNil "_lrRadio" && { _lrRadio isNotEqualTo _vehicleRadio }) then { // Switch to vehicle radio, +10 km distance
		[_lrRadio, _vehicleRadio] call TFAR_fnc_copySettings;
		[_lrRadio, false] call TFAR_fnc_radioOn;
		_unit setVariable ["BRM_FMK_Plugin_RadioFreq_previousLrRadio", _lrRadio];
		_vehicleRadio call TFAR_fnc_setActiveLrRadio;
	} else {
		private _sideID = _unit call BIS_fnc_objectSide call BIS_fnc_sideID;
		if (!TFAR_radioCodesDisabled) then {
			private _unitEncryption = [TFAR_radiocode_east, TFAR_radiocode_west, TFAR_radiocode_independent] select _sideID;
			if (_vehicleRadio call TFAR_fnc_getLrRadioCode != _unitEncryption) then {
				[_vehicleRadio, _unitEncryption] call TFAR_fnc_setLrRadioCode;
			};
		};

		{
			[_vehicleRadio, _forEachIndex + 1, _x] call TFAR_fnc_setChannelFrequency;
		} foreach BRM_FMK_Plugin_RadioFreq_radioNets#_sideID#1; // [_lrChannel0 frequency, _lrChannel1 frequency, ...]

		[_vehicleRadio, 1] call TFAR_fnc_setLrChannel; // Active channel 2
		[_vehicleRadio, 2] call TFAR_fnc_setLrStereo; // Stereo, Right
	};
};
