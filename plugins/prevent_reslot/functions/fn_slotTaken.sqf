if !(hasInterface && isRemoteExecuted) exitWith {};

params ["_hasSlot", "_slot"];

player setVariable ["BRM_FMK_Plugin_PreventReslot_validSlot", false, true];
player enableSimulation false;

if (visibleMap) then { openMap false; };
while {dialog} do { closeDialog 0; };

_slot params ["_name", "_roleDescription"];
private _text = if (_hasSlot) then {
	format ["You are choosing a different slot from your original one.\n\nPlease reslot as %1.", _roleDescription]
} else {
	format ["The slot you're trying to join as is currently taken by %1.\n\nPlease select a different one.", _name]
};
titleText [_text, "BLACK FADED"];

sleep 10;

["LOCAL", "F_LOG", format ["ENDING MISSION - RESLOTTED AS %1", ["TAKEN SLOT", "A DIFFERENT UNIT"] select _hasSlot]] call BRM_FMK_fnc_doLog;

findDisplay 46 closeDisplay 0;
