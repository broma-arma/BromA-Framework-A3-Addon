// BRM_FMK_Zeus_fnc_initCuratorAttribute
params ["_mode", "_params"];

switch (_mode) do {
	case "onLoad": {
		_params params ["_control", "_config"];
		_control setVariable ["BRM_FMK_Zeus_fnc_initCuratorAttribute_config", _config];
	};
	case "onSetFocus": {
		_params params ["_control"];

		_control ctrlRemoveEventHandler [_thisEvent, _thisEventHandler];

		private _display = ctrlParent _control;
		private _attrInits = _display getVariable "BRM_FMK_Zeus_fnc_initCuratorAttribute_attrInits";
		if (isNil "_attrInits") then {
			_attrInits = [];
			_display setVariable ["BRM_FMK_Zeus_fnc_initCuratorAttribute_attrInits", _attrInits];

			_display displayAddEventHandler ["Unload", { ["onUnload", _this] call BRM_FMK_Zeus_fnc_initCuratorAttribute; }];
			_display displayCtrl 1 ctrlAddEventHandler ["ButtonClick", { ["onButtonClick", _this] call BRM_FMK_Zeus_fnc_initCuratorAttribute; }];
		};

		private _attrInit = compile getText (_control getVariable "BRM_FMK_Zeus_fnc_initCuratorAttribute_config" >> "onAttrInit");
		_attrInits pushBack _attrInit;

		private _target = missionNamespace getVariable "BIS_fnc_curatorObjectPlaced_mouseOver" param [1, objNull];
		if (!isNull attachedTo _target) then {
			_target = attachedTo _target;
		};
		["onLoad", [ctrlParent _control], _target] call _attrInit;
	};
	case "onUnload": {
		_params params ["_display", "_exitCode"];
		private _target = missionNamespace getVariable "BIS_fnc_curatorObjectPlaced_mouseOver" param [1, objNull];
		if (!isNull attachedTo _target) then {
			_target = attachedTo _target;
		};
		{
			["onUnload", _params, _target] call _x;
		} forEach (_display getVariable "BRM_FMK_Zeus_fnc_initCuratorAttribute_attrInits");
	};
	case "onButtonClick": {
		_params params ["_control"];
		private _display = ctrlParent _control;
		private _target = missionNamespace getVariable "BIS_fnc_curatorObjectPlaced_mouseOver" param [1, objNull];
		if (!isNull attachedTo _target) then {
			_target = attachedTo _target;
		};
		{
			["confirmed", [ctrlParent _control], _target] call _x;
		} forEach (_display getVariable "BRM_FMK_Zeus_fnc_initCuratorAttribute_attrInits");

		false
	};
};
