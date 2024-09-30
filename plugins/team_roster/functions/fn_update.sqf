private _aliasAUTO = ["*", "AUTO", "ANY"];
private _traits = [
	// getUnitTrait			CfgVehicleIcons		getVariable (ACE3)
	["explosiveSpecialist",	"pictureExplosive",	"ACE_isEOD"],
	["medic",				"pictureHeal",		"ace_medical_medicClass"],
	["engineer",			"pictureRepair",	"ACE_IsEngineer"]
	//["UAVHacker",			"",					""]
];

private _roster = "";
{
	private _groupID = groupID _x;
	if (_groupID != "Dead") then {
		_roster = _roster + format["%1<font font='RobotoCondensedBold' size='16'>%2</font><br />", ["", "<br />"] select (_forEachIndex > 0), _groupID];
		{
			private _unit = _x;
			if (_unit call BRM_FMK_fnc_alive) then {
				private _unitInit = _unit getVariable ["unitInit", ["MAIN", "*", "*", "*"]];

				private _pad = ["    ", "  "] select isFormationLeader _unit;

				private _rank = "<img width='16' height='16' src='" + getText (configFile >> "CfgRanks" >> (str rankId _unit) >> "texture") + "' /> ";

				private _name = name _unit;

				private _role = _unitInit select 2;
				if (toUpper _role in _aliasAUTO) then {
					_role = getText (configOf _unit >> "displayName");
				};

				private _icons = "";
				{
					_x params ["_trait", "_icon", "_var"];

					private _value = _unit getVariable [_var, _unit getUnitTrait _trait];
					if (_value isEqualType 0) then { _value = _value > 0; };
					if (_value) then {
						_icons = _icons + format [" <img width='16' height='16' src='%1' />", getText (configfile >> "CfgVehicleIcons" >> _icon)];
					};
				} forEach _traits;

				private _color = [_unitInit select 0] call BRM_FMK_fnc_colorToHex;

				_roster = _roster + format ["%1%2<font color='%6'>%3</font> - %4%5<br />", _pad, _rank, _name, _role, _icons, _color];
			};
		} forEach units _x;
	};
} forEach (allGroups select { side _x == side group player && (!isMultiplayer || {{ isPlayer _x } count units _x > 0}) });

player setDiaryRecordText [BRM_FMK_Plugin_TeamRoster_diary, ["Team Roster", _roster]];
