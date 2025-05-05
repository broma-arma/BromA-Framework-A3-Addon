if !(isServer && isRemoteExecuted) exitWith {};

{
	private _var = BRM_FMK_Plugin_PreventReslot_uidSlots deleteAt _x;
	if (!isNil "_var") then {
		BRM_FMK_Plugin_PreventReslot_lockedSlots deleteAt _var;
	};
} forEach _this;
