if (!isServer) exitWith {};
[{!(isNil "mission_time_accel")}, {setTimeMultiplier mission_time_accel;}, []] call CBA_fnc_waitUntilAndExecute;
