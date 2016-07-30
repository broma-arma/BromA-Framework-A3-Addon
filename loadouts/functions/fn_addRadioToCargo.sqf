
_unit = _this select 0;
_kind = _this select 1;
_side = _this select 2;
_amount = _this select 3;

_isBP = false;

private ["_radio"];

switch (true) do {
    case (mission_TFAR_enabled): {
        switch(_side) do {
            case WEST: {
                switch(_kind) do {
                    case "SR": { _radio = "tf_rf7800str" };
                    case "LR": { _radio = "tf_anprc152" };
                    case "BP": { _radio = "tf_rt1523g"; _isBP = true };
                };
            };
            case EAST: {
                switch(_kind) do {
                    case "SR": { _radio = "tf_pnr1000a" };
                    case "LR": { _radio = "tf_fadak" };
                    case "BP": { _radio = "tf_mr3000"; _isBP = true };
                };
            };
            case RESISTANCE: {
                switch(_kind) do {
                    case "SR": { _radio = "tf_anprc154" };
                    case "LR": { _radio = "tf_anprc148jem" };
                    case "BP": { _radio = "tf_anprc155"; _isBP = true };
                };
            };
        };
    };

    case (mission_ACRE2_enabled): {
        switch(_kind) do {
            case "SR": { _radio = "ACRE_PRC343" };
            case "LR": { _radio = "ACRE_PRC148" };
            case "BP": { _radio = "ACRE_PRC117F" };
        };
    };
};

if (_isBP) then { _unit addBackpackCargoGlobal [_radio, _amount];
} else { _unit addItemCargoGlobal [_radio, _amount] };