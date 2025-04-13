#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_getSkillSettings

Description:
	Get AI skill settings.

Parameters:
	_settings - Setting ID [STRING/ARRAY]

Returns:
	Settings, nil if setting doesn't exist [ARRAY/NIL]
		_skill - AI Skill [ARRAY]
			_skillName - "general", "courage", "aimingAccuracy", "aimingShake", "aimingSpeed", "commanding", "endurance", "spotDistance", "spotTime", "reloadSpeed" [NUMBER]
			_value - value in range 0 to 1 [NUMBER]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_id"];

if (_id isEqualType []) exitWith { _id };

BRM_FMK_Plugin_AIS_aiSkills get _id
//["REGULAR", [["general", 1], ["aimingAccuracy", 0.70], ["aimingShake", 0.75], ["aimingSpeed", 1], ["endurance", 1], ["spotDistance", 0.85], ["spotTime", 1], ["courage", 1], ["reloadSpeed", 1], ["commanding", 1]]]
