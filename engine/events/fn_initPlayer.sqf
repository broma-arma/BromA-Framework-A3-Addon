/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_initPlayer

AUTHOR(s):
    Nife

DESCRIPTION:
    Function called by the player to initialize itself.

PARAMETERS:
    None. All parameters are taken from the unit's "unitInit" object variable.

USAGE:
    [] call BRM_FMK_Engine_fnc_initPlayer

RETURNS:
    Nothing.

================================================================================
*/

#define ALIAS_AUTO ["*", "AUTO", "ANY"]
#define ALIAS_NONE ["-", "NONE", "VANILLA"]

if (!hasInterface) exitWith {};

finishMissionInit;
waitUntil { player == player && !isNull player };

["LOCAL", "F_LOG", format ["INITIALIZING %4PLAYER '%1' (%2) @ %3", name player, player, time, ["", "JIP "] select didJIP]] call BRM_FMK_fnc_doLog;

player_is_jip = didJIP; // Backward compatibility
player_is_spectator = player isKindOf "VirtualSpectator_F"; // Backward compatibility

if (!mission_allow_jip && didJIP && !(player isKindOf "VirtualSpectator_F")) exitWith {
	[player] call BRM_FMK_Engine_fnc_removeJIP;
	player setVariable ["unit_initialized", true, true];
};

[] call BRM_FMK_Engine_fnc_syncTime;

if (player isKindOf "VirtualSpectator_F") exitWith {};

if (player getVariable ["unit_initialized", false]) exitWith {};
player setVariable ["unit_initialized", true, true];

["BRM_FMK_Engine_initPlayerServer", player] call CBA_fnc_serverEvent;

player setVariable ["unit_side", side player, true]; // Backward compatibility

(player getVariable ["unitInit", ["MAIN", "*", "*", "*"]]) params ["_groupColor", "_faction", "_role", "_groupName"];

[toUpper _groupColor, "MAIN"] select (_groupColor == "WHITE") spawn {
	sleep 5;
	player assignTeam _this;
};

if (toUpper _role in ALIAS_AUTO) then { _role = getText (configOf player >> "displayName"); };

// Assign loadout
_faction = toUpper _faction;
_faction = switch (_faction) do {
	case "SIDE_A": { side_a_faction };
	case "SIDE_B": { side_b_faction };
	case "SIDE_C": { side_c_faction };
	default        { _faction };
};
if (_faction in ALIAS_AUTO) then { _faction = [side player, "faction"] call BRM_FMK_fnc_getSideInfo; };
if !(_faction in ALIAS_NONE || units_player_useVanillaGear) then {
	[player, _faction, _role] call BRM_FMK_fnc_assignLoadout;
};

if (didJIP) then {
	[player, _groupName, _role] call BRM_FMK_Engine_fnc_setAlias;
};

["LOCAL", "F_LOG", "PLAYER INITIALIZED"] call BRM_FMK_fnc_doLog;
