#include "../../defines.hpp"

TRACE_1("fn_taskMenu: %1", _this);

disableSerialization;

params ["_control", "_state"];

private _display = ctrlParent _control;
private _ctrlTasksList = _display displayCtrl 2101;

private _refreshTaskList = false;
{
	private _task = _ctrlTasksList lbData _x;
	if (_task call BIS_fnc_taskState != _state) then {
		_refreshTaskList = true;
		if (isNil "BRM_FMK_fnc_setTask") then {
			[_task, _state] call BIS_fnc_taskSetState;
		} else {
			[_task, _state] remoteExecCall ["BRM_FMK_fnc_setTask", 2];
		};
	};
} forEach lbSelection _ctrlTasksList;

if (_refreshTaskList) then {
	_ctrlTasksList call BRM_FMK_RHEA_fnc_listTasks;
};
