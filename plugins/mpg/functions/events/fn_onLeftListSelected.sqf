#include "../../defines.hpp"

params ["_display", "_control", "_index"];

private _vehicle = _display getVariable "MPG_vehicle";

private _cfgVehicles = _display getVariable "MPG_vehicles" select (_display getVariable "MPG_leftTab");
private _selectedVehicle = configName (_cfgVehicles select ((_control lbValue lbCurSel _control) % count _cfgVehicles) select 0);

if (typeOf _vehicle == _selectedVehicle) exitWith {};

private _camera = _display getVariable "MPG_camera";
private _cameraData = _display getVariable "MPG_cameraData";

if (!isNil "_vehicle" && {!isNull _vehicle}) then {
	{
		ctrlDelete (_display displayCtrl (IDC_MPG_LOADOUT_PYLONS_CREATE + _forEachIndex * 2)); // ctrlPylonBackground
		ctrlDelete (_display displayCtrl (IDC_MPG_LOADOUT_PYLONS_CREATE + _forEachIndex * 2 + 1)); // ctrlPylon
	} forEach (_vehicle getVariable ["MPG_pylons", []]);

	_vehicle enableSimulation false;
	_vehicle allowDamage false;
	deleteVehicle _vehicle;
};

_display getVariable "MPG_config" params ["_position", "_direction"/*, "_allowExternal", "_vehicleFilter", "_spawnHandler", "_allowIncompatiblePylons"*/];

_vehicle = _selectedVehicle createVehicleLocal _position;
_vehicle enableSimulation false;
_vehicle allowDamage false;
_vehicle setPos _position;
_vehicle setDir _direction;
_vehicle spawn { sleep 0.001; _this enableSimulation true; };

_camera camSetTarget _vehicle;

_display setVariable ["MPG_vehicle", _vehicle];

boundingBoxReal _vehicle params ["_bb1", "_bb2"];
private _bbDiag = _bb1 vectorDistance _bb2;
_cameraData set [2, _bbDiag * 1.5]; // distance
_cameraData set [3, [_bbDiag * 0.25, _bbDiag * 2]]; // minDistance, maxDistance

["UpdateCamera"] call BRM_FMK_MPGarage_fnc_onGarageEvent;

// Reset pylon mirror to false.
_display displayCtrl IDC_MPG_PYLONCONFIG_MIRROR cbSetChecked false;

private _vehiclePylons = [_vehicle] call BRM_FMK_MPGarage_fnc_getPylons;
_vehicle setVariable ["MPG_pylons", _vehiclePylons];

// Create GUI controls for vehicle pylons.
{
	_x params ["_pylonIndex", "_priority", "_attachment", "_turret", "_selectionPos", "_mirrorPylonIndex"];

	private _ctrlPylonBackground = _display ctrlCreate ["ctrlStaticPictureKeepAspect", IDC_MPG_LOADOUT_PYLONS_CREATE + _forEachIndex * 2];
	private _ctrlPylon = _display ctrlCreate ["ctrlMPGPylonButton", IDC_MPG_LOADOUT_PYLONS_CREATE + _forEachIndex * 2 + 1];

	_ctrlPylon ctrlAddEventHandler ["ButtonClick", {
		params ["_control"];

		private _pylonIndex = (ctrlIDC _control - IDC_MPG_LOADOUT_PYLONS_CREATE - 1) / 2;
		[ctrlParent _control, 2, true, _pylonIndex] call BRM_FMK_MPGarage_fnc_loadRightContent;
	}];

	_ctrlPylonBackground ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
	_ctrlPylonBackground ctrlSetTextColor [0, 0, 0, 0.8];

	_ctrlPylon ctrlSetText "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoMisc_ca.paa";

	private _cfgPylon = (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Components" >> "TransportPylonsComponent" >> "Pylons") select (_pylonIndex - 1);
	_ctrlPylon ctrlSetTooltip configName _cfgPylon;

	private _ctrlPos = [-1, -1, SIZE_EX * GUI_PIXEL_GRID_W, SIZE_EX * GUI_PIXEL_GRID_H];
	{
		_x ctrlSetPosition _ctrlPos;
		_x ctrlCommit 0;
	} forEach [_ctrlPylonBackground, _ctrlPylon];
} forEach _vehiclePylons;

private _ctrlRightTab = _display displayCtrl (IDCS_RIGHT select (_display getVariable ["MPG_rightTab", 0]));
[_display, _ctrlRightTab, false] call BRM_FMK_MPGarage_fnc_onRightTabSelect;

ctrlSetFocus _control;
