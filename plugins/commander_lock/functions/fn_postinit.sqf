#include "script_component.hpp"
[] call FUNC(getSettings) params ["_tvt"];

// TODO Automate commanders list
private _commanders = missionNamespace getVariable ["co_lock_units", ["blu_0_0_1", "blu_1_0_1", "op_0_0_1", "op_1_0_1", "ind_0_0_1", "ind_1_0_1"]];
if (_commanders isEqualType "") then { // Backwards compatibility
	_commanders = call compile _commanders;
} else {
	_commanders = _commanders apply { missionNamespace getVariable [_x, objNull] };
};

if (isServer) then {
    locked_sides = [];
    co_lock_allSidesReady = false;
    publicVariable "co_lock_allSidesReady";

    {
        if ((!(side _x in locked_sides))&&!(str _x == "<NULL-object>")) then {
            locked_sides pushBack (side _x);
        };
    } forEach _commanders;
    publicVariable "locked_sides";
};

if (hasInterface) then {
    [{(!isNil "co_lock_allSidesReady") && (!isNil "locked_sides")}, {
        if (!(side player in locked_sides)) exitWith {};

		params ["_commanders", "_tvt"];

        private _coLockTextSelect = if (_tvt) then {1} else {0};

        if (player in _commanders) then {
            private _coLockTextStart = ["Start the mission.", "Ready your side."];
            private _coLockTextStarted = ["The commander declares the mission as go!", "All sides are ready - mission start."];
            private _coLockActionCondition = "(side player in locked_sides)";

            _coLockTextStart = _coLockTextStart select _coLockTextSelect;
            _coLockTextStarted = _coLockTextStarted select _coLockTextSelect;

            private _coLockAlertColorValues = switch (side player) do {
                case WEST: { ["AlertBLU", ["blue"] call FUNCMAIN(colorToHex)] };
                case EAST: { ["AlertOP", ["red"] call FUNCMAIN(colorToHex)] };
                case RESISTANCE: { ["AlertIND", ["green"] call FUNCMAIN(colorToHex)] };
                default { ["AlertBLU", ["blue"] call FUNCMAIN(colorToHex)] }
            };

            _coLockAlertColorValues params ["_alertNotificationColor", "_alertTextColor"];

            private _addActionText = format["<t color='%1'>%2</t>", _alertTextColor, _coLockTextStart];

            player addAction [_addActionText, {
                params ["_caller", "_target", "_index", "_arguments"];
                _arguments params ["_alertNotificationColor", "_coLockTextStarted", "_tvt"];

                locked_sides = locked_sides - [side player]; publicVariable "locked_sides";
                if (count locked_sides <= 0) then { co_lock_allSidesReady = true; publicVariable "co_lock_allSidesReady" };

                private _coLockNotificationParameters = if (_tvt) then {
                    private _returnValues = [_alertNotificationColor, 0];

                    if !(co_lock_allSidesReady) then {
                        private _sideName = [(side player), "name"] call FUNCMAIN(getSideInfo);
                        private _readyText = format["%1 is ready to begin the mission.", _sideName];
                        _returnValues set [0, "Alert"];
                        _returnValues pushBack _readyText;
                    };
                    _returnValues
                } else { ["Alert", (side player)] };

                _coLockNotificationParameters params ["_coLockNotificationColor", "_notificationCondition", ["_coLockNotificationText", _coLockTextStarted]];
                [_coLockNotificationColor, [_coLockNotificationText]] remoteExec ["BIS_fnc_showNotification", _notificationCondition];
            }, [_alertNotificationColor, _coLockTextStarted, _tvt], 0.5, true, true, "", _coLockActionCondition];

        } else {
            private _coLockPlayerFreeCondition = (((!_tvt) && (side player in locked_sides)) || ((_tvt) && (!co_lock_allSidesReady)));

            if (_coLockPlayerFreeCondition) then {
                private _coLockTextWait = ["Please wait until the Commander clears the mission to begin.", "Please wait until all teams are ready."];
                _coLockTextWait = _coLockTextWait select _coLockTextSelect;

                private _deleteProjectile = { deleteVehicle (_this select 6) };

                _removeBulletsEH = player addEventHandler ["Fired", _deleteProjectile];
                _removeACEThrowingEH = ["ACE_advanced_throwing_throwFiredXEH", _deleteProjectile] call CBA_fnc_addEventHandler;
                _removeExplosivesEH = ["ACE_Explosives_place", { deleteVehicle (_this select 0) }] call CBA_fnc_addEventHandler;

                _perFrameHandlePlayer = [{
                    params ["_coLockTextWait"];
                    if (typeof (vehicle player) != (typeof player)) then {
                        player action ["getout", (vehicle player)];
                        hint _coLockTextWait;
                    };
                }, 0.5, _coLockTextWait] call CBA_fnc_addPerFrameHandler;

                [{!((!(_this select 4) && (side player in locked_sides)) || ((_this select 4) && (!co_lock_allSidesReady)))}, {
                    params["_removeBulletsEH", "_perFrameHandlePlayer", "_removeACEThrowingEH", "_removeExplosivesEH"];

                    player removeEventHandler ["Fired", _removeBulletsEH];
                    [_perFrameHandlePlayer] call CBA_fnc_removePerFrameHandler;
                    ["ACE_advanced_throwing_throwFiredXEH", _removeACEThrowingEH] call CBA_fnc_removeEventHandler;
                    ["ACE_explosives_place", _removeExplosivesEH] call CBA_fnc_removeEventHandler;
                },[_removeBulletsEH, _perFrameHandlePlayer, _removeACEThrowingEH, _removeExplosivesEH, _tvt]] call CBA_fnc_waitUntilAndExecute;
            };
        };
    }, [_commanders, _tvt]] call CBA_fnc_waitUntilAndExecute;
};
