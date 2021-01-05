#include "component.hpp"

#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

private _properties = ["_side", "_color", "_name", "_skill", "_callsigns", "_units", "_vehicles", "_objects", "_dacCamps"];

{
	private _sideChar = _x;
	private _sideProperties = [missionNamespace getVariable format ["side_%1_faction", _sideChar]] call BRM_fnc_getLoadoutProperty;
	{
		private _propertyName = _x;
		if (_forEachIndex > 0) then { // Skip `_side`
			missionNamespace setVariable [format ["side_%1%2", _sideChar, _propertyName], _sideProperties select _forEachIndex];
		};
	} forEach _properties;
} forEach ["a", "b", "c"];
