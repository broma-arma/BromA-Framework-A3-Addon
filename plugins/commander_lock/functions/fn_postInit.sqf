private _units = [blu_0_0_1, blu_1_0_1, op_0_0_1, op_1_0_1, ind_0_0_1, ind_1_0_1];
private _tvtMode = false;
private _showTimer = true;
private _allowExplosives = false;
if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "co_lock_units") then { _units = call compile co_lock_units; };
	if (!isNil "co_lock_tvt_mode") then { _tvtMode = co_lock_tvt_mode; };
} else {
	if (fileExists "mission\settings\plugins\commander_lock.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\commander_lock.sqf";
	};
};

BRM_FMK_Plugin_CommanderLock_units = _units;
BRM_FMK_Plugin_CommanderLock_tvtMode = _tvtMode;
BRM_FMK_Plugin_CommanderLock_showTimer = _showTimer;
BRM_FMK_Plugin_CommanderLock_allowExplosives = _allowExplosives;

if (isNil "co_lock_allSidesReady") then { co_lock_allSidesReady = false; }; // Used in missions.

if (isServer) then {
	BRM_FMK_Plugin_CommanderLock_lockedSides = createHashMap;

	{
		if (!isNull _x) then {
			BRM_FMK_Plugin_CommanderLock_lockedSides set [side _x, true];
		};
	} forEach BRM_FMK_Plugin_CommanderLock_units;
	publicVariable "BRM_FMK_Plugin_CommanderLock_lockedSides";

	["BRM_FMK_Plugin_CommanderLock_unlockSide", {
		params ["_side"];

		BRM_FMK_Plugin_CommanderLock_lockedSides deleteAt _side;
		publicVariable "BRM_FMK_Plugin_CommanderLock_lockedSides";

		if (count BRM_FMK_Plugin_CommanderLock_lockedSides <= 0) then {
			co_lock_allSidesReady = true;
			publicVariable "co_lock_allSidesReady";
		};

		private _type = (switch (_side) do {
			case BLUFOR: { "AlertBLU" };
			case OPFOR: { "AlertOP" };
			case INDEPENDENT: { "AlertIND" };
			default { "AlertBLU" };
		});

		if (BRM_FMK_Plugin_CommanderLock_tvtMode) then {
			[_type, [format ["<t color='ffffff'>%1 Ready</t>", [_side, "name"] call BRM_FMK_fnc_getSideInfo]]] remoteExec ["BIS_fnc_showNotification", 0];
			if (co_lock_allSidesReady) then {
				0 spawn {
					sleep 5;
					["BRM_FMK_Plugin_CommanderLock_sideUnlocked", [nil]] call CBA_fnc_globalEvent;
					["Alert", ["<t color='ffffff'>Mission Go!</t>"]] remoteExec ["BIS_fnc_showNotification", 0];
				};
			};
		} else {
			[_type, ["<t color='ffffff'>Mission Go!</t>"]] remoteExec ["BIS_fnc_showNotification", _side];
			["BRM_FMK_Plugin_CommanderLock_sideUnlocked", [_side]] call CBA_fnc_globalEvent;
		};
	}] call CBA_fnc_addEventHandler;
};

if (!hasInterface || { BRM_FMK_Plugin_CommanderLock_tvtMode && co_lock_allSidesReady || { !(side player in BRM_FMK_Plugin_CommanderLock_lockedSides) } }) exitWith {};

[{ !isNil "BRM_FMK_Plugin_CommanderLock_units" }, {
	if (player in BRM_FMK_Plugin_CommanderLock_units) then {
		private _color = [["red", "green", "blue"] select ([OPFOR, INDEPENDENT, BLUFOR] find side player)] call BRM_FMK_fnc_colorToHex;
		[player, 1, ["ACE_SelfActions"], ["BRM_FMK_Plugin_CommanderLock_unlockAction",
			format ["<t color='%1' shadow='0'>%2</t>", _color, ["Start Mission", "Ready Side"] select BRM_FMK_Plugin_CommanderLock_tvtMode], "",
			/* TODO > ACE 3.18.1
			{ ["BRM_FMK_Plugin_CommanderLock_unlockSide", [_actionParams]] call CBA_fnc_serverEvent; },
			{ _actionParams in BRM_FMK_Plugin_CommanderLock_lockedSides }, nil, side player
			*/
			{ ["BRM_FMK_Plugin_CommanderLock_unlockSide", [_this select 2]] call CBA_fnc_serverEvent; },
			{ _this select 2 in BRM_FMK_Plugin_CommanderLock_lockedSides }, nil, side player
		] call ace_interact_menu_fnc_createAction] call ace_interact_menu_fnc_addActionToObject;
	};

	private _firedManEH = player addEventHandler ["FiredMan", {
		params ["_unit", "_weapon", "", "", "", "_magazine", "_projectile"];
		if (!BRM_FMK_Plugin_CommanderLock_allowExplosives || { _weapon != "Put" }) then {
			deleteVehicle _projectile;
			if (_weapon == "Throw" || _weapon == "Put") then {
				_unit addMagazine _magazine;
			};
		};
	}];

	BRM_FMK_Plugin_CommanderLock_engineBlocked = [];
	private _getInManEH = player addEventHandler ["GetInMan", {
		params ["", "", "_vehicle"];

		[_vehicle, "blockEngine", "BRM_FMK_Plugin_CommanderLock", true] call ace_common_fnc_statusEffect_set;
		BRM_FMK_Plugin_CommanderLock_engineBlocked pushBackUnique _vehicle;
	}];

	[player, "blockThrow", "BRM_FMK_Plugin_CommanderLock", true] call ace_common_fnc_statusEffect_set;

	private _aceExplosivesSetupEH = if (!BRM_FMK_Plugin_CommanderLock_allowExplosives) then {
		["ace_explosives_setup", {
			params ["_expSetupVehicle", "_magClassname", "_unit"];

			if (_unit == player) then { // Event is global
				deleteVehicle _expSetupVehicle;
				_unit addMagazine _magClassname;
			};
		}] call CBA_fnc_addEventHandler;
	} else { nil };

	0 spawn {
		sleep 0.01; // Post briefing

		call { // Show reminder over weapon info UI.
			disableSerialization;

			"BRM_FMK_Plugin_CommanderLock" cutRsc ["RscDynamicText", "PLAIN", -1, false];

			private _ctrl = uiNamespace getVariable "BIS_dynamicText" displayCtrl 9999;
			uiNamespace setVariable ["BRM_FMK_Plugin_CommanderLock_ctrlStatusText", _ctrl];
			private _cfgGroup = configFile >> "RscInGameUI" >> "RscUnitInfoSoldier" >> "WeaponInfoControlsGroupLeft";
			_ctrl ctrlSetPosition [getNumber (_cfgGroup >> "x"), getNumber (_cfgGroup >> "y"), getNumber (_cfgGroup >> "w"), getNumber (_cfgGroup >> "h")];
			_ctrl ctrlCommit 0;

			_ctrl ctrlSetStructuredText parseText (if (BRM_FMK_Plugin_CommanderLock_showTimer) then {
				format ["<t align='left' size='0.6'><t font='RobotoCondensedBold' color='#ffff00'>WEAPONS COLD</t><br />%1</t>", [time, "M:SS"] call BRM_FMK_fnc_formatElapsedTime]
			} else {
				"<t align='left' size='0.6' font='RobotoCondensedBold' color='#ffff00'>WEAPONS COLD</t>"
			});

			if (BRM_FMK_Plugin_CommanderLock_showTimer) then {
				_ctrl setVariable ["BRM_FMK_Plugin_CommanderLock_timerPFH", [{
					disableSerialization;
					params ["_args", "_handle"];
					_args params ["_ctrl"];
					if (!isNull _ctrl) then {
						_ctrl ctrlSetStructuredText parseText format ["<t align='left' size='0.6'><t font='RobotoCondensedBold' color='#ffff00'>WEAPONS COLD</t><br />%1</t>", [time, "M:SS"] call BRM_FMK_fnc_formatElapsedTime];
					} else {
						[_handle] call CBA_fnc_removePerFrameHandler;
					};
				}, 0.5, [_ctrl]] call CBA_fnc_addPerFrameHandler];
			};
		};

		// Enable text channels, until commander starts mission
		BRM_FMK_Plugin_CommanderLock_channelSettings = [];
		for "_i" from 0 to 5 do {
			private _channelEnabled = channelEnabled _i select [0, 2];
			BRM_FMK_Plugin_CommanderLock_channelSettings pushBack +_channelEnabled;
			_channelEnabled set [0, true];
			_i enableChannel _channelEnabled;
		};
	};

	["BRM_FMK_Plugin_CommanderLock_sideUnlocked", {
		params ["_side"];
		_thisArgs params ["_playerSide", "_firedManEH", "_getInManEH", "_aceExplosivesSetupEH"];

		if (isNil "_side" || { _playerSide == _side }) then {
			[_thisType, _thisId] call CBA_fnc_removeEventHandler;

			if (player in BRM_FMK_Plugin_CommanderLock_units) then {
				[player, 1, ["ACE_SelfActions", "BRM_FMK_Plugin_CommanderLock_unlockAction"]] call ace_interact_menu_fnc_removeActionFromObject;
			};

			player removeEventHandler ["FiredMan", _firedManEH];
			player removeEventHandler ["GetInMan", _getInManEH];
			[player, "blockThrow", "BRM_FMK_Plugin_CommanderLock", false] call ace_common_fnc_statusEffect_set;
			if (!isNil "_aceExplosivesSetupEH") then {
				["ace_explosives_setup", _aceExplosivesSetupEH] call CBA_fnc_removeEventHandler;
			};

			{
				[_x, "blockEngine", "BRM_FMK_Plugin_CommanderLock", false] call ace_common_fnc_statusEffect_set;
			} forEach BRM_FMK_Plugin_CommanderLock_engineBlocked;

			// Restore channel settings
			{ _forEachIndex enableChannel _x; } forEach BRM_FMK_Plugin_CommanderLock_channelSettings;

			// Group > Vehicle > Direct > Side > Global > Command > Group (All disabled)
			setCurrentChannel ([3, 4, 5, 1, 0, 2, 3] select ([3, 4, 5, 1, 0, 2] findIf { channelEnabled _x select 0 }));

			private _ctrl = uiNamespace getVariable ["BRM_FMK_Plugin_CommanderLock_ctrlStatusText", controlNull];
			if (!isNull _ctrl) then {
				[_ctrl getVariable "BRM_FMK_Plugin_CommanderLock_timerPFH"] call CBA_fnc_removePerFrameHandler;

				_ctrl ctrlSetStructuredText parseText (if (BRM_FMK_Plugin_CommanderLock_showTimer) then {
					format ["<t align='left' size='0.6'><t font='RobotoCondensedBold' color='#ff0000'>WEAPONS HOT</t><br />%1</t>", [time, "M:SS"] call BRM_FMK_fnc_formatElapsedTime]
				} else {
					"<t align='left' size='0.6' font='RobotoCondensedBold' color='#ff0000'>WEAPONS HOT</t>"
				});

				[{ "BRM_FMK_Plugin_CommanderLock" cutText ["", "PLAIN"]; }, nil, 5] call CBA_fnc_waitAndExecute;
			} else {
				"BRM_FMK_Plugin_CommanderLock" cutText ["", "PLAIN"];
			};
		};
	}, [side player, _firedManEH, _getInManEH, _aceExplosivesSetupEH]] call CBA_fnc_addEventHandlerArgs;
}] call CBA_fnc_waitUntilAndExecute;
