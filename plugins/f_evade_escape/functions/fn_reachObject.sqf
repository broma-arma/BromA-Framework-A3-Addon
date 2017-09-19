
if (!isServer) exitWith {};

[{(time > 3)}, {
    params["_list", "_obj", "_safeDistance", "_code"];

    private _grp = [];
    { _grp pushBack (call compile format ["%1", _x]) } forEach _list;

    _waitingToReachObjective = [{
        params["_args", "_PFHhandle"];
        _args params["_grp", "_obj", "_safeDistance", "_code"];

        private _alive = 0;
        { _alive = _alive + ({alive _x} count (units _x)) } forEach _grp;

        {
            private _y = _x;
            private _safe = 0;

            {
                _safe = _safe + ({ (_x distance _y < _safeDistance) && ((alive _x) && !(_x getVariable ["isDead", false])) } count (units _x));
            } forEach _grp;

            if (_alive == _safe) exitWith {
                [_PFHhandle] call CBA_fnc_removePerFrameHandler;
                call compile _code;
            };
        } forEach _obj;
    }, 10, [_grp, _obj, _safeDistance, _code]] call CBA_fnc_addPerFrameHandler;
}, _this] call CBA_fnc_waitUntilAndExecute;
