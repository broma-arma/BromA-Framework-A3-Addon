params ["_unit", "_type", "_attachments", "_selected"];

{
    _selectedAttachment = selectRandom (_attachments select _x);
    [_unit, _type, _selectedAttachment] call BRM_FMK_fnc_attachToWeapon;
} forEach _selected;
