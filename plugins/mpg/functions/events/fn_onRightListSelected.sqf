#include "../../defines.hpp"

params ["_display", "_control", "_index"];

private _tabIndex = _display getVariable ["MPG_rightTab", 0];

private _vehicle = _display getVariable "MPG_vehicle";
private _cfg = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _selectedIndex = lbCurSel _control;

if (_selectedIndex == -1) exitWith {};

switch (_tabIndex) do {
	case 0: { // Animations
		private _animClassName = _control lbData _selectedIndex;

		private _selected = [1, 0] select (_vehicle animationPhase _animClassName > 0);
		_control lbSetPicture [_selectedIndex, CHECKBOX_PICTURES select _selected];

		[_vehicle, nil, [false, _animClassName, _selected]] call BIS_fnc_initVehicle;

		for "_i" from 0 to (lbSize _control - 1) do {
			private _selected = _vehicle animationPhase (_control lbData _i);
			_control lbSetPicture [_i, CHECKBOX_PICTURES select _selected];
		};
	};
	case 1: { // Textures
		[_vehicle, _control lbData _selectedIndex] call BIS_fnc_initVehicle;
	};
	case 2: { // Loadout
		private _forcePylons = !(_display getVariable ["MPG_compatiblePylons", true]);
		private _pylonIndex = _control lbValue _index;
		private _pylonMagazine = _control lbData _index;

		private _vehiclePylons = _vehicle getVariable "MPG_pylons";
		private _vehiclePylon = _vehiclePylons select _pylonIndex;
		_vehiclePylon params ["_pylonIndex", "_pylonPriority", "_pylonAttachment", "_pylonTurret", "_pylonSelectionName", "_mirrorPylonIndex"];
		if (_pylonAttachment != _pylonMagazine) then {
			_pylonAttachment = _pylonMagazine;
			_vehiclePylon set [2/*pylonAttachment*/, _pylonAttachment];

			private _pylonsMirrored = cbChecked (_display displayCtrl IDC_MPG_PYLONCONFIG_MIRROR);
			if (_pylonsMirrored) then {
				{
					_x params ["_pylonIndex", "_pylonPriority", "_pylonAttachment", "_pylonTurret", "_pylonSelectionName", "_mirrorPylonIndex"];

					private _pylonMagazines = ((if (_display getVariable ["MPG_compatiblePylons", true]) then {
						_vehicle getCompatiblePylonMagazines _pylonIndex
					} else {
						"isClass _x && getNumber (_x >> 'scope') == 2 && isText (_x >> 'pylonWeapon')" configClasses (configFile >> "CfgMagazines") apply { configName _x }
					}) apply { [getText (configFile >> "CfgMagazines" >> _x >> "displayName"), _x] });
					_pylonMagazines sort true;
					_pylonMagazines = [["<empty>", ""]] + _pylonMagazines;

					private _pylonMagazine = _pylonMagazines select _index select 1;
					if (_pylonAttachment != _pylonMagazine) then {
						_pylonAttachment = _pylonMagazine;
						_x set [2/*pylonAttachment*/, _pylonAttachment];

						[_vehicle, _pylonIndex, _pylonAttachment, _forcePylons, _pylonTurret] call BRM_FMK_MPGarage_fnc_setPylonLoadOut;
					};
				} forEach (_vehiclePylons select { _x select 5/*_mirrorPylonIndex*/ == _pylonIndex });
			};

			_vehicle removeWeapon getText (configFile >> "CfgMagazines" >> (getPylonMagazines _vehicle select (_pylonIndex - 1)) >> "pylonWeapon");
			[_vehicle, _pylonIndex, _pylonAttachment, _forcePylons, _pylonTurret] call BRM_FMK_MPGarage_fnc_setPylonLoadOut;

			private _pylonsPriority = [];
			{
				_x params ["_pylonIndex", "_pylonPriority", "_pylonMagazineName", "_pylonTurret"];
				_pylonsPriority set [_pylonIndex - 1, _pylonPriority];
			} forEach _vehiclePylons;
			_vehicle setPylonsPriority _pylonsPriority;
		};
	};
};