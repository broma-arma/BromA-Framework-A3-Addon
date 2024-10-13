if !(isServer && isRemoteExecuted) exitWith {};

params ["_playerUID", "_playerVar", "_playerName", "_playerRoleDescription"];

//if (true) exitWith { [false, ["TestPlayer", "Test Slot"]] remoteExec ["BRM_FMK_Plugin_PreventReslot_fnc_slotTaken", remoteExecutedOwner]; };

private _var = BRM_FMK_Plugin_PreventReslot_uidSlots get _playerUID;
if (!isNil "_var") then {
	if (_var == _playerVar) then {
		[] remoteExec ["BRM_FMK_Plugin_PreventReslot_fnc_slotValid", remoteExecutedOwner];
	} else {
		[true, BRM_FMK_Plugin_PreventReslot_lockedSlots get _var] remoteExec ["BRM_FMK_Plugin_PreventReslot_fnc_slotTaken", remoteExecutedOwner];
	};
} else {
	private _slot = BRM_FMK_Plugin_PreventReslot_lockedSlots get _playerVar;
	if (!isNil "_slot") then {
		[false, _slot] remoteExec ["BRM_FMK_Plugin_PreventReslot_fnc_slotTaken", remoteExecutedOwner];
	} else {
		_this remoteExec ["BRM_FMK_Plugin_PreventReslot_fnc_slotValid", remoteExecutedOwner];
	};
};
