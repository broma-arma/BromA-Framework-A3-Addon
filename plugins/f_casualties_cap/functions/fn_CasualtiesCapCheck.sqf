#include "component.hpp"

if (isServer) then {
    params["_grpstemp", "_pc", "_end"];

    private _type = typeName _grpstemp;

    if (_type == "SIDE") then {
        private _tempGrp = [];
        { if((side _x == _grpstemp) && (leader _x in playableUnits)) then { _tempGrp append [_x] } } forEach allGroups;
        _grpstemp = _tempGrp;
    };

    [{
        private ["_grpsel"];
        params["_grpstemp", "_pc", "_end"];

        private _counter = 0;
        private _started = 0;
        private _grpsno = count _grpstemp;

        private _grps = _grpstemp select {!isNull _x && {({alive _x} count (units _x)) >= 1 }};

        { _started = _started + (count (units _x)) } forEach _grps;

        _checkForDead = [{
            params["_args", "_PFHhandle"];
            _args params["_grps", "_grpsel", "_started", "_pc", "_end"];

            private _remaining = 0;
            private _counter = 0;
            private _grpsno = count _grps;

            while {(_counter < _grpsno)} do {
                _grpsel = _grps select _counter;
                private _alive = {alive _x} count (units _grpsel);
                _remaining = (_remaining  + _alive);
                _counter = (_counter + 1);
            };

            if (
                (_remaining == 0) ||
                (((_started - _remaining) / _started) >= (_pc / 100))
            ) exitWith {
                [_PFHhandle] call CBA_fnc_removePerFrameHandler;
                [_end] call BRM_FMK_fnc_callEnding;
            };
        }, 5, [_grps, _grpsel, _started, _pc, _end]] call CBA_fnc_addPerFrameHandler;
    }, _this, 5] call CBA_fnc_waitAndExecute;
};
