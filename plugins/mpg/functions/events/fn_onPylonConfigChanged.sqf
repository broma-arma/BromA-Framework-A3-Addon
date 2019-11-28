#include "../../defines.hpp"

params ["_event"];

_this = _this select [1, count _this];

switch (_event) do {
	case "OwnerChanged": {
		params ["_display", "_control", "_index"];

		private _vehicle = _display getVariable ["MPG_vehicle", objNull];
		private _vehiclePylons = _vehicle getVariable ["MPG_pylons", []];
		private _vehiclePylon = _vehiclePylons select (_control lbValue _index);

		private _ctrlPylonConfigOwner = _display displayCtrl IDC_MPG_PYLONCONFIG_OWNER;
		_vehiclePylon set [3/*pylonTurret*/, (_ctrlPylonConfigOwner getVariable "turretPaths") select lbCurSel _ctrlPylonConfigOwner];

		private _ctrlRightContent = _display displayCtrl IDC_MPG_RIGHTCONTENT;
		private _rightContentSel = lbCurSel _ctrlRightContent;
		if (_rightContentSel != -1) then {
			[_display, _ctrlRightContent, lbCurSel _ctrlRightContent] call BRM_FMK_MPGarage_fnc_onRightListSelected;
		};
	};
	case "MirrorChanged": {
		params ["_display", "_control", "_pylonsMirrored"];
		_pylonsMirrored = _pylonsMirrored > 0;

		private _vehicle = _display getVariable ["MPG_vehicle", objNull];
		private _vehiclePylons = _vehicle getVariable ["MPG_pylons", []];

		private _selectedPylon = _vehicle getVariable "MPG_pylons" select (_display getVariable "MPG_rightTab_loadoutIndex");
		private _selectedPylonIndex = _selectedPylon select 0/*pylonIndex*/;

		{
			_x params ["_pylonIndex", "_priority", "_attachment", "_turret", "_selectionPos", "_mirrorPylonIndex"];

			if (_mirrorPylonIndex > 0) then {
				if (_pylonsMirrored && _selectedPylonIndex == _pylonIndex) then {
					// Change selected pylon to non-mirrored pylon.
					private _index = -1;
					{ if (_x select 0/*pylonIndex*/ == _mirrorPylonIndex) exitWith { _index = _forEachIndex; }; } forEach _vehiclePylons;
					if (_index != -1) then {
						[_display, 2, true, _index] call BRM_FMK_MPGarage_fnc_loadRightContent;
					};
				};
				private _ctrlPylon = _display displayCtrl (IDC_MPG_LOADOUT_PYLONS_CREATE + _forEachIndex * 2 + 1);
				_ctrlPylon ctrlEnable !_pylonsMirrored;
			};
		} forEach _vehiclePylons;

		if (_pylonsMirrored) then {
			{
				_x params ["_pylonIndex", "_pylonPriority", "_pylonAttachment", "_pylonTurret", "_pylonSelectionName", "_mirrorPylonIndex"];
				private _pylonMagazine = _pylonAttachment;

				{
					_x params ["_pylonIndex", "_pylonPriority", "_pylonAttachment", "_pylonTurret", "_pylonSelectionName", "_mirrorPylonIndex"];
					if (_pylonAttachment != _pylonMagazine) then {
						_pylonAttachment = _pylonMagazine;
						_x set [2/*pylonAttachment*/, _pylonAttachment];

						[_vehicle, _pylonIndex, _pylonAttachment, !(_display getVariable ["MPG_compatiblePylons", true]), _pylonTurret] call BRM_FMK_MPGarage_fnc_setPylonLoadOut;
					};
				} forEach (_vehiclePylons select { _x select 5/*_mirrorPylonIndex*/ == _pylonIndex });
			} forEach _vehiclePylons;
		};
	};
	case "PriorityChanged": {
		params ["_display", "_control", "_key", "_shift", "_ctrl", "_alt"];

		private _vehicle = _display getVariable ["MPG_vehicle", objNull];
		private _vehiclePylons = _vehicle getVariable ["MPG_pylons", []];

		private _selectedPylon = _vehicle getVariable "MPG_pylons" select (_display getVariable "MPG_rightTab_loadoutIndex");

		private _priority = round parseNumber ctrlText _control;
		if (_priority < 0) then { _priority = 0; };
		_control ctrlSetText str _priority;
		_selectedPylon set [1/*priority*/, _priority];
	};
};
