[{ time > 1 }, {
	BRM_FMK_PlankBuilding_constructionMenuOpen = false;

	private _vehicleArray = switch (side player) do {
		case side_a_side: { BRM_FMK_Plugin_PlankBuilding_objectsSideA };
		case side_b_side: { BRM_FMK_Plugin_PlankBuilding_objectsSideB };
		case side_c_side: { BRM_FMK_Plugin_PlankBuilding_objectsSideC };
		default { [] };
	};

	if (count _vehicleArray == 0) exitWith {};

	switch (getText (configOf player >> "displayName")) do {
		case "Officer":           { [BRM_FMK_Plugin_PlankBuilding_countsOfficer, 0.7] };
		case "Squad Leader":      { [BRM_FMK_Plugin_PlankBuilding_countsSL] };
		case "Team Leader":       { [BRM_FMK_Plugin_PlankBuilding_countsFTL] };
		case "Repair Specialist": { [BRM_FMK_Plugin_PlankBuilding_countsSpecialist, 2] };
		case "Engineer":          { [BRM_FMK_Plugin_PlankBuilding_countsSpecialist, 4] };
		default                   { [BRM_FMK_Plugin_PlankBuilding_counts] };
	} params ["_objects", ["_buildSpeedMultiplier", 1]];

	if (_objects findIf { _x > 0 } == -1) exitWith {};

	private _deployCondition = "isNull objectParent _this && (" + (_vehicleArray apply {
		format (["alive %1 && { _this distanceSqr %1 <= %2 * %2 }"] + _x);
	} joinString " || ") + ")";

	BRM_FMK_PlankBuilding_deployCondition = _deployCondition + " && BRM_FMK_PlankBuilding_constructionMenuOpen";

	[player, _objects] call plank_api_fnc_forceAddFortifications;
	BRM_FMK_Plugin_PlankBuilding_buildSpeedMultiplier = BRM_FMK_Plugin_PlankBuilding_buildSpeedMultiplier * _buildSpeedMultiplier;

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
