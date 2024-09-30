/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_onDiaryChanged

AUTHOR(s):
    Karel Moricky, Coryf88

DESCRIPTION:
    Register code to be executed when diary item changes.

PARAMETERS:
    0 - Code to register, event handler index to remove, or array: [code, arg1, arg2, ...] (CODE/ARRAY/NUMBER)
        _thisArgs - Passed arguments (ANY)
        _thisEventHandler - Event handler index (NUMBER)
        _this:
            0 - Map display (DISPLAY)
            1 - true if clicked on subject list, false when on record list (clicking on subject may also trigger record) (NUMBER)
            2 - Subject. (STRING)
            3 - Record name. (STRING)
            4 - Record id. -1 when diary is closed. (NUMBER)

USAGE:
    private _handle = {
        params ["_display", "_subjectList", "_subject", "_record"];
        systemChat format ["display=%1, subjectList=%2, subject=%3, record=%4", _display, _subjectList, _subject, _record];
    } call BRM_FMK_Engine_fnc_onDiaryChanged;
    _handle call BRM_FMK_Engine_fnc_onDiaryChanged;

RETURNS:
   Event handler index. -1 if invalid parameters. (NUMBER)

================================================================================
*/

if (isNil "BRM_FMK_Engine_fnc_onDiaryChanged_codes") then { BRM_FMK_Engine_fnc_onDiaryChanged_codes = []; };

if (_this isEqualType {}) then { _this = [_this]; };

if (_this isEqualType []) exitWith {
	private _code = _this param [0, {}, [{}]];
	if (_code isEqualType {}) then {
		BRM_FMK_Engine_fnc_onDiaryChanged_codes pushBack [_code, _this select [1]]
	} else {
		-1
	}
};

if (_this isEqualType 0 && _this >= 0) exitWith { // Remove
	BRM_FMK_Engine_fnc_onDiaryChanged_codes set [_this, nil];
	_this
};

-1
