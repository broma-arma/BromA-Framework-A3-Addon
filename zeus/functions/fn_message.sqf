params [["_message", "", ["", 0]]];

if (_message == "") exitWith {};

[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
