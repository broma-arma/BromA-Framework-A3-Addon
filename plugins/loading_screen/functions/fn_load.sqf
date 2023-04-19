#include "script_component.hpp"
params ["_metrics", "_timeout"];

while {_timeout > 0 && {{ !call _x } count _metrics != 0}} do {
	titleText ["<t size='2'>Loading...</t><br/><br/>Please wait in order to allow the game to load properly.", "BLACK FADED", 1, true, true];
	uiSleep 1;
	_timeout = _timeout - 1;
};
