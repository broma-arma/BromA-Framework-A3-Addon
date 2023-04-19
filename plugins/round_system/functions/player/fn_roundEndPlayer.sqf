#include "script_component.hpp"
if (!hasInterface) exitWith {};

[QEGVAR(RespawnSystem,respawn), []] call CBA_fnc_localEvent;
player allowDamage false;
