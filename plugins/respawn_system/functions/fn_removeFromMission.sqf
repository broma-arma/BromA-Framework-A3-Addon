params["_unit"];

private _gear = [_unit] call BRM_FMK_fnc_getGear;
_unit setVariable ["unit_respawn_gear", _gear, true];

if (mission_TFAR_enabled) then { _unit setVariable ["tf_unable_to_use_radio", true] };

[{
    params["_unit"];

    removeVest _unit;
    removeHeadgear _unit;
    removeBackpack _unit;
    removeGoggles _unit;
    removeUniform _unit;
    removeAllItems _unit;
    removeAllWeapons _unit;

    private _oldgrp = (group _unit);
    private _oldBody = _unit;

    _unit setVariable ["isDead", true, true];
    [_unit] joinSilent grpNull;

    [_unit] call BRM_FMK_fnc_initSpectator;

    [{
        params["_unit", "_oldgrp", "_oldBody"];

        _waitingToRespawn = [{
            params["_args", "_PFHhandle"];
            _args params["_unit", "_oldgrp", "_oldBody"];
            private _reviveCondition = (!([getPlayerUID _unit, name _unit, (_unit getVariable "unit_side")] in mission_dead_players));

            if (_reviveCondition) then {
                _unit setVariable ["isDead", false, true];

                [{
                    params["_unit", "_oldgrp"];
                    [_unit] joinSilent _oldgrp;
                }, [_unit, _oldgrp], 5] call CBA_fnc_waitAndExecute;

                // No idea why this doesn't work.
                hideBody _oldBody;
                [{ deleteVehicle _this }, _oldBody, 10] call CBA_fnc_waitAndExecute;

                detach _unit;
                _unit enableSimulation true;

                _rGear = _unit getVariable ["unit_respawn_gear", []];
                [_unit, _rGear] call BRM_FMK_fnc_setGear;

                _respawn = [_unit] call BRM_FMK_fnc_getSpawnPoint;
                _unit setPos getMarkerPos _respawn;

                [_unit] call BRM_FMK_fnc_endSpectator;

                [_PFHhandle] call CBA_fnc_removePerFrameHandler;
            };
        }, 5, [_unit, _oldgrp, _oldBody]] call CBA_fnc_addPerFrameHandler;
    }, [_unit, _oldgrp, _oldBody], 15] call CBA_fnc_waitAndExecute;
}, [_unit], 1] call CBA_fnc_waitAndExecute;
