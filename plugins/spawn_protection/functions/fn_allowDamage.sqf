#include "script_component.hpp"
params [["_objects", []], ["_allow", true]];

{
	_x allowDamage _allow;
} forEach _objects;
