/*
================================================================================

NAME:
    BRM_FMK_SpawnAI_fnc_infantry

AUTHOR(s):
    Nife

DESCRIPTION:
    Spawns AI groups with specific parameters, with room for a LOT of variation.

PARAMETERS:
    0 - Side of the units. (SIDE)
    1 - Loadout. (STRING)
    2 - Type of units. 0: Regular infantry, 1: Recon, 2: Snipers (NUMBER)
    3 - How many groups will be spawned. (NUMBER)
    4 - The size of the groups. 0: Duo, 1: Fire-team, 2: Squad, 3: Platoon (NUMBER)
    5 - Unit skill. (SCALAR)
    6 - Behavior. (STRING)
    7 - Combat mode. (STRING)
    8 - Task. "ATTACK" / "DEFEND" / "PATROL" / "PARADROP" (STRING)
    9 - Possible vehicles to be used. This may be left empty. (ARRAY of VEHICLES)
    10 - Whether the vehicle will return after dropping off the infantry. (BOOLEAN)
    11 - Possible starting points. (ARRAY of MARKERS)
    12 - Possible LZ/drop-off points. This may be left empty. (ARRAY of MARKERS)
    13 - Possible end points. (ARRAY of MARKERS)
    14 - Radius of spawn: [Start, LZ, End] (ARRAY)

USAGE:
   [BLUFOR, "USARMY", 0, 2, 1, 0.5, "AWARE", "YELLOW", "PARADROP", ["B_Heli_Light_01_F"], true, ["point_2_1"], ["point_2_LZ"], ["point_2_2"], [200,100,50]] spawn BRM_FMK_SpawnAI_fnc_infantry;

   [OPFOR, "VDV", 0, 3, 2, 0.7, "COMBAT", "YELLOW", "ATTACK", ["RHS_Ural_MSV_01"], true, ["point_2_1"], [], ["point_2_2"], [200,100,50]] spawn BRM_FMK_SpawnAI_fnc_infantry;

   [BLUFOR, "CSAT", 2, 5, 1, 1, "COMBAT", "YELLOW", "PATROL", [], true, ["point_2_1","point_1_1","point_3_1"], [], ["point_2_2", "point_1_2"], [200,100,50]] spawn BRM_FMK_SpawnAI_fnc_infantry;

RETURNS:
    Nothing.

NOTES:
    Must be executed on the AI controller.

================================================================================
*/

// waitUntil{(time > 1)};

if (!mission_ai_controller) exitWith {};

params [
	"_side",
	"_loadout",
	"_type",
	"_amount",
	"_size",
	"_skill",
	"_behavior",
	"_combat",
	"_task",
	"_transport",
	"_treturns",
	"_starting",
	"_LZ",
	"_end",
	"_radius"
];
_radius params ["_radiusStart", "_radiusLZ", "_radiusEnd"];

private _unitsInfantry = [
	"Soldier_TL", "Soldier_SL", "officer", "Soldier", "Soldier_LAT",
	"medic", "Soldier_AT", "soldier_M", "Soldier_AR", "Soldier_A",
	"Soldier_GL"
];

private _uPrefix = switch (_side) do {
	case BLUFOR: { "B" };
	case OPFOR: { "O" };
	case INDEPENDENT: { "I" };
	default { _side = BLUFOR; "B" };
};

_size = switch (_size) do {
	case 0: { 2 };
	case 1: { 4 };
	case 2: { 10 };
	case 3: { 20 };
};

private _uUnits = switch (_type) do {
	case 0: { _unitsInfantry }; // Infantry
	case 1: { ["recon_TL", "recon", "recon_medic", "recon_exp"] }; // Recon
	case 2: { ["sniper", "spotter"] }; // Sniper
};

for "_i" from 1 to _amount do {
	private _group = createGroup _side;
	private _startPos = getMarkerPos selectRandom _starting getPos [_radiusStart, random 360];
	private _endPos = getMarkerPos selectRandom _end getPos [_radiusEnd, random 360];

	private _leader = objNull;

	for "_j" from 0 to _size do {
		private _unitIndex = 0;
		if (_j == 0) then {
			if (_type == 0) then { // Infantry
				_unitIndex = switch (_size) do {
					case 2: { 3 }; // duo
					case 4: { 0 }; // fireteam
					case 10: { 1 }; // squad
					case 20: { 2 }; // platoon
				};
			};
		} else {
			_unitIndex = [3, count _uUnits - 1] call BIS_fnc_randomInt;
		};

		private _unitName = format ["%1_%2_F", _uPrefix, _uUnits select _unitIndex];

		private _unit = [_group, _unitName, _startPos, _skill, _loadout, _unitIndex] call BRM_FMK_SpawnAI_fnc_spawnUnit;

		if (_j == 0) then { _leader = _unit };

	};

	private _groupSize = count units _group;

	if (count _transport > 0) then {
		private _finalLZ = _endPos;
		if (count _LZ > 0) then { _finalLZ = getMarkerPos (selectRandom _LZ) };

		_finalLZ = _finalLZ getPos [_radiusLZ, random 360];

		//private _landingPad = "HeliHEmpty" createVehicle _finalLZ;

		private _vehicle = selectRandom _transport createVehicle _startPos;

		[{ // Delete vehicle and crew after 5 minutes of not moving or 60 seconds after destroyed.
			params ["_args", "_handle"];
			_args params ["_vehicle", "_count"];

			if (speed _vehicle == 0) then {
				_count = _count + 1;
				_args set [1, _count];
			} else {
				if (_count > 0) then {
					_count = 0;
					_args set [1, _count];
				};
			};
			if (!alive _vehicle || _count >= 240) exitWith {
				[{ { deleteVehicle _x } forEach crew _vehicle; deleteVehicle _vehicle; }, _vehicle, 60] call CBA_fnc_waitAndExecute;
				[_handle] call CBA_fnc_removePerFrameHandler;
			};
		}, 1, [_vehicle, 0]] call CBA_fnc_addPerFrameHandler;

		private _crewGroup = createGroup _side;

		private _createdCrew = [];

		private _crew = switch (true) do {
			case (_vehicle isKindOf "Tank"): { ["crew"] };
			case (_vehicle isKindOf "Helicopter"): { ["helipilot", "helicrew"] };
			case (_vehicle isKindOf "Plane"): { ["Pilot"] };
			default { _unitsInfantry };
		};

		private _driver = [_crewGroup, format ["%1_%2_F", _uPrefix, _crew select 0], _startPos, _skill, _loadout] call BRM_FMK_SpawnAI_fnc_spawnUnit;

		_driver setVariable ["can_leave_LZ", true];

		_driver moveInDriver _vehicle;

		_createdCrew pushBack _driver;

		private _spawnCrew = true;

		while { _vehicle emptyPositions "commander" > 0 && _vehicle emptyPositions "gunner" > 0 } do {
			private _unit = [_crewGroup, format ["%1_%2_F", _uPrefix, (_crew select ((count _crew)-1))], _startPos, _skill, _loadout] call BRM_FMK_SpawnAI_fnc_spawnUnit;
			if (_vehicle emptyPositions "commander" > 0) then {
				_unit moveInCommander _vehicle;
			} else {
				_unit moveInGunner _vehicle;
			};
			_createdCrew pushBack _unit;
		};

		{
			if (_vehicle emptyPositions "cargo" > 0) then {
				_x moveinCargo _vehicle;
				if (vehicle _x == _x) then {
					deleteVehicle _x;
					["LOCAL", "CHAT", format ["WARNING: %1 is out of spaces in %2", _x, _vehicle]] call BRM_FMK_fnc_doLog;
				};
			} else {
				deleteVehicle _x;
				["LOCAL", "CHAT", format ["WARNING: %1 is out of spaces in %2", _x, _vehicle]] call BRM_FMK_fnc_doLog;
			};
		} forEach units _group;

		["LOCAL", "CHAT", format["Group %1 with %2 units finished generating.", _group, count units _group]] call BRM_FMK_fnc_doLog;

		private _wp = _crewGroup addWaypoint [_finalLZ, 0];
		[_crewGroup, 0] setWaypointBehaviour _behavior;
		[_crewGroup, 0] setWaypointCombatMode _combat;

		if (_task == "PARADROP") then {
			_driver setVariable ["drop_ready", false];
			_driver setVariable ["can_leave_LZ", false];

			_wp setWaypointType "MOVE";
			[_crewGroup, 0] setWaypointSpeed "LIMITED";
			_wp setWaypointStatements ["true", "this setVariable ['drop_ready', true]; this setVariable ['can_leave_LZ', true];"];

			_vehicle flyInHeight 100;

			["LOCAL", "CHAT", "Received order to paradrop."] call BRM_FMK_fnc_doLog;

			[_group, _driver, _endPos] spawn {
				params ["_group", "_driver", "_endPos"];

				["LOCAL", "CHAT", "Waiting to approach LZ."] call BRM_FMK_fnc_doLog;
				waitUntil { sleep 1; _driver getVariable ["drop_ready", false] };

				["LOCAL", "CHAT", "Everyone jump!"] call BRM_FMK_fnc_doLog;

				{ removeBackpack _x; _x addBackpack "B_Parachute" } forEach units _group;

				{
					[_x] orderGetIn false;
					moveOut _x;
					_x action ["eject", vehicle _x];
					["LOCAL", "CHAT", name _x + " is now attempting to jump."] call BRM_FMK_fnc_doLog;
					sleep (random 0.5 + 0.5);
				} forEach units _group;
			};
		} else {
			_wp setWaypointType "TR UNLOAD";
		};

		if (_treturns) then {
			[_crewGroup, _startPos, _driver, _combat] spawn {
				params ["_crewGroup", "_startPos", "_driver", "_combat"];
				private _vehicle = vehicle _driver;

				waitUntil { _driver getVariable ["can_leave_LZ", false] };

				sleep 3;

				["LOCAL", "CHAT", "Transport now returning to base."] call BRM_FMK_fnc_doLog;

				_driver moveInDriver _vehicle;
				_driver assignAsDriver _vehicle;

				private _wp = _crewGroup addWaypoint [_startPos, 1];
				[_crewGroup, 1] setWaypointCompletionRadius 50;
				[_crewGroup, 1] setWaypointBehaviour "CARELESS";
				[_crewGroup, 1] setWaypointCombatMode _combat;
				[_crewGroup, 1] setWaypointSpeed "FULL";
				_wp setWaypointType "MOVE";
				_wp setWaypointStatements ["true", "{ _veh = vehicle _x; deleteVehicle _x; deleteVehicle _veh } forEach thislist"];
			};
		};

		[_task, _vehicle, _group, _groupSize, _endPos, _radiusEnd, _behavior, _combat] spawn {
			params ["_task", "_vehicle", "_group", "_groupSize", "_endPos", "_radiusEnd", "_behavior", "_combat"];

			if (_task == "PARADROP") then {
				waitUntil { getPos _vehicle select 2 > 5 };
				waitUntil {
					sleep 1;
					units _group findIf { getPos vehicle _x select 2 > 1 } == -1
				};

				["LOCAL", "CHAT", "We have paradropped successfully."] call BRM_FMK_fnc_doLog;

				waitUntil {
					sleep 1;
					units _group findIf { getPos _x distance getPos leader _group > 15 } == -1
				};

				["LOCAL", "CHAT", format ["All units regrouped, suffered %1 casualties.", _groupSize - count units _group]] call BRM_FMK_fnc_doLog;

				[_group, _endPos, 50] call CBA_fnc_taskAttack;
			};

			["LOCAL", "CHAT", "Moving to designated way-point."] call BRM_FMK_fnc_doLog;

			switch (_task) do {
				case "ATTACK": { [_group, _endPos, 50] call CBA_fnc_taskAttack; };
				case "DEFEND": { [_group, _endPos, 50, 2, true] call CBA_fnc_taskDefend; };
				case "PATROL": { [_group, _endPos, _radiusEnd, 7, "MOVE", _behavior, _combat, "FULL", "NO CHANGE", "", [3, 6, 9]] call CBA_fnc_taskPatrol; };
				case "MOVE": { [_group, _endPos, _radiusEnd, "MOVE", _behavior, _combat, "FULL", "COLUMN"] call CBA_fnc_addWaypoint; };
			};
		};
	} else {
		switch (_task) do {
			case "ATTACK": { [_group, _endPos, 50] call CBA_fnc_taskAttack; };
			case "DEFEND": { [_group, _endPos, 50, 2, true] call CBA_fnc_taskDefend; };
			case "PATROL": { [_group, _endPos, _radiusEnd, 7, "MOVE", _behavior, _combat, "FULL", "NO CHANGE", "", [3, 6, 9]] call CBA_fnc_taskPatrol; };
			case "MOVE": { [_group, _endPos, _radiusEnd, "MOVE", _behavior, _combat, "FULL", "COLUMN"] call CBA_fnc_addWaypoint; };
		};

		_group setBehaviour _behavior;
		_group setCombatMode _combat;
	};

	if (AI_spawn_enable_caching) then { [_group, _loadout, _skill] spawn BRM_FMK_SpawnAI_fnc_cacheUnits };
};
