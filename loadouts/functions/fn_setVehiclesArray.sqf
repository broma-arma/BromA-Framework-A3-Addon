_vehicles = _this;

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"

_returnArray = [];

_returnArray set [AA_VEHICLES, _vehicles select AA_VEHICLES];
_returnArray set [ATTACK_HELOS, _vehicles select ATTACK_HELOS];
_returnArray set [ATTACK_PLANES, _vehicles select ATTACK_PLANES];
_returnArray set [HEAVY_VEHICLES, _vehicles select HEAVY_VEHICLES];
_returnArray set [LIGHT_VEHICLES, _vehicles select LIGHT_VEHICLES];
_returnArray set [MEDIUM_VEHICLES, _vehicles select MEDIUM_VEHICLES];
_returnArray set [MOBILE_ARTILLERY, _vehicles select MOBILE_ARTILLERY];
_returnArray set [TRANSPORT_HELOS, _vehicles select TRANSPORT_HELOS];
_returnArray set [TRANSPORT_PLANES, _vehicles select TRANSPORT_PLANES];
_returnArray set [TRANSPORT_TRUCKS, _vehicles select TRANSPORT_TRUCKS];
_returnArray set [STATIC_DEFENSE, _vehicles select STATIC_DEFENSE];
_returnArray set [BOATS, _vehicles select BOATS];
_returnArray set [UAV, _vehicles select UAV];
_returnArray set [UGV, _vehicles select UGV];
_returnArray set [SUPPORT, _vehicles select SUPPORT];
_returnArray set [SUBMARINES, _vehicles select SUBMARINES];
_returnArray set [MRAP_VEHICLES, _vehicles select MRAP_VEHICLES];

_returnArray
