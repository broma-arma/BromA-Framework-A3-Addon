/*
================================================================================

NAME:
    BRM_FMK_fnc_callCodeArea

AUTHOR(s):
    Nife

DESCRIPTION:
    Executes code on all units inside a trigger area. Call this from a trigger init field.

PARAMETERS:
    0 - thisTrigger (TRIGGER)
    1 - Filter (STRING that evaluates as an EXPRESSION / CODE that returns BOOLEAN)
    2 - Code to be executed (STRING that evaluates as CODE / CODE)

USAGE:
    ON A TRIGGER'S INIT FIELD (make sure you set the condition to TRUE):

    _nul = [thisTrigger, "(side _x == east)", "[_x, 'side_b'] call BRM_FMK_fnc_initAI"] spawn BRM_FMK_fnc_callCodeArea
    _nul = [thisTrigger, "(side _x == civilian) && (alive _x)", "[_x, 'RACS'] call BRM_FMK_fnc_initAI"] spawn BRM_FMK_fnc_callCodeArea

RETURNS:
    Nothing.

================================================================================
*/

params [
	["_trigger", objNull, [objNull]],
	["_filter", {}, ["", {}]],
	["_code", {}, ["", {}]]
];

_trigger setTriggerActivation ["ANY", "PRESENT", false];

if (_filter isEqualType "") then {
	_filter = compile _filter;
};
if (_code isEqualType "") then {
	_code = compile _code;
};

sleep 1;

{
	{
		if (call _filter) then {
			call _code;
		};
	} forEach crew _x;
} forEach list _trigger;
