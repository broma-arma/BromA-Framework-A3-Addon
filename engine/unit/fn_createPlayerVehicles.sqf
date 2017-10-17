if !(isServer) exitWith {};

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"

private _allMarkers = (missionConfigFile >> "Mission" >> "Mission" >> "Entities");
for "_i" from 1 to ((count _allMarkers) - 1) do {
	private _cfgMarker = _allMarkers select _i;
	if (getText (_cfgMarker >> "dataType") == "Marker") then {
		private _name = getText (_cfgMarker >> "name");
		if (_name find "_" != -1) then {
			if (_name select [0, 3] == "veh") then {
				private _pos = getMarkerPos _name;
				private _dir = markerDir _name;
				deleteMarker _name;

				(_name splitString "_") params ["_vehVar", "_side", "_vehType", "_vehId"];

				private _index = -1;
				private _cargo = [];
				switch (toLower _vehType) do {
					case "antiair":        { _index = AA_VEHICLES; };
					case "attackhelo":     { _index = ATTACK_HELOS;     _cargo = ["parachutes"]; };
					case "attackplane":    { _index = ATTACK_PLANES;    _cargo = ["parachutes"]; };
					case "heavyvehicle":   { _index = HEAVY_VEHICLES; };
					case "lightvehicle":   { _index = LIGHT_VEHICLES;   _cargo = ["ammo", "at"]; };
					case "mediumvehicle":  { _index = MEDIUM_VEHICLES;  _cargo = ["ammo_big"]; };
					case "mobilearty":     { _index = MOBILE_ARTILLERY; };
					case "transporthelo":  { _index = TRANSPORT_HELOS;  _cargo = ["ammo", "parachutes", "medical", "medical_adv"]; };
					case "transportplane": { _index = TRANSPORT_PLANES; _cargo = ["parachutes"]; };
					case "truck":          { _index = TRANSPORT_TRUCKS; _cargo = ["ammo_big"]; };
					case "static":         { _index = STATIC_DEFENSE; };
					case "boat":           { _index = BOATS;            _cargo = ["ammo"]; };
					case "support":        { _index = SUPPORT;          _cargo = ["ammo", "medical", "medical_adv"]; };
					case "submarine":      { _index = SUBMARINES; };
					case "mrapvehicle":    { _index = MRAP_VEHICLES;    _cargo = ["ammo", "at"]; };
				};

				if (_index > -1) then {
					([_side] call BRM_FMK_fnc_getFaction) params ["_faction", "_factionSide"];

					private _vehicles = ([_faction, "VEHICLES"] call BRM_fnc_getLoadoutProperty) select _index;
					if (count _vehicles > 0) then {
						private _vehicleClass = "";
						if ({ _x > 47 && _x < 58 } count (toArray _vehId) != count _vehId) then { // [0-9]+
							{ if (toLower _vehId in (toLower _x splitString "_")) exitWith { _vehicleClass = _x; }; } forEach _vehicles;
						};
						if (_vehicleClass == "") then {
							_vehicleClass = _vehicles call BIS_fnc_selectRandom;
						};

						if (_vehicleClass != "" && isClass (configFile >> "CfgVehicles" >> _vehicleClass)) then {
							private _vehicle = createVehicle [_vehicleClass, _pos, [], 0, "NONE"];
							_vehicle setDir _dir;
							if (count _vehVar > 3) then {
								missionNamespace setVariable [_vehVar select [3], _vehicle, true];
							};

							[_vehicle, _faction, _cargo] call BRM_fnc_assignCargo;

							["LOCAL", "F_LOG", format ["MARKER VEHICLE === Created '%1' for '%2' @ %3", _vehicleClass, _name, _pos]] call BRM_FMK_fnc_doLog;
						} else {
							["LOCAL", "F_LOG", format ["MARKER VEHICLE === ERROR: '%1' is not a valid vehicle", _vehicleClass]] call BRM_FMK_fnc_doLog;
						};
					} else {
						["LOCAL", "F_LOG", format ["MARKER VEHICLE === WARNING: No vehicles available for '%1_%2'", _faction, _vehType]] call BRM_FMK_fnc_doLog;
					};
				};
			};
		};
	};
};
server_vehicles_created = true; publicVariable "server_vehicles_created";
