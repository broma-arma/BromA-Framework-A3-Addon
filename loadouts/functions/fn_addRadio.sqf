
_unit = _this select 0;
_kind = _this select 1;
_commonBACKPACK = _this select 2;

switch (true) do {
    case (mission_TFAR_enabled): {
        _side = side _unit;
        switch(_side) do {
            case WEST: {
                switch(_kind) do {
                    case "SR": { _unit linkItem "tf_rf7800str" };
                    case "LR": { _unit addItem "tf_anprc152" };
                    case "BP": { removeBackpack _unit; _unit addBackPack "tf_rt1523g" };
                };
            };
            case EAST: {
                switch(_kind) do {
                    case "SR": { _unit linkItem "tf_pnr1000a" };
                    case "LR": { _unit addItem "tf_fadak" };
                    case "BP": { removeBackpack _unit; _unit addBackPack "tf_mr3000" };
                };
            };
            case RESISTANCE: {
                switch(_kind) do {
                    case "SR": { _unit linkItem "tf_anprc154" };
                    case "LR": { _unit addItem "tf_anprc148jem" };
                    case "BP": { removeBackpack _unit; _unit addBackPack "tf_anprc155" };
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