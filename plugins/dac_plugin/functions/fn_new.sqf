#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_DAC_fnc_new

AUTHOR(s):
    Nife

DESCRIPTION:
    Create a DAC camp or zone

PARAMETERS:
    0 - Trigger object. (OBJECT)
    1 - Description of the camp or zone to create. (STRING)

USAGE:
    [trg1, "Create an activated normal default friendly zone named zone1 on network 1, with 1 group of infantry and 2 groups of vehicles."] call BRM_FMK_DAC_fnc_new;

RETURNS:
    Nothing.

================================================================================
*/

if (!mission_AI_controller) exitWith {};

params ["_trigger", "_string"];

private _pos = getPos _trigger;
private _area = triggerArea _trigger;
//private _output = [];
private _units = [[], [], [], []];

#include "includes\dictionary.sqf"

_string = toLower _string;
_string = [_string, ",", ""] call CBA_fnc_replace;
_string = [_string, ".", ""] call CBA_fnc_replace;
_string = [_string, "!", ""] call CBA_fnc_replace;

private _arguments = _string splitString " ";
_arguments = _arguments - IGNORED_WORDS;

private _command = _arguments deleteAt 0;

switch (_command) do {
	case "create": {
		_arguments params [
			"_status",
			"_skill",
			"_faction",
			"_side",
			"_kind",
			"_name",
			"_id"
		];
		_arguments deleteRange [0, 7];

		_side = ["SIDE", _side] call FUNC(strToNum);
		_skill = ["SKILL", _skill] call FUNC(strToNum);
		_faction = ["FACTION", _faction] call FUNC(strToNum);

		switch (_kind) do {
			case "zone": {
				if (ALIAS_RANDOM(_name)) then {
					_name = format ["DACZone%1", count mission_dac_zones + 1];
				};

				_status = switch (_status) do {
					case "activated": { 0 };
					case "deactivated": { 1 };
					case "automatic": { 2 };
					default { ["[WARN ] [DAC Plugin] Unknown zone status '%1', defaulting to 'activated'", _sizeStr] call BIS_fnc_error; 0 };
				};

				if (ALIAS_RANDOM(_id)) then {
					_id = 999999 - count mission_dac_camps - count mission_dac_zones;
				} else {
					_id = parseNumber _id;
				};

				private _fnc_setUnits = {
					_arguments params [
						"_amount",
						"_sizeStr",
						"_typeStr"
					];
					_arguments deleteRange [0, 3];

					_amount = parseNumber _amount;

					private _size = switch (_sizeStr) do {
						case CASE_GROUP_SIZE_1: { 1 };
						case CASE_GROUP_SIZE_2: { 2 };
						case CASE_GROUP_SIZE_3: { 3 };
						case CASE_GROUP_SIZE_4: { 4 };
						default { ["[WARN ] [DAC Plugin] Unknown group size '%1', defaulting to 'group'", _sizeStr] call BIS_fnc_error; 1 };
					};

					private _type = switch (_typeStr) do {
						case CASE_INFANTRY: { 0 };
						case CASE_VEHICLES: { 1 };
						case CASE_TANKS: { 2 };
						case CASE_AIRCRAFTS: { 3 };
						default { ["[WARN ] [DAC Plugin] Unknown group type '%1', defaulting to 'infantry'", _typeStr] call BIS_fnc_error; 0 };
					};

					if (_units select _type isNotEqualTo []) then {
						["[WARN ] [DAC Plugin] Duplicate group type '%1', overrides previous definition", _typeStr] call BIS_fnc_error;
					};

					if (_type == 3) then {
						_units set [_type, [_amount, _size, 40]];
					} else {
						_units set [_type, [_amount, _size, 10, 40]];
					};
				};

				call _fnc_setUnits;
				if (count _arguments > 2) then {
					call _fnc_setUnits;
				};
				if (count _arguments > 2) then {
					call _fnc_setUnits;
				};
				if (count _arguments > 2) then {
					call _fnc_setUnits;
				};

				[_name, _id, _status, _faction, _units select 0, _units select 1, _units select 2, _units select 3, _side, _skill, _area, _pos] call FUNC(createDACZone);
			};

			case "camp";
			case "camps": {
				if (ALIAS_RANDOM(_name)) then {
					_name = format ["DACCamp%1", count mission_dac_camps + 1];
				};

				_status = parseNumber _status;

				private _reinforce = [];

				if !(ALIAS_RANDOM(_id)) then {
					_id = parseNumber _id;

					private _reinforceNetwork = mission_dac_zones select {
						_x params ["_zoneName", "_zoneId"];
						_zoneId == _id
					} apply {
						_x params ["_zoneName", "_zoneId"];
						_zoneName
					};
					_reinforce append _reinforceNetwork;
				};

				_id = 999999 - count mission_dac_camps - count mission_dac_zones;

				_arguments params [
					"_respawns",
					"_units"
				];
				_arguments deleteRange [0, 2];

				_respawns = parseNumber _respawns;

				_units = switch (_units) do {
					case CASE_INFANTRY: { 1 };
					case CASE_VEHICLES: { 2 };
					case CASE_ALL: { 0 };
					default { ["[WARN ] [DAC Plugin] Unknown respawn type '%1', defaulting to 'infantry'", _units] call BIS_fnc_error; 1 };
				};

				_reinforce append _arguments;
				_reinforce = _reinforce arrayIntersect _reinforce;

				_reinforce = _reinforce joinString ",";

				[_name, _id, _status, _faction, _respawns, _units, _reinforce, _side, _skill, _area, _pos] call FUNC(createDACCamp);
			};
		};
	};
};
