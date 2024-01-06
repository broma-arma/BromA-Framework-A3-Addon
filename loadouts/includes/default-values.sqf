// Executed after faction structure

if (isNil "_defaultSide") then { _defaultSide = WEST; };
if (isNil "_defaultFace") then { _defaultFace = [_faceWHITE]; };
if (isNil "_defaultVoice") then { _defaultVoice = [_voiceAMERICAN]; };
if (isNil "_defaultInsignia") then { _defaultInsignia = ""; };

if (isNil "_factionSkill") then {
	//               Aiming Accuracy, Aiming Shake, Aiming Speed, Endurance,  Spot Distance, Spot Time,  Courage,    Reload Speed, Commanding, General
	_factionSkill = [[0.7, 0.8],      [0.8, 0.9],   [0.7, 0.8],   [0.7, 0.9], [0.8, 0.9],    [0.7, 0.8], [0.8, 0.9], [0.7, 0.8],   [0.7, 0.9], [0.7, 0.8]];
};

if (isNil "_factionSide") then {
	#include "\broma_framework\loadouts\includes\get-faction.sqf"
};

private _sideChar = switch (_factionSide) do {
	case WEST: { "B" };
	case EAST: { "O" };
	case RESISTANCE: { "I" };
	default { "B" };
};

if (isNil "_factionUnits") then {
	_factionUnits = [
		// Order is important, see DAC's documentation for _Unit_Pool_S in DAC_Config_Units
		_sideChar + "_crew_F", // Crewman
		_sideChar + "_Helipilot_F", // Helicopter Pilot
		_sideChar + "_Soldier_SL_F", // Squad Leader

		// Infantry
		[
			// selectRandomWeighted
			// value                         weight
			_sideChar + "_soldier_TL_F",     20, // Team Leader
			_sideChar + "_Soldier_F",        15, // Rifleman
			_sideChar + "_soldier_lite_F",   5,  // Rifleman (Light)
			_sideChar + "_soldier_LAT_F",    15, // Rifleman (AT)
			_sideChar + "_soldier_AR_F",     15, // Autorifleman
			_sideChar + "_soldier_M_F",      15, // Marksman
			_sideChar + "_medic_F",          10, // Combat Life Saver
			_sideChar + "_soldier_exp_F",    2,  // Explosive Specialist
			_sideChar + "_soldier_repair_F", 2,  // Repair Specialist
			_sideChar + "_soldier_AA_F",     1   // Missile Specialist (AA)
		]
	];
};

call {
	private _units = _factionUnits select [0, 3];

	// Convert selectRandomWeighted to selectRandom (DAC uses selectRandom)
	private _infantry = _factionUnits select 3;
	for "_i" from 0 to (count _infantry / 2 - 1) do {
		private _index = _i * 2;
		private _type = _infantry select _index;
		private _weight = _infantry select _index + 1;
		for "_j" from 1 to _weight do {
			_units pushBack _type;
		};
	};

	_factionUnits = _units;
};

if (isNil "_factionVehicles") then {
	_factionVehicles = [
	/*  Anti Air Vehicles    */  ["B_APC_Tracked_01_AA_F"]
	/*  Attack Helos         */	,["B_Heli_Attack_01_F", "B_Heli_Light_01_armed_F"]
	/*  Attack Planes        */	,["B_Plane_CAS_01_F"]
	/*  Heavy Vehicles       */	,["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"]
	/*  Light Vehicles       */	,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
	/*  Medium Vehicles      */	,["B_APC_Tracked_01_rcws_F", "B_APC_Wheeled_01_cannon_F"]
	/*  Mobile Artillery     */	,["B_MBT_01_arty_F", "B_MBT_01_mlrs_F"]
	/*  Transport Helos      */	,["B_Heli_Light_01_F", "B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F"]
	/*  Transport Planes     */	,[]
	/*  Transport Trucks     */	,["B_Truck_01_transport_F", "B_Truck_01_covered_F"]
	/*  Static Defence       */	,["B_HMG_01_high_F", "B_static_AA_F", "B_static_AT_F", "B_Mortar_01_F"]
	/*  Boats                */	,["B_Boat_Armed_01_minigun_F"]
	/*  UAV                  */	,["B_UAV_02_CAS_F", "B_UAV_02_F"]
	/*  UGV                  */	,["B_UGV_01_F", "B_UGV_01_rcws_F"]
	/*  Support              */	,["B_Truck_01_Repair_F", "B_Truck_01_ammo_F", "B_Truck_01_fuel_F", "B_Truck_01_medical_F"]
	/*  Submarines           */	,["B_SDV_01_F"]
	/*  MRAP Vehicles        */ ,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
	];
};

if (isNil "_factionObjects") then {
	_factionObjects = [
		/* Flag         */ "Flag_White_F",
		/* Objects      */ [_sideChar + "_CargoNet_01_ammo_F"],
		/* Walls        */ ["Land_BagFence_Short_F", "Land_BagFence_Long_F"],
		/* Structures   */ ["Land_Cargo_House_V3_F"]
	];
};

if (isNil "_factionDACCamps") then {
	_factionDACCamps = [
		// DAC Camps
		/* Basic    */ [(_factionObjects select FACTION_OBJECTS_FLAG), ["FirePlace_burning_f", 15, 10, 0], [selectRandom (_factionObjects select FACTION_OBJECTS_STRUCTURES), 10, 0, 0], ["Logic", 10, 15, 0], 0],
		/* Objects  */ [[selectRandom (_factionObjects select FACTION_OBJECTS_CRATES), 20, 2, 0], [selectRandom (_factionObjects select FACTION_OBJECTS_CRATES), 20, 0, 0]],
		/* Walls    */ [selectRandom (_factionObjects select FACTION_OBJECTS_WALLS), [-2, 35], [40, 40, 0], [7, 0, 0, 4], [1, 0.1], [0, 0]],
		/* Ammo     */ ["medical", "ammo"],
		/* Statics  */ [[-7, 25, 0], [25, 25, 0], [25, -20, 180], [-7, -20, 180]]
	];
};

if (!_assignLoadoutMode && !isNil "_object" && !read_local_cargo) then { // assignCargo
	_type = _type apply {
		if (_x == "medical_adv") then {
			if ("medical" in _type) then { "" } else { "medical" }
		} else {
			_x
		}
	} select { _x != "" };

	// Cannot be done in cargo-list.sqf, due to the function restricts the amount added, based on available inventory space.
	if (("ammo" in _type || "ammo_big" in _type) && isClass (configFile >> "CfgPatches" >> "UK3CB_BAF_Vehicles_Weapons") && { configSourceMod configOf _object == "@3CB BAF Vehicles" }) then {
		_object call UK3CB_BAF_vehicles_Weapons_fnc_rearm;
	};
};
