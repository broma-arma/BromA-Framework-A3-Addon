diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_vehicle", "_group"];

private _sideIndex = [west, east, resistance] find side _group;
if (_sideIndex == -1) exitWith {
	["[BrmFmk.AIS] Cannot create vehicle crew for side %1 (%2, %3)", side _group, _vehicle, _group] call BIS_fnc_error;
};

private _sideChar = ["B", "O", "I"] select _sideIndex;
private _riflemanType = _sideChar + "_Soldier_F";
private _crewmanType = _sideChar + "_Crew_F";
private _pilotType = _sideChar + "_helipilot_F";

private _type = if (_vehicle isKindOf "LandVehicle") then {
	[_crewmanType, _riflemanType] select (_vehicle isKindOf "Car")
} else {
	_pilotType
};

// TODO Should sort unit creation based on leadership priority. E.g. "commander" > "gunner" > "turret" (Non-FFV) > "driver" > "cargo"
{
	_x params ["_unit", "_role", ""/*_cargoIndex*/, ""/*_turretPath*/, ""/*_personTurret*/, "_assignedUnit"/*, "_positionName"*/];
	if (isNull _unit && isNull _assignedUnit && _role in ["driver", "commander", "gunner"]) then {
		private _unit = _group createUnit [_type, _vehicle, [], 0, "NONE"];
		switch (_role) do {
			case "driver":    { _unit moveInDriver _vehicle; };
			case "commander": { _unit moveInCommander _vehicle; };
			case "gunner":    { _unit moveInGunner _vehicle; };
		};
	};
} forEach ([typeOf _vehicle, ["cargo", "turret"], _vehicle] call BRM_FMK_AIS_fnc_getVehicleSeats);
