#include "script_component.hpp"

params [["_includeLogic", true, [true]]];

private _entities = [];

private _cfgEntities = GVARMAIN(missionSQM) >> "Mission" >> "Entities";
private _items = getNumber (_cfgEntities >> "items");
for "_i" from 0 to _items - 1 do {
	private _cfgItem = _cfgEntities >> format ["Item%1", _i];
	private _dataType = getText (_cfgItem >> "dataType");
	if (_dataType == "Group") then {
		private _cfgGroupEntities = _cfgItem >> "Entities";
		private _items = getNumber (_cfgGroupEntities >> "items");
		for "_i" from 0 to _items - 1 do {
			private _cfgAttributes = _cfgGroupEntities >> format ["Item%1", _i] >> "Attributes";
			if (getNumber (_cfgAttributes >> "isPlayable") > 0) then {
				_entities pushBack [getText (_cfgAttributes >> "type"), getText (_cfgAttributes >> "name")];
			};
		};
	} else {
		if (_includeLogic && _dataType == "Logic") then {
			if (getNumber (_cfgItem >> "isPlayable") > 0) then {
				_entities pushBack [getText (_cfgItem >> "type"), getText (_cfgItem >> "name")];
			};
		};
	};
};

_entities
