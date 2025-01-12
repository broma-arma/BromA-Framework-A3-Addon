/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_handleKilled

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Unit killed event handler.

PARAMETERS:
    0 - Object the event handler is assigned to (OBJECT)
    1 - Object that killed the unit. Contains the unit itself in case of collisions. (OBJECT)
    2 - Person who pulled the trigger (OBJECT)

USAGE:
    [player, myKiller, myKiller, false] call BRM_FMK_Engine_fnc_handleKilled;

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit", "_killer", "_instigator"];

// Add secondary to primary weapon holder
getCorpseWeaponholders _unit params ["_primaryWeaponHolder", "_secondaryWeaponHolder"];
if (!isNull _secondaryWeaponHolder) then {
	{
		_primaryWeaponHolder addWeaponWithAttachmentsCargoGlobal [_x, 1];
	} forEach weaponsItemsCargo _secondaryWeaponHolder;
	deleteVehicle _secondaryWeaponHolder;
};

if (isPlayer _unit) then {
	_unit setVariable ["unit_deaths", (_unit getVariable ["unit_deaths", 0]) + 1];
};

if (isNull _instigator) then {
	_instigator = _killer;

	// Handle UAV road kill (Note: unitIsUAV doesn't work for UAV AI)
	if (_instigator isKindOf "CAManBase" && { getText (configOf _instigator >> "simulation") == "UAVPilot"}) then { _instigator = vehicle _instigator; };
	if (unitIsUAV _instigator) then { _instigator = UAVControl _instigator select 0; };
};

if (isNull _instigator || { _unit == _instigator }) then {
	_instigator = _unit getVariable ["last_damage", objNull];
	if (_unit == _instigator) then { _instigator = objNull; };
};

if (isNull _instigator) exitWith {};

private _unitSide = _unit call BIS_fnc_objectSide;
private _vehicle = objectParent _instigator;
if (isNull _vehicle) then {
	[_instigator, parseNumber ([_unitSide, _instigator call BIS_fnc_objectSide] call BIS_fnc_areFriendly) * -2 + 1] remoteExecCall ["BRM_FMK_Engine_fnc_addScore", _instigator];
} else {
	private _fullCrew = fullCrew _vehicle;
	_fullCrew select (_fullCrew findIf { _instigator == _x select 0 }) params ["", "_instigatorRole", "", "", "_instigatorFFV"];
	if (_instigatorRole in ["driver", "commander", "gunner"] || _instigatorRole == "turret" && !_instigatorFFV) then {
		{
			_x params ["_crew", "_role", "", "", "_personTurret", "", ""];
			if (!isNull _crew && { _role in ["driver", "commander", "gunner"] || _role == "turret" && !_personTurret }) then {
				[_crew, parseNumber ([_unitSide, _crew call BIS_fnc_objectSide] call BIS_fnc_areFriendly) * -2 + 1] remoteExecCall ["BRM_FMK_Engine_fnc_addScore", _crew];
			};
		} forEach _fullCrew;
	} else {
		[_instigator, parseNumber ([_unitSide, _instigator call BIS_fnc_objectSide] call BIS_fnc_areFriendly) * -2 + 1] remoteExecCall ["BRM_FMK_Engine_fnc_addScore", _instigator];
	};
};
