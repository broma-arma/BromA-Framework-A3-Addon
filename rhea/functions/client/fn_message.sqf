#include "../../defines.hpp"

TRACE_1("fn_message: %1", _this);

params ["_message", ["_color", "FF0000"]];

"BRM_FMK_RHEA" cutText [format ["<t color='#%1' size='1.5' shadow='2'>%2</t>", _color, _message], "PLAIN DOWN", 0.3, true, true];
