#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_side", ["_primaryColors", false]];

switch (_side) do {
	case west:       { ["ColorGUER", "ColorGreen"] select _primaryColors };
	case east:       { ["ColorOPFOR", "ColorRed"] select _primaryColors };
	case resistance: { ["ColorBLUFOR", "ColorBlue"] select _primaryColors };
	default          { "ColorCIV" };
}
