#include "../../defines.hpp"

TRACE_1("fn_listPlayers: %1", _this);

disableSerialization;

params ["_ctrlPlayersList"];

private _selection = lbSelection _ctrlPlayersList apply { _ctrlPlayersList lbText _x };
lbClear _ctrlPlayersList;

private _colors = [
	[profilenamespace getvariable ['Map_BLUFOR_R',      0], profilenamespace getvariable ['Map_BLUFOR_G',      1], profilenamespace getvariable ['Map_BLUFOR_B',      1], profilenamespace getvariable ['Map_BLUFOR_A',      0.8]],
	[profilenamespace getvariable ['Map_OPFOR_R',       0], profilenamespace getvariable ['Map_OPFOR_G',       1], profilenamespace getvariable ['Map_OPFOR_B',       1], profilenamespace getvariable ['Map_OPFOR_A',       0.8]],
	[profilenamespace getvariable ['Map_Independent_R', 0], profilenamespace getvariable ['Map_Independent_G', 1], profilenamespace getvariable ['Map_Independent_B', 1], profilenamespace getvariable ['Map_Independent_A', 0.8]],
	[profilenamespace getvariable ['Map_Civilian_R',    0], profilenamespace getvariable ['Map_Civilian_G',    1], profilenamespace getvariable ['Map_Civilian_B',    1], profilenamespace getvariable ['Map_Civilian_A',    0.8]],
	[profilenamespace getvariable ['Map_Unknown_R',     0], profilenamespace getvariable ['Map_Unknown_G',     1], profilenamespace getvariable ['Map_Unknown_B',     1], profilenamespace getvariable ['Map_Unknown_A',     0.8]]
];

private _showDead = profileNamespace getVariable ["RHEA_cfg_showdead", false];
private _showAI = profileNamespace getVariable ["RHEA_cfg_showai", true];

private _allUnits = allUnits;
{ // Workaround allUnits failing to have all players
	if !(_x isKindOf "HeadlessClient_F") then {
		_allUnits pushBackUnique _x;
	};
} forEach allPlayers;

{
	if !(isNil "_x" || {isNull _x}) then {
		private _unit = _x;
		private _isPlayer = isPlayer _unit;
		private _alive = !(_unit getVariable ["isDead", false]);
		if (alive _unit && (_showDead || _alive) && (_showAI || _isPlayer)) then {
			private _sideIndex = [west, east, independent, civilian] find side _unit;
			if (_sideIndex == -1) then { _sideIndex = 4; };
			private _i = _ctrlPlayersList lbAdd format ["%1%2%3", _sideIndex, if (_isPlayer) then {"0"} else {"1[AI] "}, name _unit]; // Note: name doesn't work with !alive units.
			_ctrlPlayersList lbSetColor [_i, _colors select _sideIndex];
			_ctrlPlayersList lbSetData [_i, _unit call BIS_fnc_objectVar];
			private _vehicle = objectParent _unit;
			private _picture = switch (true) do {
				case (!_alive): { "\A3\Ui_f\data\IGUI\Cfg\Revive\overlayIcons\d100_ca.paa" };
				case (!simulationEnabled _unit): { "\A3\Ui_f\data\GUI\Rsc\RscDisplaySingleMission\locked_ca.paa" };
				case (_unit getVariable ["ACE_isUnconscious", false]): { "\A3\Ui_f\data\IGUI\Cfg\Revive\overlayIcons\r100_ca.paa" };
				case (!isNull _vehicle): {
					private _crew = fullCrew _vehicle;
					private _i = _crew findIf { _x select 0 == _unit };
					if (_i != -1) then {
						_crew select _i params ["", "_role", "", "", "_personTurret", "", ""];
						if (_role == "turret" && _personTurret) then {
							_role == "turretFFV";
						};
						switch (_role) do {
							case "driver": { "\A3\ui_f\data\igui\rscingameui\rscunitinfo\role_driver_ca.paa" };
							case "commander": { "\A3\ui_f\data\igui\rscingameui\rscunitinfo\role_commander_ca.paa" };
							case "turret";
							case "gunner": { "\A3\ui_f\data\igui\rscingameui\rscunitinfo\role_gunner_ca.paa" };
							case "turretFFV";
							case "cargo": { "\A3\ui_f\data\igui\rscingameui\rscunitinfo\role_cargo_ca.paa" };
							default { "" };
						}
					} else {
						""
					};
				};
				default { "" };
			};
			_ctrlPlayersList lbSetPicture [_i, _picture];
		};
	} else {
		WARNING("Entry in allUnits is nil/null");
	};
} forEach _allUnits;

lbSort _ctrlPlayersList;
for "_i" from 0 to lbSize _ctrlPlayersList - 1 do {
	private _text = _ctrlPlayersList lbText _i select [2];
	_ctrlPlayersList lbSetText [_i, _text];
	if (_text in _selection) then {
		_ctrlPlayersList lbSetSelected [_i, true];
	};
};
