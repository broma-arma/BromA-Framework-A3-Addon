#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_createGroup

Description:
	Create a group.

Parameters:
	_position - Position to create the group at [PositionATL/Position2D]
	_dir - Direction of group [NUMBER]
	_groupType - Group type [STRING]
	_side - Side [SIDE]
	_loadout - Faction [STRING]
	_settings - Spawner settings [ARRAY]

Returns:
	Created group [GROUP]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_position", "_dir", "_groupType", "_side", "_loadout", "_settings"];

_settings params [""/*_cleanup*/, ""/*_safeSpawnDistance*/, "_disableLAMBS", "_aiAggressive", "_cachingDistances", "_aiSkill"];

private _group = createGroup [_side, true];
_group setVariable ["BRM_FMK_Plugin_AIS_groupType", _groupType];
private _vehicles = [];
_group setVariable ["BRM_FMK_Plugin_AIS_vehicles", _vehicles];

private _sideChar = ["B", "O", "I", "C"] select ([BLUFOR, OPFOR, INDEPENDENT, CIVILIAN] find _side);

{
	private _type = _x;
	if (_type isEqualType []) then { _type = selectRandom _type; }; // TODO Add support for weighted random?

	if (_type isKindOf "Man") then {
		private _unit = _group createUnit [_type, _position, [], 0, "NONE"];
		_unit setDir _dir;
	} else {
		private _vehicle = createVehicle [_type, _position, [], 0, ["NONE", "FLY"] select (_type isKindOf "Air")];
		_vehicle setDir _dir;
		_vehicles pushBack _vehicle;
		_vehicle allowCrewInImmobile [true, true];

		private _crewType = if (_side == CIVILIAN) then {
			call selectRandom [ // TODO Move to function?
				{
					format ["C_man_%1", selectRandom [ // TODO Why are there so many options with the same outfit?
						"1", "1_1_F", "1_2_F", "1_3_F",
						"polo_3_F", "polo_3_F_afro", "polo_3_F_euro", "polo_3_F_asia",
						"p_shorts_1_F", "p_shorts_1_F_afro", "p_shorts_1_F_euro", "p_shorts_1_F_asia",
						"shorts_1_F", "shorts_1_F_afro", "shorts_1_F_euro", "shorts_1_F_asia",
						"shorts_2_F", "shorts_2_F_afro", "shorts_2_F_euro", "shorts_2_F_asia",
						"shorts_3_F", "shorts_3_F_afro", "shorts_3_F_euro", "shorts_3_F_asia",
						"shorts_4_F", "shorts_4_F_afro", "shorts_4_F_euro", "shorts_4_F_asia",
						"5_enoch_F"
					]]
				},
				{ format ["C_man_polo_1_F%1", selectRandom ["", "_afro", "_euro", "_asia"]] },
				{ format ["C_man_polo_2_F%1", selectRandom ["", "_afro", "_euro", "_asia"]] },
				{ format ["C_man_polo_4_F%1", selectRandom ["", "_afro", "_euro", "_asia"]] },
				{ format ["C_man_polo_5_F%1", selectRandom ["", "_afro", "_euro", "_asia"]] },
				{ format ["C_man_%1", selectRandom ["polo_6_F", "polo_6_F_afro", "polo_6_F_euro", "polo_6_F_asia", "6_enoch_F"]] },
				{ format ["C_man_p_%1_F%2", selectRandom ["fugitive", "beggar"], selectRandom ["", "_afro", "_euro", "_asia"]] },
				{ format ["C_man_sport_1_F%1", selectRandom ["", "_afro", "_euro", "_asia", "_tanoan"]] },
				{ format ["C_man_sport_2_F%1", selectRandom ["", "_afro", "_euro", "_asia", "_tanoan"]] },
				{ format ["C_man_sport_3_F%1", selectRandom ["", "_afro", "_euro", "_asia", "_tanoan"]] },
				{ format ["C_Man_casual_1_F%1", selectRandom ["", "_afro", "_euro", "_asia", "_tanoan"]] },
				{ format ["C_Man_casual_2_F%1", selectRandom ["", "_afro", "_euro", "_asia", "_tanoan"]] },
				{ format ["C_Man_casual_3_F%1", selectRandom ["", "_afro", "_euro", "_asia", "_tanoan"]] },
				{ format ["C_Man_casual_4_F%1", selectRandom ["", "_afro", "_euro", "_asia", "_tanoan"]] },
				{ format ["C_Man_casual_5_F%1", selectRandom ["", "_afro", "_euro", "_asia", "_tanoan"]] },
				{ format ["C_Man_casual_6_F%1", selectRandom ["", "_afro", "_euro", "_asia", "_tanoan"]] }
			]
		} else {
			format [switch (true) do {
				case (_vehicle isKindOf "Air"): { "%1_helipilot_F" };
				case !(_vehicle isKindOf "Wheeled_APC" || _vehicle isKindOf "Wheeled_APC_F" || _vehicle isKindOf "Tank"): { "%1_Soldier_F" };
				default { "%1_Crew_F" };
			}, _sideChar]
		};

		{
			_x params ["_role", "_cargoIndex", "_turretPath", "_personTurret"];

			private _unit = _group createUnit [_crewType, getPos _vehicle, [], 0, "NONE"];
			_unit setVariable ["BRM_FMK_Plugin_AIS_vehicle", _vehicle];

			switch (_role) do {
				case "driver": { _unit moveInDriver _vehicle };
				case "commander": { _unit moveInCommander _vehicle };
				case "gunner": { _unit moveInGunner _vehicle };
				case "turret": { _unit moveInTurret [_vehicle, _turretPath] };
				case "cargo": { _unit moveInCargo [_vehicle, _cargoIndex] };
			};

			if (isNull objectParent _unit) then {
				deleteVehicle _unit;
			};
		} forEach ([_vehicle, ["turret", "cargo"]] call BRM_FMK_Plugin_AIS_fnc_getVehicleSeats);
	};
} forEach ([_groupType, _side, _loadout] call BRM_FMK_Plugin_AIS_fnc_getGroupSettings);

_group allowFleeing 0;

if (_disableLAMBS) then {
	_group setVariable ["lambs_danger_disableGroupAI", true];
};

_aiSkill = _aiSkill call BRM_FMK_Plugin_AIS_fnc_getSkillSettings;

{
	private _unit = _x;

	[_unit, _loadout] call BRM_fnc_initAI;

	if (_aiAggressive) then {
		_unit disableAI "COVER";
		_unit disableAI "SUPPRESSION";
		_unit disableAI "AUTOCOMBAT";
	};

	if (_disableLAMBS) then {
		_unit setVariable ["lambs_danger_disableAI", true];
	};

	_unit setUnitPos "UP";

	{
		_unit setSkill _x;
	} forEach _aiSkill;
} forEach units _group;

if (BRM_FMK_Plugin_AIS_debug) then {
	[_group, _groupType] call BRM_FMK_Plugin_AIS_fnc_createGroupMarker;
};

if (_cachingDistances isNotEqualTo [0, 0]) then {
	[_group, _cachingDistances] call BRM_FMK_Plugin_AIS_fnc_cacheGroup;
};

_group
