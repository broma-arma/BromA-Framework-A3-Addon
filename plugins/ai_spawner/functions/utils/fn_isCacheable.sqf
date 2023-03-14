params ["_unit"];

private _vehicle = objectParent _unit;

if (isNull _vehicle) exitWith {
	leader _unit != _unit
};

// TODO Caching leader in vehicle will probably cause issues. Especially if leader is vehicle commander.
driver _vehicle != _unit && { !(_vehicle isKindOf "StaticWeapon") && { gunner _vehicle != _unit }}
