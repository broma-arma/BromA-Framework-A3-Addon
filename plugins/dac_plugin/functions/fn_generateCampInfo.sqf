params ["_side"];

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

private ["_factionUnits", "_faction", "_vehicles", "_campInfo", "_GcampStatic", "_gunner", "_GcampStatic", "_GcampBasic"];

_factionUnits = [_side] call BRM_FMK_fnc_getUnitsArray;
_faction = [_side, "FACTION"] call BRM_FMK_fnc_getSideInfo;

_vehicles = [_faction, "VEHICLES"] call BRM_fnc_getLoadoutProperty;
_campInfo = [_faction, "DACCAMPS"] call BRM_fnc_getLoadoutProperty;

_campStatic = []; _campGuards = [];
_gunner = _factionUnits select 12;

{
    _weapon = (_vehicles select STATIC_DEFENSE) call BIS_fnc_selectRandom;
    _campStatic pushBack [_weapon, (_x select 0), (_x select 1), (_x select 2), _gunner];
} forEach [[-7,25,0],[25,25,0],[25,-20,180],[-7,-20,180]];

{
    _campGuards pushBack (_factionUnits select _x);
} forEach [2,3,4,5,6];

_campBasic = (_campInfo select CAMP_BASIC);
_campObjects = (_campInfo select CAMP_OBJECTS);
_campWalls = (_campInfo select CAMP_WALLS);
_campAmmo = (_campInfo select CAMP_AMMO);

_ret = [];

_ret set [CAMP_RET_BASIC, _campBasic];
_ret set [CAMP_RET_OBJECTS, _campObjects];
_ret set [CAMP_RET_STATIC, _campStatic];
_ret set [CAMP_RET_GUARDS, _campGuards];
_ret set [CAMP_RET_WALLS, _campWalls];
_ret set [CAMP_RET_AMMO, _campAmmo];

_ret
