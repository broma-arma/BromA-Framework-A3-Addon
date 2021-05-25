if !(hasInterface) exitWith {};

[{ time > 1 }, {
	BRM_FMK_PlankBuilding_constructionMenuOpen = false;

	private _vehicleArray = switch (side player) do {
		case side_a_side: { plank_objects_side_a };
		case side_b_side: { plank_objects_side_b };
		case side_c_side: { plank_objects_side_c };
		default { [] };
	};

	if (count _vehicleArray == 0) exitWith {};

	switch (getText (configOf player >> "displayName")) do {
		case "Officer":           { [PLANK_Officer_Objects,    0.7] };
		case "Squad Leader":      { [PLANK_SL_Objects] };
		case "Team Leader":       { [PLANK_FTL_Objects] };
		case "Repair Specialist": { [PLANK_Specialist_Objects, 2] };
		case "Engineer":          { [PLANK_Specialist_Objects, 4] };
		default                   { [PLANK_Player_Objects] };
	} params ["_objects", ["_buildSpeedMultiplier", 1]];

	if (_objects findIf { _x > 0 } == -1) exitWith {};

	private _deployCondition = "isNull objectParent _this && (" + (_vehicleArray apply {
		format (["alive %1 && { _this distanceSqr %1 <= %2 * %2 }"] + _x);
	} joinString " || ") + ")";

	BRM_FMK_PlankBuilding_deployCondition = _deployCondition + " && BRM_FMK_PlankBuilding_constructionMenuOpen";

	[player, _objects] call plank_api_fnc_forceAddFortifications;
	PLANK_FMK_buildSpeed = PLANK_FMK_buildSpeed * _buildSpeedMultiplier;

	player addAction [
		"<t color=""#DEA010"">Toggle Construction Menu</t>",
		{ BRM_FMK_PlankBuilding_constructionMenuOpen = !BRM_FMK_PlankBuilding_constructionMenuOpen; },
		[],
		100,
		false,
		false,
		"",
		_deployCondition
	];
}, []] call CBA_fnc_waitUntilAndExecute;
