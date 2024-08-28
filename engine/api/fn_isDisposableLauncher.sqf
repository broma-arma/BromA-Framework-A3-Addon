/*
================================================================================

NAME:
    BRM_FMK_fnc_isDisposableLauncher

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Check if a launcher is disposable.

PARAMETERS:
    0 - Launcher class name. (STRING)

USAGE:
    "launch_nlaw_f" call BRM_FMK_fnc_isDisposableLauncher;

RETURNS:
    true if the launcher is disposable, otherwise false. (BOOLEAN)

================================================================================
*/

params [["_launcher", "", [""]]];

private _cfgLauncher = configFile >> "CfgWeapons" >> _launcher;
!isNil { cba_disposable_NormalLaunchers getVariable _launcher } // CBA
|| { getNumber (_cfgLauncher >> "rhs_disposable") != 0 } // RHS
|| { getText (_cfgLauncher >> "uk3cb_used_launcher") != "" }; // 3CB
