#include "../defines.hpp"

params ["_display", "_index", ["_autoFocus", true]];

_this = _this select [3, count _this];

_display setVariable ["MPG_rightTab", _index];

private _vehicle = _display getVariable "MPG_vehicle";
private _cfgVehicle = configFile >> "CfgVehicles" >> typeOf _vehicle;

private _ctrlRightSearch = _display displayCtrl IDC_MPG_RIGHTSEARCH;
private _ctrlRightSearchButton = _display displayCtrl IDC_MPG_RIGHTSEARCHBUTTON;
private _ctrlRightSort = _display displayCtrl IDC_MPG_RIGHTSORT;
private _ctrlRightContent = _display displayCtrl IDC_MPG_RIGHTCONTENT;

_ctrlRightContent lbSetCurSel -1;
lbClear _ctrlRightContent;

switch (_index) do {
	case 0: { // Animations
		{
			//private _animations = _display getVariable ["MPG_animations", []];
			private _displayName = getText (_x >> "displayName");
			if (_displayName != "" && [_x, "scope", 2] call BIS_fnc_returnConfigEntry > 1) then {
				private _animClassName = configName _x;

				private _selected = [0, 1] select (_vehicle animationPhase _animClassName > 0);

				private _lbIndex = _ctrlRightContent lbAdd _displayName;
				_ctrlRightContent lbSetData [_lbIndex, _animClassName];
				_ctrlRightContent lbSetPicture [_lbIndex, CHECKBOX_PICTURES select _selected];
			};
		} forEach configProperties [_cfgVehicle >> "AnimationSources", "isClass _x", true];
		lbSort _ctrlRightContent;
	};
	case 1: { // Textures
		private _vehicleTextures = getObjectTextures _vehicle;
		private _current = "";
		{
			private _displayName = getText (_x >> "displayName");
			if (_displayName != "") then {
				private _textures = getArray (_x >> "textures") apply { toLower _x };
				private _selected = for "_i" from 0 to (count _textures min count _vehicleTextures) do {
					private _texture = _textures select _i;
					private _vehicleTexture = _vehicleTextures select _i;
					if (_texture != _vehicleTexture && {_texture find _vehicleTexture < 0}) exitWith { false };

					true
				};

				private _lbIndex = _ctrlRightContent lbAdd _displayName;
				_ctrlRightContent lbSetData [_lbIndex, configName _x];
				if (_selected) then {
					_current = configName _x;
				};
			};
		} forEach configProperties [_cfgVehicle >> "TextureSources", "isClass _x", true];
		lbSort _ctrlRightContent;
		for "_i" from 0 to (lbSize _ctrlRightContent - 1) do {
			if ((_ctrlRightContent lbData _i) == _current) exitWith {
				_ctrlRightContent lbSetCurSel _i;
			};
		};
	};
	case 2: { // Loadout
		params ["_index"];

		private _oldIndex = _display getVariable ["MPG_rightTab_loadoutIndex", -1];
		if (_oldIndex != -1) then {
			private _ctrlPylonBackground = _display displayCtrl (IDC_MPG_LOADOUT_PYLONS_CREATE + _oldIndex * 2);
			_ctrlPylonBackground ctrlSetTextColor [0, 0, 0, 0.8];
		};

		_display setVariable ["MPG_rightTab_loadoutIndex", _index];

		private _ctrlPylonBackground = _display displayCtrl (IDC_MPG_LOADOUT_PYLONS_CREATE + _index * 2);
		_ctrlPylonBackground ctrlSetTextColor [(profilenamespace getvariable ["GUI_BCG_RGB_R", 0.77]), (profilenamespace getvariable ["GUI_BCG_RGB_G", 0.51]), (profilenamespace getvariable ["GUI_BCG_RGB_B", 0.08]), 1];

		// Deselect right tab.
		private _ctrlTabRightBackground = _display displayCtrl IDC_MPG_TABRIGHTBACKGROUND;
		private _position = ctrlPosition _ctrlTabRightBackground;
		for "_i" from 0 to 1 do {
			_position set [_i, -1];
		};
		_ctrlTabRightBackground ctrlSetPosition _position;
		_ctrlTabRightBackground ctrlCommit 0;

		// Hide right tabs, search, and search button.
		{
			(_display displayCtrl _x) ctrlShow false;
		} forEach [IDC_MPG_RIGHTTABSBACKGROUND, IDC_MPG_RIGHTTABS, IDC_MPG_RIGHTSEARCH, IDC_MPG_RIGHTSEARCHBUTTON];

		// Show pylon config.
		{
			(_display displayCtrl _x) ctrlShow true;
		} forEach [IDC_MPG_PYLONCONFIG_BACKGROUND, IDC_MPG_PYLONCONFIG];

		private _vehiclePylon = _vehicle getVariable "MPG_pylons" select _index;
		_vehiclePylon params ["_pylonIndex", "_pylonPriority", "_pylonAttachment", "_pylonTurret", "_pylonSelectionName", "_mirrorPylonIndex"];

		// Fill pylon owner combo box.
		private _crewOrder = ["driver", "commander", "gunner", "turret", "cargo"];
		private _fullCrew = (fullCrew [_vehicle, "", true]) select {
			_x params ["_unit", "_role", "_cargoIndex", "_turretPath", "_personTurret"];
			_role != "cargo" && !_personTurret
		} apply {
			_x params ["_unit", "_role", "_cargoIndex", "_turretPath", "_personTurret"];
			[_crewOrder find toLower _role, toUpper (_role select [0, 1]) + toLower (_role select [1, count _role - 1]), _turretPath, _personTurret]
		};
		_fullCrew sort true;

		private _ctrlPylonConfigOwner = _display displayCtrl IDC_MPG_PYLONCONFIG_OWNER;
		lbClear _ctrlPylonConfigOwner;
		private _turretPaths = [];
		private _cfgVehiclePylons = _cfgVehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons";
		private _turretOwner = -1;
		{
			_x params ["_roleIndex", "_role", "_turretPath", "_personTurret"];

			private _lbIndex = _ctrlPylonConfigOwner lbAdd _role;
			_ctrlPylonConfigOwner lbSetValue [_lbIndex, _index];
			_turretPaths pushBack _turretPath;
			if (_turretPath isEqualTo _pylonTurret) then {
				_turretOwner = _lbIndex;
			};
		} forEach _fullCrew;
		_ctrlPylonConfigOwner setVariable ["turretPaths", _turretPaths];
		_ctrlPylonConfigOwner lbSetCurSel _turretOwner;

		// Fill pylon priority edit box.
		private _ctrlPylonConfigOwner = _display displayCtrl IDC_MPG_PYLONCONFIG_PRIORITY;
		_ctrlPylonConfigOwner ctrlSetText str _pylonPriority;

		// Fill right content list box.
		_ctrlRightContent lbAdd "<empty>";
		_ctrlRightContent lbSetData [0, ""];
		_ctrlRightContent lbSetValue [0, _index];

		private _pylonMagazines = getPylonMagazines _vehicle;
		if (_index < count _pylonMagazines) then {
			private _loadedMagazine = _pylonMagazines select _index;
			private _pylonMagazines = [];
			if (_display getVariable ["MPG_compatiblePylons", true]) then {
				_pylonMagazines = _vehicle getCompatiblePylonMagazines _pylonIndex;
			} else {
				_pylonMagazines = "isClass _x && getNumber (_x >> 'scope') == 2 && isText (_x >> 'pylonWeapon')" configClasses (configFile >> "CfgMagazines") apply { configName _x };
			};
			{
				private _cfgPylonMagazine = configFile >> "CfgMagazines" >> _x;
				private _lbIndex = _ctrlRightContent lbAdd getText (_cfgPylonMagazine >> "displayName");
				_ctrlRightContent lbSetTooltip [_lbIndex, getText (_cfgPylonMagazine >> "descriptionShort")];
				_ctrlRightContent lbSetData [_lbIndex, _x];
				_ctrlRightContent lbSetValue [_lbIndex, _index];
			} forEach _pylonMagazines;

			lbSort _ctrlRightContent;

			if (_loadedMagazine != "") then {
				for "_i" from 0 to (lbSize _ctrlRightContent - 1) do {
					if (_ctrlRightContent lbData _i == _loadedMagazine) exitWith {
						_ctrlRightContent lbSetCurSel _i;
					};
				};
			} else {
				_ctrlRightContent lbSetCurSel 0;
			};
		} else {
			_ctrlRightContent lbSetCurSel 0;
		};
	};
};

if (_autoFocus) then {
	ctrlSetFocus _ctrlRightContent;
};
