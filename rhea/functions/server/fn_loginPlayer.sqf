#include "../../defines.hpp"

if !(isServer) exitWith {};

TRACE_1("fn_loginPlayer: %1", _this);

params [["_player", objNull], ["_pass", ""]];

if (isNull _player || _player isKindOf "HeadlessClient_F") exitWith {};

if (
		player isEqualTo _player ||
		nfe_rhea_autoLoggedAdmins && { admin owner _player == 2 } ||
		nfe_rhea_autoVotedAdmins && { admin owner _player == 1 } ||
		nfe_rhea_password != "" && { _pass == nfe_rhea_password } ||
		!isNil "mission_author_name" && { name _player in mission_author_name } ||
		{ getPlayerUID _player in (nfe_rhea_autoSteam splitString ",") }
	) then {
	BRM_FMK_RHEA_Channel radioChannelAdd [_player];
	_player setVariable ["BRM_FMK_RHEA_loggedIn", true, true];
};

_player setVariable ["BRM_FMK_RHEA_waiting", false, true];
