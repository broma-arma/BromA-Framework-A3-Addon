if !(hasInterface && isRemoteExecuted) exitWith {};

player setVariable ["BRM_FMK_Plugin_PreventReslot_validSlot", true, true];

if !(_this isEqualTo []) then {
	private _delay = 600;

	if (BRM_FMK_Engine_compatVersion == 0) then {
		if (!isNil "mission_preventreslot_timer") then { _delay = mission_preventreslot_timer; };
	} else {
		if (fileExists "mission\settings\plugins\prevent_reslot.sqf") then {
			call compile preprocessFileLineNumbers "mission\settings\plugins\prevent_reslot.sqf";
		};
	};

	[{
		["Alert", ["Your slot has been locked for the remainder of the mission."]] call BIS_fnc_showNotification;

		_this remoteExec ["BRM_FMK_Plugin_PreventReslot_fnc_lockSlot", 2];
	}, _this, _delay] call CBA_fnc_waitAndExecute;
};
