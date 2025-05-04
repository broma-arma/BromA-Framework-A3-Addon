#include "../../defines.hpp"

if !(isServer) exitWith {};

TRACE_1("fn_postInit: %1", _this);

activateAddons ("true" configClasses (configFile >> "CfgPatches") apply { configName _x });

BRM_FMK_RHEA_Channel = radioChannelCreate [[1, 0, 0, 1], "RHEA", "%UNIT_NAME: ", [], false];

addMissionEventHandler ["EntityRespawned", {
	params ["_entity", "_corpse"];

	if (_entity call BRM_FMK_RHEA_fnc_isLoggedIn) then {
		BRM_FMK_RHEA_Channel radioChannelAdd [_entity];

		private _index = _entity getVariable "BRM_FMK_RHEA_server_zeus";
		if (!isNil "_index") then {
			missionNamespace setVariable [format ["BRM_FMK_RHEA_server_zeus%1", _index], _entity];
		};
	};
}];

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	if (_unit call BRM_FMK_RHEA_fnc_isLoggedIn) then {
		_unit call BRM_FMK_RHEA_SERVER_fnc_logoutPlayer;
	};
}];

BRM_FMK_RHEA_server_zeusSlots = [];
for "_i" from 0 to nfe_rhea_zeusCount - 1 do {
	// Note: Created group will be deleted in moduleInit.
	private _module = createGroup sideLogic createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
	private _varName = format ["BRM_FMK_RHEA_server_zeus%1", _i];
	missionNamespace setVariable [_varName, objNull];
	_module setVariable ["owner", _varName];
	//_module setVariable ["Addons", 2]; // Default 2
	//_module setVariable ["forced", 0]; // Default 0
	//_module setVariable ["name", ""]; // Default "" (localize "STR_A3_curator")
	//_module setVariable ["channels", []]; // Default []
	_module setVariable ["showNotification", false]; // Default true
	_module setVariable ["birdType", ""]; // Default "eagle_f"

	_module setVariable ["BRM_FMK_RHEA_server_zeus", true];

	_module setCuratorWaypointCost 0;
	_module allowCuratorLogicIgnoreAreas true;
	_module setCuratorCameraAreaCeiling 50000;
	//_module addCuratorEditableObjects [(vehicles + allUnits), true];
	{ _module setCuratorCoef [_x, 0]; } forEach ["place", "edit", "delete", "destroy", "group", "synchronize"];

	_module setVariable ["bis_fnc_initModules_activate", true];

	BRM_FMK_RHEA_server_zeusSlots pushBack _module;
};

INFO_1("Started Rhea Server @ %1", time);

BRM_FMK_RHEA_init = true;
publicVariable "BRM_FMK_RHEA_init";
