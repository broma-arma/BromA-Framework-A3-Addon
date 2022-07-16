params ["_faction"];

#include "\broma_framework\loadouts\includes\private-variables.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

private _assignLoadoutMode = false;

// READ LOADOUT DATA ===========================================================

#include "\broma_framework\loadouts\includes\read-data.sqf"

// =============================================================================

private _ret = [];

#include "\broma_framework\loadouts\includes\return-properties.sqf"

_ret
