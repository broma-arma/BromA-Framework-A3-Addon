diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_entity"];

switch (typeName _entity) do {
	case "LOCATION";
	case "OBJECT": { getPos _entity }; // TODO Instead return ASL, AGL, World, etc?
	case "GROUP":  { getPos leader _entity };
	case "STRING": { getMarkerPos _entity };
	case "ARRAY": {
		switch (count _entity) do {
			case 0: { [0, 0, 0] };
			case 1: { [_entity#0, _entity#0, _entity#0] };
			case 2: { _entity + [0] }; // TODO Support [entity, radius]?
			case 3: { _entity };
			default { _entity select [0, 3]; };
		}
	};
	default { _entity };
}
