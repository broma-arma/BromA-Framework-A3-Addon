/* ----------------------------------------------------------------------------
Function: BRM_FMK_ACE_fnc_createPatient

Description:
	Create an ACE3 patient.

Parameters:
	_position - Position to create the patient at [POSITION]
	_side - Patient side [SIDE, defaults to BLUFOR]
	_group - Patient group [GROUP, defaults to grpNull]
	_direction - Patient direction [NUMBER, defaults to 0]

Returns:
	Created patient [OBJECT]

Examples:
	[getPos player] call BRM_FMK_ACE_fnc_createPatient;

Author:
	Coryf88
---------------------------------------------------------------------------- */

#define BODY_PARTS ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]
#define DAMAGE_TYPES ["bullet", "grenade", "explosive", "shell", "backblast"]
#define PULSEOXIMETER_CHANCE 0.8
#define WOUND_COUNT floor random [2, 4, 6]
#define WOUND_DAMAGE random [0.2, 0.5, 1]

params [
	["_position", [], [[]], [2, 3]],
	["_side", BLUFOR, [sideUnknown]],
	["_group", grpNull, [grpNull]],
	["_direction", 0, [0]]
];

if (_position isEqualTo []) exitWith {};

if (isNull _group) then {
	_group = createGroup _side;
};

private _sideIndex = [INDEPENDENT, OPFOR, BLUFOR, CIVILIAN] find _side;
private _type = if (_sideIndex != 3) then { format ["%1_Survivor_F", ["I", "O", "B"] select _sideIndex] } else { "C_man_1" };
private _patient = _group createUnit [_type, _position, [], 0, "CAN_COLLIDE"];
_patient setDir _direction;
_patient setUnitPos "DOWN"; // Stay down
_patient switchMove ["AinjPpneMstpSnonWrflDnon"]; // Start in injured animation

{
	_patient disableAI _x;
} forEach ["AUTOCOMBAT", "CHECKVISIBLE", "PATH", "MOVE", "FSM"];

// Prevent instant death in Unconscious (and CardiacArrest, see postInit) state.
// https://github.com/acemod/ACE3/blob/d0449d8f6f65b73377ef1c816e40e005aca39c50/addons/medical_statemachine/Statemachine.hpp#L49
_patient setVariable ["ace_medical_statemachine_AIUnconsciousness", true];

// Prevent instant death in CardiacArrest (and FatalInjury, see postInit) state.
// https://github.com/acemod/ACE3/blob/d0449d8f6f65b73377ef1c816e40e005aca39c50/addons/medical_statemachine/functions/fnc_conditionExecutionDeath.sqf#L25
_patient setVariable ["ace_medical_deathBlocked", true];

if (mission_KAT_enabled) then {
	// Prevent instant death in FatalInjury state.
	// https://github.com/KAT-Advanced-Medical/KAM/blob/db936bf970675ec755fb1a5756411e0640e98447/addons/misc/functions/fnc_conditionSecondChance.sqf#L24
	_patient setVariable ["kat_misc_PreventInstantAIDeath", true];

	// Disable simplified vital calculations, if enabled.
	if (_patient getVariable ["kat_vitals_simpleMedical", false]) then {
		_patient setVariable ["kat_vitals_simpleMedical", false, true];
	};
};

// Prevent AI self-healing, if enabled.
// https://github.com/acemod/ACE3/blob/d0449d8f6f65b73377ef1c816e40e005aca39c50/addons/medical_ai/functions/fnc_isSafe.sqf#L18
_patient setVariable ["ace_medical_ai_lastFired", CBA_missionTime + 86400]; // 1 day

if (mission_KAT_enabled && { random 1 < PULSEOXIMETER_CHANCE }) then {
	// Attach kat_Pulseoximeter
	["kat_breathing_pulseoxLocal", [_patient, _patient, "rightarm"]] call CBA_fnc_localEvent;
};

for "_i" from 1 to WOUND_COUNT do {
	[_patient, WOUND_DAMAGE, selectRandom BODY_PARTS, selectRandom DAMAGE_TYPES] call ace_medical_fnc_addDamageToUnit;
};

// TODO Randomize blood loss?

// Force unconcious
["ace_medical_FatalVitals", _patient] call CBA_fnc_localEvent;

_patient
