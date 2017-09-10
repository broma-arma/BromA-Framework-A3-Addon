
_unit = _this select 0;
_kind = _this select 1;
_commonBACKPACK = _this select 2;

switch (true) do {
    case (mission_TFAR_enabled): {
        _side = side _unit;

        switch(_side) do {
            case WEST: {
                switch(_kind) do {
                    case "SR": {
                        [{(time > 6)}, {
                            params ["_unit", "_radio"];
                            if !(call TFAR_fnc_haveSWRadio) then { _unit linkItem _radio };
                        }, [_unit, "TFAR_rf7800str"]] call CBA_fnc_waitUntilAndExecute;
                    };
                    case "LR": {
                        [{(time > 3)}, {
                            params ["_unit", "_radio"];
                            if !(call TFAR_fnc_haveSWRadio) then { _unit linkItem _radio };
                        }, [_unit, "TFAR_anprc152"]] call CBA_fnc_waitUntilAndExecute;
                    };
                    case "BP": { removeBackpack _unit; _unit addBackPack "TFAR_rt1523g_big_bwmod" };
                };
            };
            case EAST: {
                switch(_kind) do {
                    case "SR": {
                        [{(time > 6)}, {
                            params ["_unit", "_radio"];
                            if !(call TFAR_fnc_haveSWRadio) then { _unit linkItem _radio };
                        }, [_unit, "TFAR_pnr1000a"]] call CBA_fnc_waitUntilAndExecute;
                    };
                    case "LR": {
                        [{(time > 3)}, {
                            params ["_unit", "_radio"];
                            if !(call TFAR_fnc_haveSWRadio) then { _unit linkItem _radio };
                        }, [_unit, "TFAR_fadak"]] call CBA_fnc_waitUntilAndExecute;
                    };
                    case "BP": { removeBackpack _unit; _unit addBackPack "TFAR_mr3000" };
                };
            };
            case RESISTANCE: {
                switch(_kind) do {
                    case "SR": {
                        [{(time > 6)}, {
                            params ["_unit", "_radio"];
                            if !(call TFAR_fnc_haveSWRadio) then { _unit linkItem _radio };
                        }, [_unit, "TFAR_anprc154"]] call CBA_fnc_waitUntilAndExecute;
                    };
                    case "LR": {
                        [{(time > 3)}, {
                            params ["_unit", "_radio"];
                            if !(call TFAR_fnc_haveSWRadio) then { _unit linkItem _radio };
                        }, [_unit, "TFAR_anprc148jem"]] call CBA_fnc_waitUntilAndExecute;
                    };
                    case "BP": { removeBackpack _unit; _unit addBackPack "TFAR_anprc155" };
                };
            };
        };
    };

    case (mission_ACRE2_enabled): {
        switch(_kind) do {
            case "SR": { _unit addItem "ACRE_PRC343" };
            case "LR": { _unit addItem "ACRE_PRC148" };
            case "BP": { [_unit, _commonBACKPACK] call BRM_FMK_fnc_addEmptyBackpack; _unit addItemToBackpack "ACRE_PRC117F" };
        };
    };
};