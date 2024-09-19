// File is included in mission framework
if (!isPlayer _unit) then {
	private _voices = selectRandom _defaultVoice;
	private _voice = if (_voices isEqualType "") then {
		private _cfgVoices = configFile >> "BRM_FMK" >> "Voices" >> _voices;
		if (isClass _cfgVoices) then {
			getText (_cfgVoices select floor random count _cfgVoices)
		} else {
			_voices
		}
	} else { // Backward compatibility
		selectRandom _voices
	};

	private _faces = selectRandom _defaultFace;
	private _face = if (_faces isEqualType "") then {
		private _cfgFaces = configFile >> "BRM_FMK" >> "Faces" >> _faces;
		if (isClass _cfgFaces) then {
			getText (_cfgFaces select floor random count _cfgFaces)
		} else {
			_faces
		}
	} else { // Backward compatibility
		selectRandom _faces
	};

	private _name = if (!isNil "_defaultName") then {
		private _names = selectRandom _defaultName;
		if (_names isEqualType "") then {
			private _cfgNames = configFile >> "BRM_FMK" >> "Names" >> _names;
			if (isClass _cfgNames) then {
				private _cfgFirst = _cfgNames >> "First";
				private _cfgLast = _cfgNames >> "Last";
				private _cfgGenericNames = _cfgNames >> "genericNames";
				if (isArray (_cfgGenericNames)) then {
					private _randomFirst = [_cfgFirst, count _cfgFirst];
					private _randomLast  = [_cfgLast, count _cfgLast];

					{
						_x = configFile >> "CfgWorlds" >> "GenericNames" >> _x;
						private _cfgGenericFirst = _x >> "FirstNames";
						_randomFirst pushBack [_cfgGenericFirst, count _cfgGenericFirst];
						private _cfgGenericLast  = _x >> "LastNames";
						_randomLast pushBack [_cfgGenericLast, count _cfgGenericLast];
					} forEach getArray _cfgGenericNames;

					_cfgFirst = selectRandomWeighted _randomFirst;
					_cfgLast = selectRandomWeighted _randomLast;
				};
				format ["%1 %2", getText (_cfgFirst select floor random count _cfgFirst), getText (_cfgLast select floor random count _cfgLast)]
			} else {
				_names
			}
		} else { // Backward compatibility
			_names params ["_firstNames", "_lastNames"];
			format ["%1 %2", selectRandom _firstNames, selectRandom _lastNames];
		};
	} else {
		""
	};

	[_unit, _voice, _face, _name] remoteExecCall ["BRM_FMK_Engine_fnc_setUnitIdentity", 0];
};

if (_defaultInsignia != "" && { !isNull ([["CfgUnitInsignia", _defaultInsignia], configNull] call BIS_fnc_loadClass) }) then {
	[_unit, _defaultInsignia] call BIS_fnc_setUnitInsignia;
};
