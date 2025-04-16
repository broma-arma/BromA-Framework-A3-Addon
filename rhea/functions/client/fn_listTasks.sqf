#include "../../defines.hpp"

TRACE_1("fn_listTasks: %1", _this);

disableSerialization;

params ["_ctrlTasksList"];

private _selection = lbSelection _ctrlTasksList;
private _size = lbSize _ctrlTasksList;
_ctrlTasksList lbSetCurSel -1;
lbClear _ctrlTasksList;

private _ctrlPlayersList = ctrlParent _ctrlTasksList displayCtrl 2100;
private _selectedPlayer = _ctrlPlayersList lbData lbCurSel _ctrlPlayersList;
_selectedPlayer = if (_selectedPlayer != "") then { missionNamespace getVariable _selectedPlayer } else { objNull };
if (isNil "_selectedPlayer" || {isNull _selectedPlayer}) then {
	_selectedPlayer = player;
};

//BIS_fnc_taskType doesn't support setting the unit used for BIS_fnc_taskReal.
private _fnc_taskType = {
	#include "\A3\functions_f\Tasks\defines.inc"

	private _taskID = param [0,"",[""]];
	private _unit = param [1,player,[objnull]];
	private _taskVar = _taskID call bis_fnc_taskVar;
	private _taskReal = [_taskID, _unit] call bis_fnc_taskReal;

	if (isNull _taskReal || {isNil{GET_DATA_NIL(_taskVar,ID)}}) exitwith {["Task '%1' does not exists.",_taskID] call bis_fnc_error; ""};

	GET_DATA(_taskVar,TYPE)
};

private _current = _selectedPlayer call BIS_fnc_taskCurrent;
{
	(_x call BIS_fnc_taskDescription) params ["_description", "_title", "_marker"];
	_description = _description select 0;
	_title = _title select 0;
	_marker = _marker select 0;

	private _index = _ctrlTasksList lbAdd _title;
	_ctrlTasksList lbSetData [_index, _x];
	_ctrlTasksList lbSetTooltip [_index, _description];
	if (_x == _current) then {
		_ctrlTasksList lbSetColor [_index, [0, 1, 0, 1]];
	};

	private _state = _x call BIS_fnc_taskState;
	if (_state == "AUTOASSIGNED") then { _state = "CREATED"; };
	private _stateIcon = [configFile >> "CfgDiary" >> "Icons", "task" + _state, ""] call BIS_fnc_returnConfigEntry;
	if (_stateIcon == "") then {
		_stateIcon = [configFile >> "CfgDiary" >> "Icons", "taskNone", ""] call BIS_fnc_returnConfigEntry;
	};
	_ctrlTasksList lbSetPicture [_index, _stateIcon];
	_ctrlTasksList lbSetPictureRight [_index, [[_x, _selectedPlayer] call _fnc_taskType] call BIS_fnc_taskTypeIcon];
} forEach ([_selectedPlayer] call BIS_fnc_tasksUnit);
if (_size == lbSize _ctrlTasksList) then {
	{ _ctrlTasksList lbSetSelected [_x, true]; } forEach _selection;
};
