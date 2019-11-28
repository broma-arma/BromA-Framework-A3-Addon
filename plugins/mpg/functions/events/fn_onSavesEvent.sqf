#include "../../defines.hpp"

params ["_event"];

_this = _this select [1, count _this];

(uiNamespace getVariable ["MPG_saves_config", [false]]) params ["_save"];

switch (_event) do {
	case "Open": {
		uiNamespace setVariable ["MPG_saves_config", +_this];
		createDialog "MPDisplayGarage_Saves";
	};
	case "Load": {
		params ["_dialog"];

		private _ctrlTitle = _dialog displayCtrl IDC_MPG_SAVES_TITLE;
		_ctrlTitle ctrlSetText (if (_save) then { "Save" } else { "Load" });

		private _ctrlList = _dialog displayCtrl IDC_MPG_SAVES_LIST;
		private _ctrlName = _dialog displayCtrl IDC_MPG_SAVES_NAME;
		_ctrlName ctrlShow _save;

		//[["Save Name", typeOf _vehicle, _animations, _vehicleTexture, _vehiclePylons], ...]
		private _saves = profileNamespace getVariable ["MPG_saves", []];

		private _display = uiNamespace getVariable "MPG_display";
		private _vehicleFilter = _display getVariable "MPG_config" select 3;

		lbClear _ctrlList;
		private _savesSort = [];
		{
			_x params ["_name", "_vehicle", "_animations", "_vehicleTexture", "_vehiclePylons"];

			private _cfgVehicle = configFile >> "CfgVehicles" >> _vehicle;

			private _error = 0;
			private _value = _forEachIndex;
			private _tooltip = "";
			private _color = [];
			if !(isClass _cfgVehicle && { [_cfgVehicle] call _vehicleFilter }) then {
				_value = _forEachIndex;
				if (isClass _cfgVehicle) then {
					_error = 1;
					_color = [0.5, 0.5, 0.5, 1];
					_tooltip = "Not allowed";
				} else {
					_error = 2;
					_color = [1, 0, 0, 1];
					_tooltip = "Not available";
				};
				if (!_save) then {
					_value = -_forEachIndex - 1;
				};
			};
			_savesSort pushBack [_error, _name, getText (_cfgVehicle >> "picture"), _value, _tooltip, _color];
		} forEach _saves;

		_savesSort sort true;

		{
			_x params ["_error", "_name", "_picture", "_value", "_tooltip", "_color"];

			private _lbIndex = _ctrlList lbAdd _name;
			_ctrlList lbSetPicture [_lbIndex, _picture];
			_ctrlList lbSetValue [_lbIndex, _value];
			if !(_tooltip isEqualTo "") then {
				_ctrlList lbSetTooltip [_lbIndex, _tooltip];
			};
			if !(_color isEqualTo []) then {
				_ctrlList lbSetColor [_lbIndex, _color];
			};
		} forEach _savesSort;

		private _vehicle = _display getVariable "MPG_vehicle";

		if (_save) then {
			_ctrlName ctrlSetText getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		};
	};
	case "Unload": {
		params ["_dialog", "_exitCode"];

		uiNamespace setVariable ["MPG_saves_config", nil];

		if (_exitCode == 1/*OK*/) then {
			if (_save) then {
				["SaveVehicle", ctrlText (_dialog displayCtrl IDC_MPG_SAVES_NAME)] call BRM_FMK_MPGarage_fnc_onSavesEvent;
			} else {
				private _ctrlList = _dialog displayCtrl IDC_MPG_SAVES_LIST;
				private _index = lbCurSel _ctrlList;
				if (_index != -1) then {
					private _saveIndex = _ctrlList lbValue _index;
					if (_saveIndex >= 0) then {
						["LoadVehicle", _saveIndex] call BRM_FMK_MPGarage_fnc_onSavesEvent;
					};
				};
			};
		};
	};
	case "SaveSelected": {
		params ["_dialog", "_ctrlList", "_index"];

		if (_save) then {
			private _saves = profileNamespace getVariable ["MPG_saves", []];

			if (_index != -1) then {
				private _ctrlName = _dialog displayCtrl IDC_MPG_SAVES_NAME;
				_ctrlName ctrlSetText (_saves select (_ctrlList lbValue _index) select 0/*name*/);
			};
		};
	};
	case "DeleteClicked": {
		params ["_dialog", "_ctrlButton"];

		private _ctrlList = _dialog displayCtrl IDC_MPG_SAVES_LIST;
		private _index = lbCurSel _ctrlList;
		if (_index != -1) then {
			private _saves = profileNamespace getVariable ["MPG_saves", []];
			private _saveIndex = _ctrlList lbValue _index;
			if (_saveIndex < 0) then {
				_saveIndex = -_saveIndex - 1;
			};
			_saves deleteAt _saveIndex;
			_ctrlList lbDelete _index;
			profileNamespace setVariable ["MPG_saves", _saves];
			saveProfileNamespace;
		};
	};
	case "SaveVehicle": {
		params ["_name"];

		private _display = uiNamespace getVariable "MPG_display";
		private _vehicle = _display getVariable ["MPG_vehicle", objNull];
		private _cfgVehicle = configFile >> "CfgVehicles" >> typeOf _vehicle;

		private _animations = [];
		// Animations
		{
			if (getText (_x >> "displayName") != "" && [_x, "scope", 2] call BIS_fnc_returnConfigEntry > 1) then {
				private _animClassName = configName _x;
				_animations pushBack _animClassName;
				_animations pushBack ([0, 1] select (_vehicle animationPhase _animClassName > 0));
			};
		} forEach configProperties [_cfgVehicle >> "AnimationSources", "isClass _x", true];

		// Textures
		private _objectTextures = getObjectTextures _vehicle;
		private _vehicleTexture = "";
		{
			private _displayName = getText (_x >> "displayName");
			if (_displayName != "") then {
				private _textures = getArray (_x >> "textures") apply { toLower _x };
				private _selected = for "_i" from 0 to (count _textures min count _objectTextures) do {
					private _texture = _textures select _i;
					private _objectTexture = _objectTextures select _i;
					if (_texture != _objectTexture && {_texture find _objectTexture < 0}) exitWith { false };

					true
				};

				if (_selected) then {
					_vehicleTexture = configName _x;
				};
			};
		} forEach configProperties [_cfgVehicle >> "TextureSources", "isClass _x", true];

		// Pylons
		private _vehiclePylons = _vehicle getVariable ["MPG_pylons", []] apply {
			_x params ["_pylonIndex", "_pylonPriority", "_pylonAttachment", "_pylonTurret", "_pylonSelectionName", "_mirrorPylonIndex"];
			[_pylonIndex, _pylonPriority, _pylonAttachment, _pylonTurret]
		};

		private _saves = profileNamespace getVariable ["MPG_saves", []];

		private _index = -1;
		{ if (_x select 0 == _name) exitWith { _index = _forEachIndex; }; } forEach _saves;
		if (_index == -1) then {
			_index = _saves pushBack [_name];
		};

		private _save = _saves select _index;
		_save resize 1;

		_save pushBack typeOf _vehicle;
		_save pushBack _animations;
		_save pushBack _vehicleTexture;
		_save pushBack _vehiclePylons;

		profileNamespace setVariable ["MPG_saves", _saves];
		saveProfileNamespace;
	};
	case "LoadVehicle": {
		params ["_index"];

		private _saves = profileNamespace getVariable ["MPG_saves", []];

		(_saves select _index) params ["_name", "_vehicleType", "_vehicleAnimations", "_vehicleTexture", "_vehiclePylons"];

		private _display = uiNamespace getVariable "MPG_display";

		private _vehicleTypeIndex = switch (true) do {
			case (_vehicleType isKindOf "Car");
			case (_vehicleType isKindOf "Motorcycle"): { 0 };
			case (_vehicleType isKindOf "Tank"): { 1 };
			case (_vehicleType isKindOf "Helicopter"): { 2 };
			case (_vehicleType isKindOf "Plane"): { 3 };
			case (_vehicleType isKindOf "Ship"): { 4 };
			case (_vehicleType isKindOf "StaticWeapon"): { 5 };
			default { -1 };
		};

		[_display, _display displayCtrl (IDCS_LEFT select _vehicleTypeIndex), false] call BRM_FMK_MPGarage_fnc_onLeftTabSelect;

		private _cfgVehicles = _display getVariable "MPG_vehicles" select (_vehicleTypeIndex);
		private _vehiclesIndex = _cfgVehicles findIf { configName (_x select 0) == _vehicleType };

		private _ctrlLeftContent = _display displayCtrl IDC_MPG_LEFTCONTENT;
		private _leftContentIndex = -1;
		for "_i" from 0 to (lbSize _ctrlLeftContent - 1) do {
			if (((_ctrlLeftContent lbValue _i) % count _cfgVehicles) == _vehiclesIndex) exitWith { 
				_leftContentIndex = _i;
			};
		};
		_ctrlLeftContent lbSetCurSel _leftContentIndex;

		private _vehicle = _display getVariable ["MPG_vehicle", objNull];

		// Apply texture and animations
		[_vehicle, _vehicleTexture, _vehicleAnimations] call BIS_fnc_initVehicle;

		// Apply pylon configuration
		private _mpgPylons = _vehicle getVariable ["MPG_pylons", []];
		private _pylonsPriority = [];
		{
			_x params ["_pylonIndex", "_pylonPriority", "_pylonAttachment", "_pylonTurret"];

			private _mpgPylon = _mpgPylons select (_mpgPylons findIf { _x select 0 == _pylonIndex });
			_mpgPylon set [1, _pylonPriority];
			_mpgPylon set [2, _pylonAttachment];
			_mpgPylon set [3, _pylonTurret];

			_pylonsPriority set [_pylonIndex - 1, _pylonPriority];

			_vehicle removeWeapon getText (configFile >> "CfgMagazines" >> (getPylonMagazines _vehicle select (_pylonIndex - 1)) >> "pylonWeapon");
			[_vehicle, _pylonIndex, _pylonAttachment, !(_display getVariable ["MPG_compatiblePylons", true]), _pylonTurret] call BRM_FMK_MPGarage_fnc_setPylonLoadOut;
		} forEach _vehiclePylons;

		_vehicle setPylonsPriority _pylonsPriority;

		// Reload right tab content
		[_display, _display getVariable ["MPG_rightTab", 0], false] call BRM_FMK_MPGarage_fnc_loadRightContent;
	};
};
