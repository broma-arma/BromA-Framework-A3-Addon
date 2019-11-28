#include "../../defines.hpp"

params ["_event"];

_this = _this select [1, count _this];

switch (_event) do {
	case "Load": {
		params ["_display"];

		uiNamespace setVariable ["MPG_display", _display];

		cutText ["", "plain"];
		showCommandingMenu "";

		private _camera = "camera" camCreate position player;
		_camera camSetTarget player;
		_camera camSetRelPos [0, 0, 0];
		_camera cameraEffect ["internal", "back"];
		_camera camPrepareFocus [-1, -1];
		_camera camPrepareFov 0.35;
		_camera camCommitPrepared 0;

		showCinemaBorder false;

		MPDisplayGarage_config params ["_position", "_direction", "_allowExternal", "_vehicleFilter", "_spawnHandler", "_allowIncompatiblePylons"];
		_display setVariable ["MPG_config", +MPDisplayGarage_config];
		MPDisplayGarage_config = nil;

		private _vehicleKeys = [
			// [key, key, ...]
			[], // Car
			[], // Tank
			[], // Helicopter
			[], // Plane
			[], // Naval
			[]  // Static
		];
		// [[values], [values], ...]
		private _vehicles = +_vehicleKeys;
		private _defaultCrew = getText (configfile >> "CfgVehicles" >> "All" >> "crew");
		{
			private _configName = configName _x;
			private _dataIndex = switch (true) do {
				case (_configName isKindOf "Car");
				case (_configName isKindOf "Motorcycle"): { 0 };
				case (_configName isKindOf "Tank"): { 1 };
				case (_configName isKindOf "Helicopter"): { 2 };
				case (_configName isKindOf "Plane"): { 3 };
				case (_configName isKindOf "Ship"): { 4 };
				case (_configName isKindOf "StaticWeapon"): { 5 };
				default { -1 };
			};
			if (_dataIndex != -1) then {
				if ([_x] call _vehicleFilter) then {
					private _dataKeys = _vehicleKeys select _dataIndex;
					private _dataValues = _vehicles select _dataIndex;

					private _key = toLower (getText (_x >> "model") + (if (getNumber (_x >> "forceInGarage") > 0) then {
						configName _x
					} else {
						getText (_x >> "displayName")
					}));

					private _index = _dataKeys find _key;
					if (_index == -1) then {
						_index = _dataKeys pushBack _key;
						_dataValues pushBack [];
					};
					_dataValues select _index pushBack _x;
				};
			} else {
				diag_log text format ["CfgVehicles '%1' is an unknown vehicle type: %2", _configName, inheritsFrom _x];
			};
		} forEach ("isClass _x && {getNumber (_x >> 'scope') == 2} && {getText (_x >> 'crew') != _defaultCrew}" configclasses (configFile >> "CfgVehicles"));

		{
			(_display displayCtrl _x) ctrlEnable (count (_vehicles select _forEachIndex) > 0);
		} forEach [IDC_MPG_TABCAR, IDC_MPG_TABTANK, IDC_MPG_TABHELICOPTER, IDC_MPG_TABPLANE, IDC_MPG_TABNAVAL, IDC_MPG_TABSTATIC];

		// Sort vehicles alphabetically by display name
		_vehicles = _vehicles apply { [_x, [], { getText (_x select 0 >> "displayName") }] call BIS_fnc_sortBy };

		_display setVariable ["MPG_vehicles", _vehicles];
		_display setVariable ["MPG_vehicle", objNull];
		_display setVariable ["MPG_camera",  _camera];
		_display setVariable ["MPG_cameraData", [0, -45, 10, [0, 20]]]; // [yaw, pitch, distance, [minDistance, maxDistance]]

		private _modListOrder = configSourceModList (configFile >> "CfgPatches");
		_modListOrder = (_modListOrder arrayIntersect _modListOrder) apply { modParams [_x, ["defaultMod", "name"]] };
		_modListOrder sort true;
		_modListOrder = _modListOrder apply { _x select 1 };

		_display setVariable ["MPG_modListOrder", _modListOrder]; // mod list order
		_display setVariable ["MPG_compatiblePylons", if (_allowIncompatiblePylons) then { profileNamespace getVariable ["MPG_compatiblePylons", true] } else { true }];

		private _ctrlMouseArea = _display displayCtrl IDC_MPG_MOUSEAREA;
		_ctrlMouseArea setVariable ["mouseState", [false, false]];
		_ctrlMouseArea setVariable ["mousePosition", [0, 0]];
		{
			_ctrlMouseArea ctrlAddEventHandler [_x, format ["(['MouseArea.%1'] + _this) call BRM_FMK_MPGarage_fnc_onGarageEvent;", _x]];
		} forEach ["MouseButtonDown", "MouseButtonUp", "MouseMoving", "MouseZChanged"];

		["UpdateCamera"] call BRM_FMK_MPGarage_fnc_onGarageEvent;

		{
			private _ctrl = _display displayCtrl _x;
			if (ctrlEnabled _ctrl) exitWith {
				[_display, _ctrl, true] call BRM_FMK_MPGarage_fnc_onLeftTabSelect;
			};
		} forEach [IDC_MPG_TABCAR, IDC_MPG_TABTANK, IDC_MPG_TABHELICOPTER, IDC_MPG_TABPLANE, IDC_MPG_TABNAVAL, IDC_MPG_TABSTATIC];

		private _fnc_initMenu;
		_fnc_initMenu = {
			params ["_control", ["_path", []]];
			private _size = _control menuSize _path;
			if (_size == 0) then {
				private _menuData = _control menuData _path;
				if (_menuData != "") then {
					_control menuSetAction [_path, format ["_this + ['%1'] call BRM_FMK_MPGarage_fnc_onMenuBar;", _menuData]];
				};
			} else {
				for "_i" from 0 to _size - 1 do {
					[_control, (_path + [_i])] call _fnc_initMenu;
				};
			};
		};
		private _ctrlMenu = _display displayCtrl IDC_MPG_MENU;
		[_ctrlMenu] call _fnc_initMenu;

		if (_allowIncompatiblePylons) then {
			private _ctrlMenuOptions = [_ctrlMenu menuAdd [[], "Options"]];
			private _ctrlMenuCompatiblePylons = _ctrlMenuOptions + [_ctrlMenu menuAdd [_ctrlMenuOptions, "Compatible Pylons"]];
			_ctrlMenu menuSetCheck [_ctrlMenuCompatiblePylons, _display getVariable "MPG_compatiblePylons"];
			_ctrlMenu menuSetAction [_ctrlMenuCompatiblePylons, "params ['_control', '_path']; private _compatiblePylons = _control menuChecked _path; ctrlParent _control setVariable ['MPG_compatiblePylons', _compatiblePylons]; profileNamespace setVariable ['MPG_compatiblePylons', _compatiblePylons]; saveProfileNamespace;"];
		};

		_display setVariable ["MPG_EH_Draw3D", addMissionEventHandler ["Draw3D", {
			private _display = uiNamespace getVariable ["MPG_display", displayNull];
			if (isNull _display) exitWith {};
			private _vehicle = _display getVariable ["MPG_vehicle", objNull];
			if (isNull _vehicle) exitWith {};

			private _vehiclePylons = _vehicle getVariable ["MPG_pylons", []];
			{
				_x params ["_pylonIndex", "_priority", "_attachment", "_turret", "_selectionPos", "_mirrorPylonIndex"];

				private _ctrlPylonBackground = _display displayCtrl (IDC_MPG_LOADOUT_PYLONS_CREATE + _forEachIndex * 2);
				private _ctrlPylon = _display displayCtrl (IDC_MPG_LOADOUT_PYLONS_CREATE + _forEachIndex * 2 + 1);

				private _uiPos = worldToScreen (_vehicle modelToWorldVisual _selectionPos);
				if (count _uiPos > 0) then {
					private _ctrlPos = ctrlPosition _ctrlPylonBackground;
					_ctrlPos set [0, (_uiPos select 0) - (_ctrlPos select 2) / 2];
					_ctrlPos set [1, (_uiPos select 1) - (_ctrlPos select 3) / 2];
					{
						_x ctrlSetPosition _ctrlPos;
						_x ctrlCommit 0;
					} forEach [_ctrlPylonBackground, _ctrlPylon];
				};
			} forEach _vehiclePylons;
		}]];
	};
	case "Unload": {
		params ["_display", "_exitCode"];

		removeMissionEventHandler ["Draw3D", _display getVariable "MPG_EH_Draw3D"];

		private _camera = _display getVariable "MPG_camera";
		_camera cameraEffect ["terminate", "back"];
		camDestroy _camera;

		deleteVehicle (_display getVariable "MPG_vehicle");

		uiNamespace setVariable ["MPG_display", nil];
	};

	case "OKClicked": {
		params ["_control"];

		private _display = ctrlParent _control;
		private _vehicle = _display getVariable "MPG_vehicle";
		private _cfgVehicle = configFile >> "CfgVehicles" >> typeOf _vehicle;

		// Texture
		private _texture = 0 call {
			private _vehicleTextures = getObjectTextures _vehicle;
			private _current = "";
			{
				if (getText (_x >> "displayName") != "") then {
					private _textures = getArray (_x >> "textures") apply { toLower _x };
					private _selected = for "_i" from 0 to (count _textures min count _vehicleTextures) do {
						private _texture = _textures select _i;
						private _vehicleTexture = _vehicleTextures select _i;
						if (_texture != _vehicleTexture && {_texture find _vehicleTexture < 0}) exitWith { false };

						true
					};
					if (_selected) exitWith {
						_current = configName _x;
					};
				};
			} forEach configProperties [_cfgVehicle >> "TextureSources", "isClass _x", true];

			_current
		};

		// Animation
		private _animations = [];
		{
			if (getText (_x >> "displayName") != "" && [_x, "scope", 2] call BIS_fnc_returnConfigEntry > 1) then {
				private _animClassName = configName _x;

				_animations pushBack _animClassName;
				_animations pushBack ([0, 1] select (_vehicle animationPhase _animClassName > 0));
			};
		} forEach configProperties [_cfgVehicle >> "AnimationSources", "isClass _x", true];

		// Loadout
		private _loadout = (_vehicle getVariable "MPG_pylons") apply {
			_x params ["_pylonIndex", "_pylonPriority", "_pylonAttachment", "_pylonTurret", "_pylonSelectionName", "_mirrorPylonIndex"];

			[_pylonIndex, _pylonPriority, _pylonAttachment, _pylonTurret]
		};

		_display getVariable "MPG_config" params ["_position", "_direction", "_allowExternal", "_vehicleFilter", "_spawnHandler", "_allowIncompatiblePylons"];

		private _vehicleType = typeOf _vehicle;

		_display closeDisplay 1;

		[_vehicle, _spawnHandler, _position, _direction, _vehicleType, _texture, _animations, _loadout] spawn {
			params ["_vehicle", "_spawnHandler", "_position", "_direction", "_vehicleClass", "_texture", "_animations", "_loadout"];

			waitUntil { isNull _vehicle };

			[_position, _direction, _vehicleClass, _texture, _animations, _loadout] call _spawnHandler;
		};
	};

	case "MouseArea.MouseButtonDown": {
		params ["_control", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];

		private _mouseState = _control getVariable "mouseState";
		_mouseState set [_button, true];

		private _mousePosition = _control getVariable "mousePosition";
		_mousePosition set [0, _x];
		_mousePosition set [1, _y];
	};
	case "MouseArea.MouseButtonUp": {
		params ["_control", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];

		private _mouseState = _control getVariable "mouseState";
		_mouseState set [_button, false];

		private _mousePosition = _control getVariable "mousePosition";
		_mousePosition set [0, _x];
		_mousePosition set [1, _y];
	};
	case "MouseArea.MouseMoving": {
		params ["_control", "_x", "_y"];

		private _mouseState = _control getVariable "mouseState";
		_mouseState params ["_left", "_right"];

		private _mousePosition = _control getVariable "mousePosition";
		_mousePosition params ["_lx", "_ly"];
		_mousePosition set [0, _x];
		_mousePosition set [1, _y];

		if (_right) then {
			private _dx = _x - _lx;
			private _dy = _y - _ly;

			private _display = ctrlParent _control;
			private _cameraData = _display getVariable "MPG_cameraData";
			_cameraData set [0, ((_cameraData select 0) - _dX * 180) % 360];
			_cameraData set [1, ((_cameraData select 1) - _dY * 90) max -89 min 89];
			["UpdateCamera"] call BRM_FMK_MPGarage_fnc_onGarageEvent;
		};
	};
	case "MouseArea.MouseZChanged": {
		params ["_control", "_dz"];

		private _display = ctrlParent _control;
		private _cameraData = _display getVariable "MPG_cameraData";
		(_cameraData select 3) params ["_minDistance", "_maxDistance"];
		_cameraData set [2, ((_cameraData select 2) - _dZ) max _minDistance min _maxDistance];

		["UpdateCamera"] call BRM_FMK_MPGarage_fnc_onGarageEvent;
	};

	case "UpdateCamera": {
		private _display = uiNamespace getVariable "MPG_display";

		private _camera = _display getVariable "MPG_camera";
		(_display getVariable "MPG_cameraData") params ["_yaw", "_pitch", "_dist", "_distLimits"];

		private _cosPitch = cos _pitch;
		_camera camSetRelPos [
			_dist * cos _yaw * _cosPitch,
			_dist * sin _yaw * _cosPitch,
			_dist * -sin _pitch
		];

		_camera camCommit 0;
	};
};
