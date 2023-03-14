params ["_entity"];

switch (typeName _entity) do {
	case "LOCATION";
	case "OBJECT": { getPos _entity };
	case "GROUP":  { getPos leader _entity };
	case "STRING": { getMarkerPos _entity };
	case "ARRAY": {
		switch (count _entity) do {
			case 0: { [0, 0, 0] };
			case 1: { [_entity#0, _entity#0, _entity#0] };
			case 2: { _entity set [2, 0]; _entity };
			case 3: { _entity };
			default { _entity select [0, 3]; };
		}
	};
	default { _entity };
}
