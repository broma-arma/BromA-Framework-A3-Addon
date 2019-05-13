_unit = _this select 0;
_kind = _this select 1;

_optics = ["Binocular","Rangefinder","Laserdesignator"];
_battery = ["Laserbatteries"];

_isMan = _unit isKindOf "Man";

if _isMan then {
    switch(_kind) do {
        case "binoc": { _unit addWeapon (_optics select 0)};
        case "rangefinder": {
            switch (true) do {
                case (mission_AGM_enabled): { _unit addWeapon "AGM_Vector" };
                case (mission_ACE3_enabled): { _unit addWeapon "ACE_Vector" };
                default { _unit addWeapon (_optics select 1) };
            };
        };
        case "laserdesignator": { _unit addWeapon (_optics select 2); _unit addMagazine (_battery select 0)};
    };
} else {
    switch(_kind) do {
        case "binoc": { _unit addWeaponCargoGlobal (_optics select 0)};
        case "rangefinder": {
            switch (true) do {
                case (mission_AGM_enabled): { _unit addWeaponCargoGlobal "AGM_Vector" };
                case (mission_ACE3_enabled): { _unit addWeaponCargoGlobal "ACE_Vector" };
                default { _unit addWeaponCargoGlobal (_optics select 1) };
            };
        };
        case "laserdesignator": { _unit addWeaponCargoGlobal (_optics select 2); _unit addMagazineCargoGlobal (_battery select 0)};
    };
};
