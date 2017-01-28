
private ["_unit", "_uid","_name"];

_unit = _this select 0;
_uid = _this select 2;
_name = _this select 3;

_validSlot = _unit getVariable ["unit_valid_slot", false];

if ([_uid, _name] in mission_dead_players) exitWith {};
if (!_validSlot) exitWith {};

private 
["_tfarGlobalVolume", "_tfarVoiceVolume", "_tfarAbleUseRadio", 
"_acreIsDisabled", "_acreGlobalVolume",
"_aceCaptive","_aceBlood","_aceWounds","_aceMorphine","_acePain",
"_aceIsUnconscious","_aceMedication","_aceEarplugs",
"_playerVehicleSeat"];

_packetPlayer = [];

_packetPlayer pushBack _uid;

if (mission_TFAR_enabled) then {

    _tfarGlobalVolume = _unit getVariable ["tf_globalVolume", 1];
    _tfarVoiceVolume = _unit getVariable ["tf_voiceVolume", 1];
    _tfarAbleUseRadio =  _unit getVariable ["tf_unable_to_use_radio", false];

    _packetPlayer pushBack _tfarGlobalVolume;
    _packetPlayer pushBack _tfarVoiceVolume;
    _packetPlayer pushBack _tfarAbleUseRadio;
};

if (mission_ACRE2_enabled) then {
    _acreIsDisabled = _unit getVariable ["acre_sys_core_isDisabled", false];
    _acreGlobalVolume = _unit getVariable ["acre_sys_core_globalVolume", 1];

    _packetPlayer pushBack _acreIsDisabled;
    _packetPlayer pushBack _acreGlobalVolume;
};

if (mission_ACE3_enabled) then {
    _aceCaptive = _unit getVariable ["ACE_captives_isHandcuffed", false];

    _aceBlood = _unit getVariable ["ACE_medical_bloodVolume",100];
    _aceWounds =  _unit getVariable["ACE_medical_openWounds",[]];
	_acePain = _unit getVariable ["ACE_medical_pain", 0];
	_aceMorphine = _unit getVariable ["ACE_medical_morphine", 0];
	
	_aceIsUnconscious = _unit getVariable ["ACE_isUnconscious", false];
	_aceMedication = _unit getVariable ["ACE_medical_allUsedMedication", []];
	_aceEarplugs = _unit getVariable ["ACE_hasEarPlugsin", false];

    _packetPlayer pushBack _aceCaptive;
    _packetPlayer pushBack _aceBlood;
    _packetPlayer pushBack _aceWounds;
    _packetPlayer pushBack _acePain;
    _packetPlayer pushBack _aceMorphine;
    _packetPlayer pushBack _aceIsUnconscious;
    _packetPlayer pushBack _aceMedication;
    _packetPlayer pushBack _aceEarplugs;
};

_playerDir = getDir _unit;
_playerPos = getPosATL _unit;
_playerDamage = getDammage _unit;

_playerVehicle = (vehicle _unit);
_playerUnit = _unit;

switch (true) do {
    case (_unit == commander _playerVehicle): { _playerVehicleSeat = "COMMANDER" };
    case (_unit == driver _playerVehicle): { _playerVehicleSeat = "DRIVER" };
    case (_unit == gunner _playerVehicle): { _playerVehicleSeat = "GUNNER" };
    default { _playerVehicleSeat = "CARGO" };
};

_playerGear = [_unit] call BRM_FMK_fnc_getGear;

_packetPlayer pushBack _playerDir;
_packetPlayer pushBack _playerPos;
_packetPlayer pushBack _playerDamage;

_packetPlayer pushBack str _playerUnit;
_packetPlayer pushBack _playerVehicle;
_packetPlayer pushBack _playerVehicleSeat;
_packetPlayer pushBack _playerGear;

 _index = (count mission_player_status);

 { if ((_x select 0) == (_packetPlayer select 0)) then { _index = _forEachIndex } } forEach mission_player_status;

 ["LOCAL", "CHAT", format ["PLAYER %1 DISCONNECTED: %2", _name, str _packetPlayer]] call BRM_FMK_fnc_doLog;
 ["LOCAL", "LOG", format ["PLAYER %1 DISCONNECTED: %2", _name, str _packetPlayer]] call BRM_FMK_fnc_doLog;

 mission_player_status set [_index, _packetPlayer];
 publicVariable "mission_player_status";
