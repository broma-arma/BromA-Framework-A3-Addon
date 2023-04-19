#include "script_component.hpp"
[QGVARMAIN(aiControllerInit), {
	[] call ([] call FUNC(getSettings) select 2);
}] call CBA_fnc_addEventHandler;
