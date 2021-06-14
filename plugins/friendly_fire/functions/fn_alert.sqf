params ["_unit", "_attacker", "_damage", ["_instigator", objNull]];

if (isNull _instigator) then {
	_instigator = _attacker;
};

private _unitSide = _unit getVariable ["unit_side", side _unit];
private _instigatorSide = _instigator getVariable ["unit_side", side _instigator];

if (
	isNull _instigator
	|| { vehicle _unit == vehicle _instigator }
	|| { name _instigator == "Error: No Unit" }
	|| { !friendly_fire_count_AI && { !isPlayer _unit || !isPlayer _instigator } }
	|| { !friendly_fire_civilians && { _unitSide isEqualTo CIVILIAN || _instigatorSide isEqualTo CIVILIAN } }
	|| { !([_unitSide, _instigatorSide] call BIS_fnc_sideIsFriendly) }
) exitWith {};

private _names = [name _unit, name _instigator];

if (!isNull (_attacker getVariable ["bis_fnc_moduleremotecontrol_owner", objNull])) exitWith {
	["SERVER", "LOG", format (["FRIENDLY FIRE: %2 has wounded %1 with a remote controlled unit."] + _names)] call BRM_FMK_fnc_doLog;
};

if !(BRM_FMK_FriendlyFire_alerts set [_names, true]) then {
	[{
		["ALL", "CHAT", format (["FRIENDLY FIRE: %2 has wounded %1!"] + _this)] call BRM_FMK_fnc_doLog;
		BRM_FMK_FriendlyFire_alerts deleteAt _this;
	}, _names, friendly_fire_timer_minutes * 60] call CBA_fnc_waitAndExecute;
};
