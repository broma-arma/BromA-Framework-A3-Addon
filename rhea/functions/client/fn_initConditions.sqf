#include "../../defines.hpp"

TRACE_1("fn_initConditions: %1", _this);

disableSerialization;

params ["_dialog"];

private _ctrlBtnClose = _dialog displayCtrl 9636;
private _ctrlBtnOk = _dialog displayCtrl 1600;
private _ctrlBtnCancel = _dialog displayCtrl 1601;

private _ctrlTxtHour = _dialog displayCtrl 9037;
private _ctrlTxtRain = _dialog displayCtrl 9038;
private _ctrlTxtFog = _dialog displayCtrl 9039;

private _ctrlSdrHour = _dialog displayCtrl 9936;
private _ctrlSdrRain = _dialog displayCtrl 9937;
private _ctrlSdrFog = _dialog displayCtrl 9938;

_ctrlSdrHour sliderSetRange [0, 23];
_ctrlSdrHour sliderSetSpeed [1, 6];
_ctrlSdrHour sliderSetPosition (date select 3);

_ctrlSdrRain sliderSetRange [0, 1];
_ctrlSdrRain sliderSetSpeed [0.1, 0.25];
_ctrlSdrRain sliderSetPosition overcast;

_ctrlSdrFog sliderSetRange [0, 1];
_ctrlSdrFog sliderSetSpeed [0.1, 0.25];
_ctrlSdrFog sliderSetPosition fog;

_ctrlTxtHour ctrlSetText format ["Hour: %1", date select 3];
_ctrlTxtRain ctrlSetText format ["Rain & Overcast: %1%2", floor (overcast * 100), "%"];
_ctrlTxtFog ctrlSetText format ["Fog: %1%2", floor (fog * 100), "%"];

_ctrlBtnOk ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];

	private _dialog = ctrlParent _control;
	private _settings = [
		floor sliderPosition (_dialog displayCtrl 9936),
		sliderPosition (_dialog displayCtrl 9937),
		sliderPosition (_dialog displayCtrl 9938)
	];

	DEBUG_1("Conditions: %1", _settings);

	[_settings, {
		params ["_hour", "_rain", "_fog"];

		private _date = date;
		_date set [3, _hour];
		setDate _date;
		0 setRain _rain;
		0 setOvercast _rain;
		0 setFog _fog;
		forceWeatherChange;
	}] remoteExec ["call", 2];

	closeDialog 1;
}];
_ctrlBtnClose ctrlAddEventHandler ["ButtonClick", { closeDialog 2; }];
_ctrlBtnCancel ctrlAddEventHandler ["ButtonClick", { closeDialog 2; }];
_ctrlSdrHour ctrlAddEventHandler ["SliderPosChanged", {
	params ["_control", "_change"];
	((ctrlParent _control) displayCtrl 9037) ctrlSetText format ["Hour: %1", floor _change];
}];
_ctrlSdrRain ctrlAddEventHandler ["SliderPosChanged", {
	params ["_control", "_change"];
	((ctrlParent _control) displayCtrl 9038) ctrlSetText format ["Rain & Overcast: %1%2", floor (_change * 100), "%"];
}];
_ctrlSdrFog ctrlAddEventHandler ["SliderPosChanged", {
	params ["_control", "_change"];
	((ctrlParent _control) displayCtrl 9039) ctrlSetText format ["Fog: %1%2", floor (_change * 100), "%"];
}];
