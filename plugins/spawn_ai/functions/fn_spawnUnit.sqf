#include "script_component.hpp"
_unit = (_this select 0) createUnit [(_this select 1), (_this select 2), [], 0, "FORM"];
_unit setSkill (_this select 3);

[_unit, (_this select 4)] call FUNCMAIN(initAI);

if (!isMultiplayer) then {
    [_unit, (_this select 5)] spawn {
        _unit = _this select 0;
        _color = _this select 1;

        _marker = ["local", getPos _unit, "hd_dot", "Color"+_color, "", [1,1], 0, 1] call FUNCMAIN(newMarkerIcon);

        while {(alive _unit)} do {
            sleep 0.1;
            _marker setMarkerPos getPos _unit;
        };
        deleteMarker _marker;
    };
};

if (count _this < 7 ) then { _this set [6, "x"] };

["LOCAL", "CHAT", format["Created unit (%3): %1 at %2", (_this select 1), (_this select 2), (_this select 6)]] call FUNCMAIN(doLog);

_unit
