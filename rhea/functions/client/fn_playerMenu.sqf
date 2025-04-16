#include "../../defines.hpp"

TRACE_1("fn_playerMenu: %1", _this);

disableSerialization;

params ["_control", "_action"];

private _display = ctrlParent _control;
private _ctrlPlayersList = _display displayCtrl 2100;
private _selectedPlayers = lbSelection _ctrlPlayersList apply { missionNamespace getVariable (_ctrlPlayersList lbData _x) } select { !(isNil "_x" || {isNull _x}) };
_selectedPlayers = _selectedPlayers arrayIntersect _selectedPlayers;

if (count _selectedPlayers == 0) exitWith {};

private _refreshPlayerList = false;

switch (_action) do {
	case "GoTo";
	case "Bring";
	case "SendTo": {
		[_action, _selectedPlayers] spawn {
			params ["_action", "_selectedPlayers"];

			private _other = objNull;
			if (_action == "SendTo") then {
				private _showDead = profileNamespace getVariable ["RHEA_cfg_showdead", false];
				private _showAI = profileNamespace getVariable ["RHEA_cfg_showai", true];

				private _options = [];
				{
					if !(isNil "_x" || {isNull _x}) then {
						private _isPlayer = isPlayer _x;
						private _alive = !(_x getVariable ["isDead", false]);
						if (alive _x && (_showDead || _alive) && (_showAI || _isPlayer)) then {
							// Note: name doesn't work with !alive units.
							_options pushBack [(if (_isPlayer) then {"0"} else {"1[AI] "}) + (name _x), [_x] call BIS_fnc_objectVar];
						};
					};
				} forEach allUnits;
				_options sort true;
				{ _x set [0, _x select 0 select [1]]; } forEach _options;

				(["Send To", "Send to who?", 0, _options] call BRM_FMK_RHEA_fnc_inputDialog) params ["_status", "", "_data"];
				if (_status) then {
					_other = missionNamespace getVariable _data;
				};
			} else {
				_other = player;
			};

			if (isNull _other) exitWith {};

			if (!alive _other || { _other getVariable ["isDead", false] }) then {
				_other = objNull;
			};

			if (_action == "GoTo") then {
				if !(isNull _other) then {
					private _to = _selectedPlayers select 0;
					if !(isNull _to || { !alive _to } || { _to getVariable ["isDead", false] }) then {
						[_other, _to] remoteExecCall ["BRM_FMK_RHEA_REMOTE_fnc_teleport", _other];
					} else {
						"Cannot teleport to the dead" call BRM_FMK_RHEA_fnc_message;
					};
				} else {
					"Cannot teleport the dead" call BRM_FMK_RHEA_fnc_message;
				};
			} else {
				if !(isNull _other) then {
					private _fails = [];
					{
						if !(isNull _x || { !alive _x } || { _x getVariable ["isDead", false] }) then {
							[_x, _other] remoteExecCall ["BRM_FMK_RHEA_REMOTE_fnc_teleport", _x];
						} else {
							_fails pushBack _x;
						};

						sleep 0.01;
					} forEach _selectedPlayers;

					if (count _fails > 0) then {
						(format ["Cannot teleport the dead: %1", _fails apply { name _x } joinString ", "]) call BRM_FMK_RHEA_fnc_message;
					};
				} else {
					"Cannot teleport to the dead" call BRM_FMK_RHEA_fnc_message;
				};
			};
		};
	};

	case "Heal": {
		if (HAS_ADDON("ace_medical")) then {
			private _fnc_fullHeal = if (HAS_ADDON("ace_medical_treatment")) then { ace_medical_treatment_fnc_fullHeal } else { ace_medical_fnc_treatmentAdvanced_fullHeal };
			{
				[player, _x] call _fnc_fullHeal;
			} forEach _selectedPlayers;
		} else {
			{
				_x setDamage 0;
			} forEach _selectedPlayers;
		};
	};

	case "Kill": {
		{
			_x setDamage 1;
		} forEach _selectedPlayers;
		_refreshPlayerList = true;
	};

	case "Freeze": {
		[_selectedPlayers, {
			{
				_x enableSimulationGlobal !(simulationEnabled _x);
			} forEach _this;
		}] remoteExec ["call", 2];
	};

	case "RepairArmFuel": {
		private _vehicles = (_selectedPlayers apply { objectParent _x } select { !isNull _x });
		{
			private _vehicle = _x;

			// Repair
			_vehicle setDamage 0;

			// Refuel
			if (local _vehicle) then {
				_vehicle setFuel 1;
			} else {
				[_vehicle, 1] remoteExec ["setFuel", _vehicle];
			};
		} forEach _vehicles;

		// Rearm
		_vehicles remoteExec ["BRM_FMK_RHEA_SERVER_fnc_rearmVehicle", 2];
	};

	case "Repair": {
		{
			_x setDamage 0;
		} forEach (_selectedPlayers apply { objectParent _x } select { !isNull _x });
	};

	case "Rearm": {
		(_selectedPlayers apply { objectParent _x } select { !isNull _x }) remoteExec ["BRM_FMK_RHEA_SERVER_fnc_rearmVehicle", 2];
	};

	case "Refuel": {
		{
			private _vehicle = _x;
			if (local _vehicle) then {
				_vehicle setFuel 1;
			} else {
				[_vehicle, 1] remoteExec ["setFuel", _vehicle];
			};
		} forEach (_selectedPlayers apply { objectParent _x } select { !isNull _x });
	};

	case "AssignLoadout": {
		if !(isNil "BRM_fnc_assignLoadout") then {
			[{
				[player, toLower str (player getVariable ["unit_side", side player])] call BRM_fnc_assignLoadout;
			}] remoteExec ["call", _selectedPlayers];
		} else {
			"Broma mission framework not loaded" call BRM_FMK_RHEA_fnc_message;
		};
	};

	case "Notify": {
		_selectedPlayers spawn {
			(["Notification message", "Enter the notification message:", ""] call BRM_FMK_RHEA_fnc_inputDialog) params ["_status", "_text"];
			if (_status) then {
				if (isNil "BRM_fnc_initPlayer") then {
					["TaskDescriptionUpdatedIcon", ["\A3\ui_f\data\map\markers\military\warning_ca.paa", _text]] remoteExec ["BIS_fnc_showNotification", _this];
				} else {
					["Alert", [_text]] remoteExec ["BIS_fnc_showNotification", _this];
				};
			};
		};
	};

	case "Respawn": {
		if (USES_BRMFMK_PLUGIN("respawn_system")) then {
			private _deadPlayers = _selectedPlayers select { _x getVariable ["isDead", false] } apply { name _x };
			if (count _deadPlayers > 0) then {
				{
					[name _x] remoteExecCall ["BRM_FMK_RespawnSystem_fnc_callRespawn", 2];
				} forEach _selectedPlayers;
				_refreshPlayerList = true;
			};
		} else {
			"respawn_system plugin not loaded" call BRM_FMK_RHEA_fnc_message;
		};
	};
};

if (_refreshPlayerList) then {
	[{
		disableSerialization;
		params ["_listPlayers"];

		_listPlayers lbSetCurSel -1;
		_listPlayers call BRM_FMK_RHEA_fnc_listPlayers;
	}, [_listPlayers]] call CBA_fnc_execNextFrame;
};
