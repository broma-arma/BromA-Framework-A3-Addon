
_index = -1;

{ if ((_x select 0) == (getPlayerUID player)) then { _index = _forEachIndex } } forEach mission_player_status;

if (_index >= 0) then {
    _stats = mission_player_status select _index;
    
    _count = 1;
    
    if (mission_TFAR_enabled) then {
        player setVariable ["tf_globalVolume", (_stats select _count)]; _count = _count + 1;
        player setVariable ["tf_voiceVolume", (_stats select _count), true]; _count = _count + 1;
        player setVariable ["tf_unable_to_use_radio", (_stats select _count), true]; _count = _count + 1;
    };
    
    if (mission_ACRE2_enabled) then {
        player setVariable ["acre_sys_core_isDisabled", (_stats select _count), true]; _count = _count + 1;
        player setVariable ["acre_sys_core_globalVolume", (_stats select _count)]; _count = _count + 1;
    };

    if (mission_ACE3_enabled) then {
		[player, (_stats select _count)] call ACE_captives_fnc_setHandcuffed;_count = _count + 1;
		
		player setVariable ["ACE_medical_bloodVolume",(_stats select _count)];_count = _count + 1;
		player setVariable["ACE_medical_openWounds",(_stats select _count)];_count = _count + 1;
		player setVariable ["ACE_medical_pain", (_stats select _count)];_count = _count + 1;
		player getVariable ["ACE_medical_morphine", (_stats select _count)];_count = _count + 1;
		
		player getVariable ["ACE_isUnconscious", (_stats select _count)];_count = _count + 1;
		player getVariable ["ACE_medical_allUsedMedication", (_stats select _count)];_count = _count + 1;
		player getVariable ["ACE_hasEarPlugsin", (_stats select _count)];_count = _count + 1;
    };

    player setDir (_stats select _count); _count = _count + 1;
    
    _playerPos = (_stats select _count); _count = _count + 1;
    player setDamage (_stats select _count); _count = _count + 1;
    
    _playerUnit = (_stats select _count); _count = _count + 1;
    _vehicle = (_stats select _count); _count = _count + 1;
    _vehicleSeat = (_stats select _count); _count = _count + 1;
    _playerGear = (_stats select _count); _count = _count + 1;
    
    if (_playerUnit == str player) then {
        [player, _playerGear] call BRM_FMK_fnc_setGear;
    };
    
    if !(str _vehicle == "<NULL-object>") then {
        [_vehicle, _vehicleSeat] spawn BRM_FMK_SyncStatus_fnc_moveToVehicle;
        while {!(vehicle player == _vehicle) && (alive _vehicle)} do {
            [_vehicle, _vehicleSeat] spawn BRM_FMK_SyncStatus_fnc_moveToVehicle;
            if (!alive _vehicle) exitWith { player setPos _playerPos };
            sleep 3;
        };
    } else {
        player setPos _playerPos;
    };
};

// [player,0,getplayerUID player, name player] spawn BRM_FMK_SyncStatus_fnc_postStatus
// [player] spawn BRM_FMK_SyncStatus_fnc_setStatus;
