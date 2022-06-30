if (!isServer) exitWith {};

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"

{
	// 'veh' [variableName] '_' SIDE '_' TYPE ['_' vehicleClass] '_' NON_NEGATIVE_INTEGER
	if (_x find "_" != -1 && { _x select [0, 3] == "veh" }) then {
		private _pos = markerPos _x;
		private _dir = markerDir _x;
		deleteMarker _x;

		(_x splitString "_") params ["_vehVar", "_side", "_vehType", "_vehId"];

		(switch (toLower _vehType) do {
			case "antiair":        { [AA_VEHICLES,      []                                ] };
			case "attackhelo":     { [ATTACK_HELOS,     ["parachutes"]                    ] };
			case "attackplane":    { [ATTACK_PLANES,    ["parachutes"]                    ] };
			case "heavyvehicle":   { [HEAVY_VEHICLES,   []                                ] };
			case "lightvehicle":   { [LIGHT_VEHICLES,   ["ammo", "at"]                    ] };
			case "mediumvehicle":  { [MEDIUM_VEHICLES,  ["ammo_big"]                      ] };
			case "mobilearty":     { [MOBILE_ARTILLERY, []                                ] };
			case "transporthelo":  { [TRANSPORT_HELOS,  ["ammo", "parachutes", "medical"] ] };
			case "transportplane": { [TRANSPORT_PLANES, ["parachutes"]                    ] };
			case "truck":          { [TRANSPORT_TRUCKS, ["ammo_big"]                      ] };
			case "static":         { [STATIC_DEFENSE,   []                                ] };
			case "boat":           { [BOATS,            ["ammo"]                          ] };
			case "support":        { [SUPPORT,          ["ammo", "medical"]               ] };
			case "submarine":      { [SUBMARINES,       []                                ] };
			case "mrapvehicle":    { [MRAP_VEHICLES,    ["ammo", "at"]                    ] };
		}) params [["_index", -1], ["_cargo", []]];

		if (_index > -1) then {
			([_side] call BRM_FMK_fnc_getFactionInfo) params ["_faction", "_factionSide"];

			private _vehicles = ([_faction, "VEHICLES"] call BRM_FMK_fnc_getLoadoutProperty) select _index;
			if (count _vehicles > 0) then {
				private _vehicleClass = "";
				if ({ _x > 47 && _x < 58 } count (toArray _vehId) != count _vehId) then { // [0-9]+
					{
						if (toLower _vehId in (toLower _x splitString "_")) exitWith {
							_vehicleClass = _x;
						};
					} forEach _vehicles;
				};
				if (_vehicleClass == "") then {
					_vehicleClass = selectRandom _vehicles;
				};

				if (_vehicleClass != "" && isClass (configFile >> "CfgVehicles" >> _vehicleClass)) then {
					private _vehicle = createVehicle [_vehicleClass, _pos, [], 0, "NONE"];
					_vehicle setDir _dir;
					if (count _vehVar > 3) then {
						missionNamespace setVariable [_vehVar select [3], _vehicle, true];
					};

					[_vehicle, _faction, _cargo] call BRM_FMK_fnc_assignCargo;

					["LOCAL", "F_LOG", format ["MARKER VEHICLE === Created '%1' for '%2' @ %3", _vehicleClass, _x, _pos]] call BRM_FMK_fnc_doLog;
				} else {
					["LOCAL", "F_LOG", format ["MARKER VEHICLE === ERROR: '%1' is not a valid vehicle", _vehicleClass]] call BRM_FMK_fnc_doLog;
				};
			} else {
				["LOCAL", "F_LOG", format ["MARKER VEHICLE === WARNING: No vehicles available for '%1_%2'", _faction, _vehType]] call BRM_FMK_fnc_doLog;
			};
		};
	};
} forEach allMapMarkers;

server_vehicles_created = true;
publicVariable "server_vehicles_created";
