#include "script_component.hpp"
// DAC\Scripts\DAC_Init_Zone.sqf
if (mission_AI_controller) then {
	[{!(isNil "dac_basic_value")}, {
		if (dac_basic_value > 0) exitWith {};
		if ((count (_this select 5)) >= 6) then { DAC_Init_Camps = DAC_Init_Camps + ((_this select 5) select 0) };
		_this call FUNC(createZone);
	}, _this] call CBA_fnc_waitUntilAndExecute;
};
