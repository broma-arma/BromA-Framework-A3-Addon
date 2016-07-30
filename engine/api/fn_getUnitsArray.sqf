
params ["_side"];

switch (_side) do {
    case WEST: { _side = "B" };
    case EAST: { _side = "O" };
    case RESISTANCE: { _side = "I" };
};

_returnedUnits = [];

_units =
["_crew_F","_Helipilot_F",
"_Soldier_SL_F","_soldier_AR_F","_soldier_AR_F","_soldier_exp_F","_soldier_GL_F","_soldier_GL_F","_soldier_M_F",
"_medic_F","_soldier_AA_F","_soldier_repair_F","_Soldier_F","_Soldier_F","_soldier_LAT_F","_soldier_LAT_F",
"_soldier_lite_F","_soldier_TL_F","_soldier_TL_F"];

{ _returnedUnits pushBack (_side + _x) } forEach _units;

_returnedUnits