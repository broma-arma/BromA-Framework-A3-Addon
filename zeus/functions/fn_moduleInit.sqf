//BRM_FMK_Zeus_fnc_moduleInit
params ["_logic"];

private _cfgLogic = configOf _logic;
private _function = getText (_cfgLogic >> "function");
if (_function == "") exitWith {
	format ["Module function is missing for %1 (%2)", getText (_cfgLogic >> "displayName"), configName _logic] call BRM_FMK_fnc_error;
	if (local _logic) then {
		deleteVehicle _logic;
	};
};

[{
	params ["_logic", "_function"];
	private _cfgLogic = configOf _logic;
	private _isVolatile = getNumber (_cfgLogic >> "isVolatile") > 0;

	if (!_isVolatile) then {
		_logic hideObject true;

		if (isServer) then {
			private _oldGroup = group _logic;
			private _group = missionNamespace getVariable [format ["bis_fnc_initModules_%1", getText (_cfgLogic >> "category")], group (missionNamespace getVariable ["bis_functions_mainscope", objNull])];
			[_logic] joinSilent _group;
			if (count units _oldGroup == 0) then {
				deleteGroup _oldGroup;
			};
		};
	};

	if (local _logic) then {
		private _object = _logic getVariable ["bis_fnc_curatorAttachObject_object", objNull];
		if (_isVolatile) then {
			deleteVehicle _logic;
		};
		private _fnc_function = missionNamespace getVariable _function;
		private _gui = getText (_cfgLogic >> "gui");
		if (_gui != "") then {
			if (["Init", _object] call _fnc_function) then {
				private _display = createDialog [_gui, true];
				_display setVariable ["BRM_FMK_Zeus_fnc_moduleInit", [_function, _object]];
				_display displayAddEventHandler ["Unload", {
					params ["_display"];
					_display getVariable "BRM_FMK_Zeus_fnc_moduleInit" params ["_function", "_object"];
					["onUnload", _this, _object] call (missionNamespace getVariable _function);
				}];
				["onLoad", [_display], _gui] call BRM_FMK_Zeus_fnc_rscDisplayAttributes;
				["onLoad", [_display, configFile >> _gui], _object] call _fnc_function;
			};
		} else {
			[_object] call _fnc_function;
		};
	};
}, [_logic, _function]] call CBA_fnc_execNextFrame;
