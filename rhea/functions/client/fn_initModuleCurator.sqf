#include "../../defines.hpp"

TRACE_1("fn_initModuleCurator: %1", _this);

params ["_curator"];

_curator addEventHandler ["CuratorPinged", {
	params ["_curator", "_player"];

	if (local _curator) then {
		systemChat format ["Pinged: %1", name _player];
	};
}];
