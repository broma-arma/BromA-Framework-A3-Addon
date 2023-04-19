#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_z_setLoadout

AUTHOR(s):
    Nife

DESCRIPTION:
    Changes the loadout of all units currently selected by Zeus.

PARAMETERS:
    0 - Loadout (STRING)
    1 - (OPTIONAL) Side to filter units. (SIDE)

USAGE:
    While in Zeus mode, select the desired units first.

    ["SLA"] spawn BRM_FMK_fnc_z_setLoadout
    ["RACS", west] spawn BRM_FMK_fnc_z_setLoadout

RETURNS:
    Nothing.

================================================================================
*/

private ["_loadout","_side"];

_loadout = _this select 0;
_side = nil;
if (count _this > 1) then { _side = _this select 1; };

_units = (curatorSelected select 0);

if ( (count _units) > 0) then {
    {
        if (count _this > 1) then {
            if (side _x == _side) then {
                [_x,_loadout] remoteExecCall [QFUNCMAIN(assignLoadout), 0];
            };
        } else {
            [_x,_loadout] remoteExecCall [QFUNCMAIN(assignLoadout), 0];
        };
    } forEach _units;
};
