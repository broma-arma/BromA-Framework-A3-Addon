// File is included in mission framework
private _propertyKeys = ["SIDE", "COLOR", "NAME", "SKILL", "CALLSIGNS", "UNITS", "VEHICLES", "OBJECTS", "DACCAMPS"];
private _properties = [_defaultSide, _defaultColor, _factionName, _factionSkill, _factionCallsigns, _factionUnits, _factionVehicles, _factionObjects, _factionDACCamps];

if (count _this > 1) then {
	private _index = _propertyKeys find toUpper (_this select 1);
	if (_index != -1) then {
		_ret = _properties select _index;
	} else {
		_ret append _properties;
	};
} else {
	_ret append _properties;
};
