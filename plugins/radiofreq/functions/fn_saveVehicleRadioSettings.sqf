params ["_unit", "_radio"];

private _vehicleLR = _unit call TFAR_fnc_vehicleLR;
if (isNil "_vehicleLR") exitWith {};
if (!isNil { TFAR_currentUnit call TFAR_fnc_backpackLr }) exitWith {};
if (_radio isNotEqualTo _vehicleLR) exitWith {};

_unit setVariable ["BRM_FMK_Plugin_RadioFreq_vehicleLrRadioSettings", _vehicleLR call TFAR_fnc_getLrSettings];
