if !(isServer && isRemoteExecuted) exitWith {};

params ["_playerUID", "_playerVar", "_playerName", "_playerRoleDescription"];

BRM_FMK_Plugin_PreventReslot_uidSlots set [_playerUID, _playerVar];
BRM_FMK_Plugin_PreventReslot_lockedSlots set [_playerVar, [_playerName, _playerRoleDescription]];
