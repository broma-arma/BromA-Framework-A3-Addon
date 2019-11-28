#include "../../defines.hpp"

params ["_display", "_control", "_index"];

private _ctrlLeftContent = _display displayCtrl IDC_MPG_LEFTCONTENT;
switch (_index) do {
	case 0: { // Alphabetical
		lbSort _ctrlLeftContent;
	};
	case 1: { // Mod
		lbSortByValue _ctrlLeftContent;
	};
};
