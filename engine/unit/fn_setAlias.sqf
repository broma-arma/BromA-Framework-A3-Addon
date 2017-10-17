/*
================================================================================

NAME:
    BRM_FMK_fnc_setAlias
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Assigns an alias to a unit and its group.

PARAMETERS:
    0 - Unit. (OBJECT)
    1 - Group. (GROUP)
    2 - Unit's role. (STRING)
    
USAGE:
    [blu_0_0_1] call BRM_FMK_fnc_setAlias
    
RETURNS:
    Nothing.

================================================================================
*/

params ["_unit", ["_group", "*"], ["_role", "*"]];

private _aliasAUTO = ["*", "AUTO", "ANY"];

((str _unit) splitString "_") params ["_unitSide", "_groupCallsign", "_groupNumber", "_unitNumber"];

private _isLeader = isFormationLeader _unit;

private _groupName = _group;
private _autoNamed = _group in _aliasAUTO;
private _actualGroup = _groupNumber == "0";

if (_autoNamed) then {
	private _side = switch (_unitSide) do {
		case "blu": { WEST };
		case "op":  { EAST };
		case "ind": { RESISTANCE };
		case "civ": { CIVILIAN };
	};

	_group = ([_side, "callsigns"] call BRM_FMK_fnc_getSideInfo) select (parseNumber _groupCallsign);
	private _groupNameNumber = if (_actualGroup) then { "" } else { " " + _groupNumber };
	_groupName = _group + _groupNameNumber;
} else {
	_groupNumber = "";
};

if (_actualGroup) then {
	_groupNumber = "";
} else {
	if (_isLeader && _autoNamed) then {
		_groupNumber = _groupNumber + " ";
	};
};
_unitNumber = if (_isLeader) then { "" } else { "'" + _unitNumber };

if ((toUpper _role) in _aliasAUTO) then {
	_role = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
};

switch (true) do {
	case (_actualGroup && _isLeader):                        { _role = "Actual" };
	case (_role in ["CO", "Officer", "SL", "Squad Leader"]): { _role = "Actual" };
	case (_role in ["FTL", "Team Leader"]):                  { _role = "FTL" };
	case (_isLeader):                                        { _role = "Leader" };    
};

if (_unitNumber != "") then { _unitNumber = _unitNumber + " " };

(group _unit) setGroupIdGlobal [_groupName];

_unit setVariable ["rosterAlias", format ["%1 %2%3%4", _group, _groupNumber, _unitNumber, _role], true];
