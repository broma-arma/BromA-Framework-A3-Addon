#include "../../defines.hpp"

TRACE_1("fn_sendMessage: %1", _this);

params ["_controlGroup"];

private _ctrlEdit = _controlGroup controlsGroupCtrl 1002;
private _message = trim ctrlText _ctrlEdit;
_ctrlEdit ctrlSetText "";
if (_message == "") exitWith {};

systemChat format ["(to Admin): %1", _message];
playSound "3DEN_notificationDefault";

["BRM_FMK_RHEA_receiveMessage", [profileName, _message]] call CBA_fnc_remoteEvent;
