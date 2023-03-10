params ["_entity"];

private _position = switch (typeName _entity) do {
	case "OBJECT": {getPos _entity};
	case "GROUP": {getPos (leader _entity)};
	case "STRING": {getMarkerPos _entity};
	default {_entity};
};

_position
