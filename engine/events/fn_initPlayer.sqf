/*
================================================================================

NAME:
    BRM_FMK_fnc_initPlayer

AUTHOR(s):
    Nife

DESCRIPTION:
    Function called by the player to initialize itself.

PARAMETERS:
    None. All parameters are taken from the unit's "unitInit" object variable.

USAGE:
    [] call BRM_FMK_fnc_initPlayer

RETURNS:
    Nothing.

================================================================================
*/

// Waits until initialization is safe. =========================================

if (!hasInterface) exitWith {};
finishMissionInit;
waitUntil { player == player && !isNull player };

private _playerLog = format ["INITIALIZING PLAYER '%1' (%2)", name player, player];
["LOCAL", "F_LOG", _playerLog] call BRM_FMK_fnc_doLog;
["SERVER", "F_LOG", _playerLog] call BRM_FMK_fnc_doLog;

// Assigns JIP status. =========================================================

player_is_jip = didJIP; // Backward compatibility

["LOCAL", "F_LOG", format ["JIP STATUS: %1 | TIME: %2", didJIP, time]] call BRM_FMK_fnc_doLog;

player_is_spectator = player getVariable ["is_spectator", false] || player isKindOf "VirtualSpectator_F";

if (!mission_allow_jip && didJIP && !player_is_spectator) exitWith {
	[player] spawn BRM_FMK_fnc_removeJIP;
	player setVariable ["unit_initialized", true, true];
};

// Synchronize time with the server. ===========================================

[] spawn BRM_FMK_fnc_syncTime;

// Removes spectators from the game. ===========================================

if (player_is_spectator) exitWith { [player] call BRM_FMK_fnc_initSpectator };

// Checks if player hasn't already been initialized. ===========================

if (player getVariable ["unit_initialized", false]) exitWith {};

// Reads player's init line. ===================================================

(player getVariable ["unitInit", ["MAIN", "*", "*", "*"]]) params ["_groupColor", "_faction", "_role", "_groupName"];

// Adds player to relevant lists and registers its original side. ==============

player setVariable ["unit_side", side player, true];

switch (side player) do {
    case side_a_side: { if !(player in mission_players_A) then { mission_players_A pushBack player; publicVariable "mission_players_A" }; };
    case side_b_side: { if !(player in mission_players_B) then { mission_players_B pushBack player; publicVariable "mission_players_B" }; };
    case side_c_side: { if !(player in mission_players_C) then { mission_players_C pushBack player; publicVariable "mission_players_C" }; };
};

// Reads player faction and assigns the unit loadout. ==========================

_faction = switch (_faction) do {
    case "side_a": { side_a_faction };
    case "side_b": { side_b_faction };
    case "side_c": { side_c_faction };
    default        { _faction };
};

private _aliasAUTO = ["*", "AUTO", "ANY"];
private _aliasNONE = ["-", "NONE", "VANILLA"];

if (toUpper _faction in _aliasAUTO) then {
    _faction = [side player, "faction"] call BRM_FMK_fnc_getSideInfo;
};

if (toUpper _role in _aliasAUTO) then {
    _role = getText (configfile >> "CfgVehicles" >> typeOf player >> "displayName");
};

if (!(_faction in _aliasNONE) && !units_player_useVanillaGear) then {
    [player, _faction, _role] call BRM_fnc_assignLoadout;
};

// Holster player's weapon. ====================================================

[player] spawn BRM_FMK_fnc_weaponAway;

// Assigns alias to other units and groups. ====================================

if (didJIP) then {
    [player, _groupName, _role] call BRM_FMK_fnc_setAlias;
};

// Initializes score related variables. ========================================

if (isNil {player getVariable "unit_score"}) then {
    private _score = 0;
    { if (_x select 0 == name player) exitWith { _score = _x select 1; }; } forEach mission_unit_score;
    player setVariable ["unit_score", _score];
};
if (isNil {player getVariable "unit_deaths"}) then {
    player setVariable ["unit_deaths", 0];
};

// Assigns AGM related variables. ==============================================

if (mission_AGM_enabled) then {
    switch (_role) do {
        case "medic":    { player setVariable ["AGM_IsMedic",    true, true] };
        case "pilot":    { player setVariable ["AGM_GForceCoef", 0.75, true] };
        case "engineer": { player setVariable ["AGM_IsEOD",      true, true] };
    };
};

// Adds Event Handlers with pre-configured functions. ==========================

player addEventHandler ["Respawn", BRM_fnc_onPlayerRespawn];
player addEventHandler ["Hit", { (_this select 0) setVariable ["last_damage", _this select 1] }];
player addEventHandler ["Killed", BRM_fnc_onPlayerKilled];

addMissionEventHandler ["EntityKilled", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    _unit setMimic "dead";
}];

// Changes the player's assigned color within its group. =======================

[toUpper _groupColor] spawn {
    params ["_color"];
    private _nColor = if (_color == "WHITE") then { "MAIN" } else { _color };

    sleep 5;
    player assignTeam _nColor;
};

// Disables object recognition to save performance. ============================

if (mission_game_mode == "tvt") then { disableRemoteSensors true };

// Makes sure text channels are disabled. ======================================

0 spawn {
    sleep 10;
    { _x enableChannel false; } forEach getArray (missionConfigFile >> "disableChannels");
};

// Finishes initialization sequence. ===========================================

["LOCAL", "F_LOG", "PLAYER INITIALIZED"] call BRM_FMK_fnc_doLog;

player setVariable ["unit_initialized", true, true];
