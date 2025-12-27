/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_mapHold

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Stop map position from changing when reopened.

PARAMETERS:
    None.

USAGE:
    _this call BRM_FMK_Engine_fnc_mapHold

RETURNS:
    Nothing.

================================================================================
*/

BRM_FMK_Engine_fnc_mapHold_Last = [1, [worldSize / 2, worldSize / 2]];
BRM_FMK_Engine_fnc_mapHold_EH = addMissionEventHandler ["Map", {
	params ["_open", "_force"];

	private _ctrlMap = findDisplay 12 displayCtrl 51;
	if (_open) then {
		if (!_force) then {
			_ctrlMap ctrlMapAnimAdd ([0] + (BRM_FMK_Engine_fnc_mapHold_Last));
			ctrlMapAnimCommit _ctrlMap;
		};
	} else {
		private _mapPos = ctrlMapPosition _ctrlMap;
		BRM_FMK_Engine_fnc_mapHold_Last = [ctrlMapScale _ctrlMap, _ctrlMap ctrlMapScreenToWorld [_mapPos#0 + _mapPos#2 / 2, _mapPos#1 + _mapPos#3 / 2]];
	};
}];
