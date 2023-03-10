params ["_vehicle","_group"];

private _riflemanType = if (side _group == west) then {"B_Soldier_F"} else { if (side _group == east) then {"O_Soldier_F"} else {"I_Soldier_F"}};
private _crewmanType = if (side _group == west) then {"B_Crew_F"} else { if (side _group == east) then {"O_Crew_F"} else {"I_Crew_F"}};
private _pilotType = if (side _group == west) then {"B_helipilot_F"} else { if (side _group == east) then {"O_helipilot_F"} else {"I_helipilot_F"}};
private _crewmanClassname = if (_vehicle isKindOf "LandVehicle") then {if (_vehicle isKindOf "Car") then {_riflemanType} else {_crewmanType}} else {_pilotType};
private _vehicleSeats = [typeOf _vehicle,["cargo","turret"],_vehicle] call BRM_FMK_AIS_getVehicleSeats;

{
	_x params ["_unit","_role","_cargoIndex","_turretPath","_personTurret"];

	private _crewman = _group createUnit [_crewmanClassname, getPos _vehicle, [], 50, "NONE"];

	switch (_role) do {
		case "driver": { _crewman moveInDriver _vehicle};
		case "commander": { _crewman moveInCommander _vehicle };
		case "gunner": { _crewman moveInGunner _vehicle };
		case "turret": { _crewman moveInTurret [_vehicle,_turretPath] };
	};

	if (vehicle _crewman == _crewman) then {
		deleteVehicle _crewman;
	};

} forEach _vehicleSeats;
