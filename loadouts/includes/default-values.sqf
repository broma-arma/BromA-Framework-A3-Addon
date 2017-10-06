
if (isNil "_defaultSide") then { _defaultSide = WEST };
if (isNil "_defaultFace") then { _defaultFace = _faceWHITE };
if (isNil "_defaultVoice") then { _defaultVoice = _voiceAMERICAN };
if (isNil "_defaultInsignia") then { _defaultInsignia = "none" };

    _defaultCallsignBLUFOR =
["Zero",
"Alpha", "Bravo", "Charlie", "Delta",
"Razor", "Sierra", "Wizard", "Shocker", "Paradise", "Meteor", "Lancer", "Titan", "Havoc", "Pegasus"];

    _defaultCallsignOPFOR =
["Godfather",
"Anaconda", "Boa", "Cobra", "Dragon",
"Raven", "Scorpion", "Weasel", "Sparrow", "Pelican", "Moose", "Lion", "Tiger", "Hawk", "Phoenix"];

    _defaultCallsignINDFOR =
["Papa",
"Anna", "Beatrice", "Clara", "Denise",
"Rose", "Sarah", "Whitney", "Shirley", "Penny", "Mary", "Lucy", "Tanya", "Helen", "Petunia"];

_sideC = "B";

switch (_defaultSide) do {
    case WEST: { _sideC = "B" };
    case EAST: { _sideC = "O" };
    case RESISTANCE: { _sideC = "I" };
};

if (isNil "_factionSkill") then {
/*                  "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
    _factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];
};

if (isNil "_factionVehicles") then {
    _factionVehicles = [
    /*  Anti Air Vehicles    */  ["B_APC_Tracked_01_AA_F"]
    /*  Attack Helos         */	,["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"]
    /*  Attack Planes        */	,["B_Plane_CAS_01_F"]
    /*  Heavy Vehicles       */	,["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"]
    /*  Light Vehicles       */	,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
    /*  Medium Vehicles      */	,["B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"]
    /*  Mobile Artillery     */	,["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]
    /*  Transport Helos      */	,["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"]
    /*  Transport Planes     */	,[]
    /*  Transport Trucks     */	,["B_Truck_01_transport_F","B_Truck_01_covered_F"]
    /*  Static Defence       */	,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F"]
    /*  Boats                */	,["B_Boat_Armed_01_minigun_F"]
    /*  UAV                  */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV                  */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support              */	,["B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F", "B_Truck_01_medical_F"]
    /*  Submarines           */	,["B_SDV_01_F"]
    /*  MRAP Vehicles        */ ,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
    ];
};

if (isNil "_factionObjects") then {
    _factionObjects = [
        /* Flag         */ "Flag_White_F",
        /* Objects      */ [_sideC + "_CargoNet_01_ammo_F"],
        /* Walls        */ ["Land_BagFence_Short_F", "Land_BagFence_Long_F"],
        /* Structures   */ ["Land_Cargo_House_V3_F"]
    ];
};

if (isNil "_factionDACCamps") then {
    _factionDACCamps = [
        // DAC Camps
        /* Basic    */ [(_factionObjects select FACTION_OBJECTS_FLAG),["FirePlace_burning_f",15,10,0],[(_factionObjects select FACTION_OBJECTS_STRUCTURES) call BIS_fnc_selectRandom,10,0,0],["Logic",10,15,0],0],
        /* Objects  */ [[(_factionObjects select FACTION_OBJECTS_CRATES) call BIS_fnc_selectRandom, 20, 2, 0],[(_factionObjects select FACTION_OBJECTS_CRATES) call BIS_fnc_selectRandom, 20, 0, 0]],
        /* Walls    */ [(_factionObjects select FACTION_OBJECTS_WALLS) call BIS_fnc_selectRandom,[-2,35],[40,40,0],[7,0,0,4],[1,0.1],[0,0]],
        /* Ammo     */ ["medical", "medical_adv" ,"ammo"]
    ];
};

if (isNil "_isATDisposable") then { _isATDisposable = false };

if (_isATDisposable) then {
    _countATCARGO = 0;
};