/* ----------------------------------------------------------------------------
Function: BRM_FMK_ACE_fnc_actionPatient

Description:
	Add action handler for creating an ACE3 patient.

Parameters:
	_offset - Patient spawn offset [POSITION, defaults to [0, 1, 0]]
	_flip - Invert the patient direction [BOOLEAN, defaults to false]

Returns:
	Nothing

Examples:
	this addAction ["Spawn Patient", { call BRM_FMK_ACE_fnc_actionPatient }];
	this addAction ["Spawn Patient", { call BRM_FMK_ACE_fnc_actionPatient }, [[0, -1, 0]]];

Author:
	Coryf88
---------------------------------------------------------------------------- */

params ["_target", "_caller", "_actionId", ["_arguments", [], [[]]]];
_arguments params [["_offset", [0, 2, 0]], ["_flip", false, [false]]];

private _patient = _target getVariable ["MedicalPatient_patient", objNull];
if (!isNull _patient) then {
	deleteVehicle _patient;
};

private _targetDir = getDir _target;

private _position = getPosASL _target vectorAdd ([_offset, -(_targetDir)] call BIS_fnc_rotateVector2D) select [0, 2];
private _side = side _caller;
private _group = _target getVariable ["MedicalPatient_group", grpNull];
if (isNull _group) then {
	_group = createGroup _side;
	_target setVariable ["MedicalPatient_group", _group, true];
};

_patient = [_position, _side, _group, _targetDir * ([1, -1] select _flip)] call BRM_FMK_ACE_fnc_createPatient;
_target setVariable ["MedicalPatient_patient", _patient, true];

_patient addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	[format ["ace_fire_scream_%1", selectRandom [5, 6, 8, 9, 11, 12, 13, 14]], _unit] call BRM_FMK_fnc_playCfgSound;
	private _causeOfDeath = _unit getVariable ["ace_medical_causeOfDeath", "#scripted"];
	_causeOfDeath = switch (_causeOfDeath) do {
		case "buried_alive": { "Buried Alive" }; // https://github.com/acemod/ACE3/blob/d0449d8f6f65b73377ef1c816e40e005aca39c50/addons/medical_treatment/functions/fnc_placeInBodyBagOrGrave.sqf#L37
		case "ace_vehicle_damage_medicalDamage": { "Vehicle Damage" }; // https://github.com/acemod/ACE3/blob/d0449d8f6f65b73377ef1c816e40e005aca39c50/addons/vehicle_damage/functions/fnc_medicalDamage.sqf#L38
		case "Hunger/Thirst empty": { "Starvation/Dehydration" }; // https://github.com/acemod/ACE3/blob/d0449d8f6f65b73377ef1c816e40e005aca39c50/addons/field_rations/functions/fnc_handleEffects.sqf#L24
		case "respawn_button": { "Manual Respawn" }; // https://github.com/acemod/ACE3/blob/d0449d8f6f65b73377ef1c816e40e005aca39c50/addons/common/functions/fnc_disableUserInput.sqf#L146
		case "#scripted": { "Scripted" };

		// KAT
		case "Fatal_Blood_Oxygen"; // https://github.com/KAT-Advanced-Medical/KAM/blob/db936bf970675ec755fb1a5756411e0640e98447/addons/vitals/functions/fnc_handleUnitVitals.sqf#L159
		case "terminal_SpO2_death": { "Fatal SpO2" }; // https://github.com/KAT-Advanced-Medical/KAM/blob/db936bf970675ec755fb1a5756411e0640e98447/addons/breathing/functions/fnc_handleBreathing.sqf#L86

		// https://github.com/acemod/ACE3/blob/d0449d8f6f65b73377ef1c816e40e005aca39c50/addons/medical_statemachine/functions/fnc_enteredStateDeath.sqf#L27
		default { _causeOfDeath };
	};

	format ["%1 cause of death: %2", [_unit] call ace_common_fnc_getName, _causeOfDeath] remoteExec ["systemChat", allPlayers select { _x distance2D _unit <= 5 }];
}];
