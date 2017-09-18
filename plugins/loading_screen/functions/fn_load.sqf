params ["_metrics", "_timeout"];

while {_timeout > 0 && {{ !call _x } count _metrics != 0}} do {
	uiSleep 1;
	_timeout = _timeout - 1;
};
