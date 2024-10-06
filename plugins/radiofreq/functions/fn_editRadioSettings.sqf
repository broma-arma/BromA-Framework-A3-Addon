params ["_radio", "_settings"];

if (isNil "_radio") exitWith {};

private _radioType = parseNumber (_radio isEqualType []); // SR is string, LR is array

private _current = _radio call ([TFAR_fnc_getSwSettings, TFAR_fnc_getLrSettings] select _radioType);

{
	if (_forEachIndex == 2) then { // Channel frequencies
		{
			if (!isNil "_x") then {
				_current#2 set [_forEachIndex, _x];
			};
		} forEach _x;
	} else {
		if (!isNil "_x") then {
			if (_radioType == /*SR*/0 && _forEachIndex == /*Additional channel*/5 && { [_radio, "tf_additional_channel", 0] call TFAR_fnc_getWeaponConfigProperty == 0 }) then {
				_x = -1;
			};
			_current set [_forEachIndex, _x];
		};
	};
} forEach _settings;

[_radio, _current] call ([TFAR_fnc_setSwSettings, TFAR_fnc_setLrSettings] select _radioType);
