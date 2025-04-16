#include "../../defines.hpp"

TRACE_1("fn_initDisplayCurator: %1", _this);

params ["_display"];

if (!isClass (configFile >> "CfgPatches" >> "zen_camera")) then { // Skip if Zeus Enhanced is used, which also does this.
	[{ !isNull curatorCamera }, { curatorCamera camCommand "maxPitch 89.0"; }] call CBA_fnc_waitUntilAndExecute;
}
