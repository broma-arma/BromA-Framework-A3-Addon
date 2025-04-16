#include "../../defines.hpp"

TRACE_1("fn_isOpen: %1", _this);

!isNull (uiNamespace getVariable ["BRM_FMK_RHEA_loginDialog", displayNull]) || !isNull findDisplay getNumber (configFile >> "BRM_FMK_RHEA_main" >> "idd")
