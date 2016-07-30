
params ["_unit", "_type",  "_kind"];

_ret = ["", ""];

_prefix = "B";
switch (side _unit) do {
    case WEST: { _prefix = "B" };
    case EAST: { _prefix = "O" };
    case RESISTANCE: { _prefix = "I" };
};

switch (_type) do {
    case "vanilla": {
        _rKind = _prefix + "_UAV_01_backpack_F";
        _rTablet = _prefix + "_UavTerminal";

        _ret = [_rKind, _rTablet];
    };
};

_ret