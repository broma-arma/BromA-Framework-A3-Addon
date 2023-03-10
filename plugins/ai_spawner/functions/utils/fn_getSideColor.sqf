params ["_side",["_primaryColors",false]];

private _red = if (_primaryColors) then {"ColorRed"} else {"ColorOPFOR"};
private _blue = if (_primaryColors) then {"ColorBlue"} else {"ColorBLUFOR"};
private _green = if (_primaryColors) then {"ColorGreen"} else {"ColorGUER"};

private _color = switch (_side) do {
	case west: {_blue};
	case east: {_red};
	case resistance: {_green};
	default {"ColorCIV"};
};

_color
