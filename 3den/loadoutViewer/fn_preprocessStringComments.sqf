/*
================================================================================

NAME:
    BRM_FMK_3DEN_fnc_preprocessStringComments

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Removes line and block comments from a string.

PARAMETERS:
    0 - String to preprocess (STRING)

USAGE:
    ["systemChat ""Hello world!""; // Say hello to the world!"] call BRM_FMK_3DEN_fnc_preprocessStringComments; // "systemChat ""Hello world!""; "

RETURNS:
    Preprocessed string. (STRING)

================================================================================
*/

params [["_code", "", [""]]];

if (_code == "") exitWith { _code };

private _processed = "";
private _state = 0;
private _stringChar = "";
private _i = 0;
private _length = count _code;
for "_j" from 0 to _length - 1 do { // Note: while is limited to 10,000 iterations
	if (_i >= _length) then { break; };
	private _char = _code select [_i, 1];
	private _nextChar = _code select [_i + 1, 1];
	switch (_state) do {
		case 0: { // Default
			switch (true) do {
				case (_char == """" || _char == "'"): {
					_stringChar = _char;
					_state = 1;
					_processed = _processed + _char;
				};
				case (_char == "/" && _nextChar == "/"): { _i = _i + 1; _state = 2; };
				case (_char == "/" && _nextChar == "*"): { _i = _i + 1; _state = 3; };
				default { _processed = _processed + _char; };
			};
		};
		case 1: { // String
			if (_char == _stringChar) then {
				if (_nextChar == _stringChar) then {
					_processed = _processed + _char;
					_i = _i + 1;
					_char = _nextChar;
				} else {
					_state = 0;
				};
			};
			_processed = _processed + _char;
		};
		case 2: { // Line comment
			if (_nextChar in toString [10, 13]) then {
				_state = 0;
			};
		};
		case 3: { // Block comment
			if (_char == "*" && _nextChar == "/") then {
				_i = _i + 1;
				_state = 0;
			};
		};
	};
	_i = _i + 1;
};

_processed
