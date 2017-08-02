/*

    Initializes spectator units.

*/

(_this select 0) spawn {
    _this allowDamage false;
    _this enableSimulation false;
	[_this, true] remoteExec ["hideObjectGlobal", 2];

    sleep 1;

    [_this] joinSilent grpNull;

    if (!(["IsSpectating"] call BIS_fnc_EGSpectator)) then {
        switch (true) do {
            case ("cssa3_spectator" in usedPlugins): {
                ["forced"] call CSSA3_fnc_createSpectateDialog;
            };
            case ("ace3_spectator" in usedPlugins): {
                [true] call ace_spectator_fnc_setSpectator;
            };
            case ("vanilla_spectator" in usedPlugins): {
                ["Initialize", [] call BRM_FMK_VanillaSpectator_fnc_getSettings] call BIS_fnc_EGSpectator;
                [] call BRM_FMK_VanillaSpectator_fnc_centerOnTarget;
            };
            default { _this setDamage 1 };
        };
    };

    sleep 5;

    _this unlinkItem "ItemRadio";
    _this removeItem "ItemRadio";
};