//BRM_FMK_Zeus_fnc_moduleLoadout
params ["_mode", "_params", "_unit"];

//systemChat format ["fn_moduleLoadout (%1): %2 (%3)", _mode, _params, _unit];

switch (_mode) do {
	case "Init": {
		_params params ["_object"];
		if (isNull _object) exitWith { "Place on an object" call BRM_FMK_Zeus_fnc_message; false };
		if !(_object isKindOf "CAManBase") exitWith { "Object must be infantry" call BRM_FMK_Zeus_fnc_message; false };
		if !(alive _object) exitWith { "Object must be alive" call BRM_FMK_Zeus_fnc_message; false };
		true
	};
	case "onLoad": {
		_params params ["_display", "_config"];

		_unit getVariable ["BRM_FMK_fnc_assignLoadout", []] params [["_faction", ""], ["_role", ""]];
		_display setVariable ["BRM_FMK_Zeus_fnc_moduleLoadout_role", _role];

		private _ctrlFaction = _display displayCtrl 1012;
		_ctrlFaction ctrlAddEventHandler ["LBSelChanged", { ["FactionChanged", _this] call BRM_FMK_Zeus_fnc_moduleLoadout; }];

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
	};
	case "FactionChanged": {
		_params params ["_control", "_lbCurSel"];

		private _faction = _control lbText _lbCurSel;
		private _roles = switch (_faction) do {
			case "SPRG": {[
				["Reporter", "reporter"],
				["Cameraman", "cameraman"]
			]};
			default {[
				["Officer", "co"],
				["Squad Leader", "sl"],
				["Team Leader", "ftl"],
				["Rifleman", "rifleman"],
				["Rifleman (AT)", "at"],
				["Marksman", "marksman"],
				["Autorifleman", "ar"],
				["Asst. Autorifleman", "asstar"],
				["Combat Life Saver", "medic"],
				["Grenadier", "grenadier"],
				["Helicopter Pilot", "helipilot"],
				["Helicopter Crew", "helicrew"],
				["Engineer", "engineer"],
				["Crewman", "crew"],
				//["Driver", "driver"],
				//["Gunner", "gunner"],
				//["Commander", "commander"],
				//["Loader", "loader"],
				["Pilot", "pilot"],
				["JTAC", "rto"],
				["Recon Team Leader", "reconleader"],
				["Recon Scout", "recon"],
				["Recon Demo Specialist", "recondemo"],
				["Recon Paramedic", "reconmedic"],
				["Recon Scout (AT)", "reconat"],
				["Recon Marksman", "reconmarksman"],
				["Explosive Specialist", "demo"],
				["Gunner (HMG)", "hmg"],
				["Gunner (AT)", "staticat"],
				["UAV Operator", "uav"],
				["Asst. Gunner (HMG/GMG)", "hmgtripod"],
				["Asst. Gunner (AT)", "attripod"],
				["Gunner (Mk6)", "mortar"],
				["Asst. Gunner (Mk6)", "mortarasst"],
				["Missile Specialist (AT)", "hat"],
				["Asst. Missile Specialist (AT)", "hatasst"],
				["Missile Specialist (AA)", "haa"],
				["Asst. Missile Specialist (AA)", "haaasst"],
				["Sniper", "sniper"],
				["Spotter", "spotter"],
				["Heavy Gunner", "mmg"],
				["Ammo Bearer", "mmgasst"]
			]};
		};

		private _display = ctrlParent _control;
		private _ctrlRole = _display displayCtrl 1014;
		lbClear _ctrlRole;
		private _curRole = _display getVariable "BRM_FMK_Zeus_fnc_moduleLoadout_role";
		{
			_x params ["_name", "_role"];
			private _i = _ctrlRole lbAdd _name;
			_ctrlRole lbSetData [_i, _role];
			if (_name == _curRole || _role == _curRole) then {
				_ctrlRole lbSetCurSel _i;
			};
		} forEach _roles;
	};
	case "onUnload": {
		_params params ["_display", "_exitCode"];
		if (_exitCode == 1) then {
			private _ctrlFaction = _display displayCtrl 1012;
			private _faction = _ctrlFaction lbData lbCurSel _ctrlFaction;

			private _ctrlRole = _display displayCtrl 1014;
			private _role = _ctrlRole lbData lbCurSel _ctrlRole;

			["BRM_FMK_Zeus_fnc_assignLoadout", [_unit, _faction, _role], _unit] call CBA_fnc_targetEvent;
		};
	};
};
