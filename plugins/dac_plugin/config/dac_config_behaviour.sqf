if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	DAC_fConfigBehav = compile preprocessFileLineNumbers "dac\dac_config_behaviour.sqf";
	_this call DAC_fConfigBehav
};

params ["_index"];

private ["_setSkill", "_setCombat", "_setBehav", "_setSpeed", "_setForm", "_setPatrol", "_setSearch", "_setFleeing", "_setHeliVal", "_setPause", "_setBldgBeh", "_setSupport", "_setJoin", "_setEmpVeh", "_setSupTime", "_setHidTime"];

if (_index >= 0 && _index < 4) then {
	_setCombat  = ["green", "white", "yellow"];
	_setBehav   = ["careless", "safe", "aware"];
	_setSpeed   = ["limited", "normal", "full"];
	_setForm    = ["line", "vee", "column", "wedge", "stag column", "ech left", "ech right", "file", "diamond"];
	_setFleeing = [0, 200];
	_setHeliVal = [50, 500, 1, 0];
	_setPause   = [[0, 59], [0, 59], [0, 59], [10, 120, 60, 10], [0, 10], [0, 10]];
	_setBldgBeh = [5, 50, 120, 600, 2];
	_setPatrol  = ["25 + random (25 * (1 - skill _leader))", "60 + random (240 * (1 - skill _leader))"];
	_setSearch  = ["25 + random (25 * (1 - skill _leader))", "30 + random (90 * (1 - skill _leader))"];
	_setSupport = [0, 0];
	_setJoin    = 1;
	_setEmpVeh  = [[50, 25], [50, 25]];
	_setSupTime = ["5 + skill _unit * DAC_AI_Level", 3, 5];
	_setHidTime = ["((10 * DAC_AI_Level + 50 * skill _leader) / (count units _group + 1))"];
};

switch (_index) do {
	case 0: { // EASY
		// aimingAccuracy, aimingShake, aimingSpeed, endurance, spotDistance, spotTime, courage, reloadSpeed, commanding, general
		_setSkill   = [[0.2, 0.2], [0.2, 0.2], [0.2, 0.2], [0.2, 0.2], [0.2, 0.2], [0.2, 0.2], [0.2, 0.2], [0.2, 0.2], [0.2, 0.2], [0.2, 0.2]];
		_setCombat  = ["green"];
		_setForm    = ["line"];
	};
	case 1: { // NORMAL
		_setSkill   = [mission_DAC_AI_skill, [0.4, 0.5], [0.4, 0.5], mission_DAC_AI_skill, mission_DAC_AI_skill, [0.6, 0.7], [0.8, 0.9], [0.2, 0.4], mission_DAC_AI_skill, mission_DAC_AI_skill];
	};
	case 2: { // STEALTH
		// Groups cross open terrain primarily by crawling and with small bounding manoeuvres.
		// In cities groups move as straight as possible to their waypoint avoiding roads and using every piece of cover available, peeking around corners, 360 cover, bounding manoeuvres.
		// Not recommended for vehicles.
		_setSkill   = [[0.2, 0.3], [0.3, 0.4], [0.3, 0.4], [0.6, 0.8], [0.3, 0.5], [0.2, 0.3], [0.5, 0.8], [0.2, 0.4], [0.6, 0.8], [0.4, 0.6]];
		_setCombat  = ["red"];
		_setBehav   = ["stealth"];
		_setSpeed   = ["full"];
		_setPause   = [[0, 5], [0, 5], [0, 5], [10, 120, 5, 5], [0, 5], [0, 5]];
		_setBldgBeh set [0, 0]; // Disable occupying buildings
		_setEmpVeh select 0 set [0, 0]; // Disable occupying empty vehicles and statics
	};
	case 3: { // HARD
		// Basically the death star in terms of laserness
		_setSkill   = [[0.7, 0.8], [0.7, 0.8], [0.7, 0.8], [0.7, 0.8], [0.5, 0.6], [0.5, 0.6], [0.7, 0.8], [0.7, 0.8], [0.7, 0.8], [0.7, 0.8]];
	};
};

if (isNil "BRM_FMK_DAC_cfgBehaviour") then {
	BRM_FMK_DAC_cfgBehaviour = if (fileExists "dac\dac_config_behaviour.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_behaviour.sqf" } else { {} };
};
call BRM_FMK_DAC_cfgBehaviour;

if (DAC_Basic_Value != 5 && (isNil "_setSkill" || isNil "_setCombat" || isNil "_setBehav" || isNil "_setSpeed" || isNil "_setForm" || isNil "_setPatrol" || isNil "_setSearch" || isNil "_setFleeing" || isNil "_setHeliVal" || isNil "_setPause" || isNil "_setBldgBeh" || isNil "_setSupport" || isNil "_setJoin" || isNil "_setEmpVeh" || isNil "_setSupTime" || isNil "_setHidTime")) exitWith {
	DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
	systemChat "Error: DAC_Config_Behaviour > No valid config number";
};

[
	_setSkill, _setCombat, _setBehav, _setSpeed, _setForm, _setFleeing,
	_setHeliVal, _setPause, _setBldgBeh, _setPatrol, _setSearch,
	_setSupport, _setJoin, _setEmpVeh, _setSupTime, _setHidTime
]
