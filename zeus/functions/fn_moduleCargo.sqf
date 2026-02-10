//BRM_FMK_Zeus_fnc_moduleCargo
params ["_mode", "_params", "_unit"];

//systemChat format ["fn_moduleCargo (%1): %2 (%3)", _mode, _params, _unit];

switch (_mode) do {
	case "Init": {
		_params params ["_object"];
		if (isNull _object) exitWith { "Place on an object" call BRM_FMK_Zeus_fnc_message; false };
		if ((!(_object isKindOf "AllVehicles") || { _object isKindOf "Man" }) && !(_object isKindOf "ReammoBox_F")) exitWith { "Object must be a vehicle" call BRM_FMK_Zeus_fnc_message; false };
		if !(alive _object) exitWith { "Object must be alive" call BRM_FMK_Zeus_fnc_message; false };
		true
	};
	case "onLoad": {
		_params params ["_display", "_config"];

		_unit getVariable ["BRM_FMK_fnc_assignCargo", []] params [["_faction", ""], ["_cargo", []]];

		private _ctrlFaction = _display displayCtrl 1012;
		private _factions = [side_a_side, side_b_side];
		if (mission_enable_side_c) then {
			_factions pushBack side_c_side;
		};
		_factions = _factions apply {
			private _sideFaction = [_x, "faction"] call BRM_FMK_fnc_getSideInfo;
			private _i = _ctrlFaction lbAdd format ["%1 (%2)", _sideFaction, _x call BIS_fnc_sideName];
			_ctrlFaction lbSetData [_i, _sideFaction];
			_ctrlFaction lbSetColorRight [_i, getArray (configFile >> "CfgMarkerColors" >> "Color" + ([_x, "color"] call BRM_FMK_fnc_getSideInfo) >> "color") call BIS_fnc_colorConfigToRGBA];
			_ctrlFaction lbSetColor [_i, [_x, returnString] call BIS_fnc_sideColor];
			_ctrlFaction lbSetTextRight [_i, [_x, "name"] call BRM_FMK_fnc_getSideInfo];
			if (_sideFaction == _faction) then {
				_ctrlFaction lbSetCurSel _i;
			};
			toUpperANSI _sideFaction
		};
		{
			_x params ["_cfg", "_src"];
			{
				private _configName = configName _x;
				if !(toUpperANSI _configName in _factions) then {
					private _i = _ctrlFaction lbAdd toUpperANSI _configName;
					_ctrlFaction lbSetTextRight [_i, _src];
					if (_configName == _faction) then {
						_ctrlFaction lbSetCurSel _i;
					};
				};
			} forEach configProperties [_cfg >> "BRM_FMK" >> "Factions", "true", true];
		} forEach [[missionConfigFile, "(Mission)"], [campaignConfigFile, "(Campaign)"], [configFile, ""]];
		if (_faction == "") then {
			_ctrlFaction lbSetCurSel 0;
		};

		private _contentCargo = keys BRM_FMK_Engine_contentCargo;
		_contentCargo sort true;
		private _ctrlCargo = _display displayCtrl 1013;
		{
			private _i = _ctrlCargo lbAdd _x;
			if (toLowerANSI _x in _cargo) then {
				_ctrlCargo lbSetSelected [_i, true];
			};
		} forEach ([
			"medical", "ammo_big", "ammo", "at", "rpg7_ammo", "radio", "explosives", "mines", "at_mines", "ap_mines",
			"chemlight", "chemlight_hi", "handheldflares", "smoke", "bandage", "blood",
			"rangetables", "contraband", "spraypaint", "markerflags", "towropes",
			"rifle", "riflegl", "pistol", "ar", "mg", "marksman", "sniper", "smg", "lat", "mat", "hat", "haa", "rifle_recon", "gl",
			"rifle_grenades", "m203", "gp", "type06_ammo"
		] + _contentCargo);
	};
	case "onUnload": {
		_params params ["_display", "_exitCode"];
		if (_exitCode == 1) then {
			private _ctrlFaction = _display displayCtrl 1012;
			private _faction = _ctrlFaction lbData lbCurSel _ctrlFaction;

			private _ctrlCargo = _display displayCtrl 1013;
			private _cargo = lbSelection _ctrlCargo apply { _ctrlCargo lbText _x };

			["BRM_FMK_Zeus_fnc_assignCargo", [_unit, _faction, _cargo]] call CBA_fnc_serverEvent;
		};
	};
};
