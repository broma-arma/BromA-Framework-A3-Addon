params ["_unit", "_type", "_attachments", "_selected"];

{
    _selectedAttachment = (_attachments select _x) call BIS_fnc_selectRandom;
    [_unit, _type, _selectedAttachment] call BRM_FMK_fnc_attachToWeapon;
} forEach _selected;
