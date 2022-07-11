mission_time_accel = ["p_time_accel", 1] call BIS_fnc_getParamValue;

if (!isServer) exitWith {};
[{!(isNil "mission_time_accel")}, {setTimeMultiplier mission_time_accel;}, []] call CBA_fnc_waitUntilAndExecute;
