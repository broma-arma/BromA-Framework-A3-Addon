#include "component.hpp"

if (isServer) then {
    private _group = createGroup sideLogic;
    private _pos = getMarkerPos "ao";
    private _size = getMarkerSize "ao";
    private _rot = markerDir "ao";

    private _logic = _group createUnit ["Logic", _pos, [], 0, "CAN_COLLIDE"];
    _logic setVariable ["objectArea", [_size select 0, _size select 1, _rot, true, 0]];

    [_logic, nil, true] call BIS_fnc_moduleCoverMap;

    BRM_FMK_MapCover_VAR_coverCreated = true;
    publicVariable "BRM_FMK_MapCover_VAR_coverCreated";
};

if (hasInterface) then {
    [{!(isNil "BRM_FMK_MapCover_VAR_coverCreated")}, {
        BRM_FMK_MapCover_VAR_mapOpacity = 0.5;
        BRM_FMK_MapCover_VAR_mapColor = "ColorBlack";
        BRM_FMK_MapCover_VAR_mapBrush = "SolidFull";

        private _BRM_FMK_MapCover_VALUES_brushTypes = [
            ["SolidFull", "SolidBorder", "Solid", "Horizontal", "Vertical", "Grid", "FDiagonal", "BDiagonal", "DiagGrid", "Cross", "Border"],
            ["Full Solid", "Solid with Border", "Solid", "Horizontal", "Vertical", "Grid", "Diagonal Frame", "Backwards Diagonal Frame", "Diagonal Grid", "Cross", "Border"]
        ];

        private _BRM_FMK_MapCover_VALUES_validColors = [
            ["ColorBlack", "ColorGrey", "ColorWhite", "ColorEAST", "ColorGUER", "ColorWEST", "ColorYellow", "ColorOrange", "ColorBrown", "ColorKhaki", "ColorPink"],
            ["Black", "Grey", "White", "Red", "Green", "Blue", "Yellow", "Orange", "Brown", "Khaki", "Pink"]
        ];

        private _BRM_FMK_MapCover_fnc_renderMap = {
            for "_i" from 0 to 270 step 90 do {
                private _coverMap = (format ["BIS_fnc_moduleCoverMap_%1", _i]);
                _coverMap setMarkerBrushLocal BRM_FMK_MapCover_VAR_mapBrush;
                _coverMap setMarkerAlphaLocal BRM_FMK_MapCover_VAR_mapOpacity;
                _coverMap setMarkerColorLocal BRM_FMK_MapCover_VAR_mapColor;
            };
        };

        ["BRM_FMK_MapCover_VAR_mapBrush", "LIST", ["MAP COVER -          Brush type", "The style of the cover."], "BromA Framework", _BRM_FMK_MapCover_VALUES_brushTypes, 0, _BRM_FMK_MapCover_fnc_renderMap] call CBA_settings_fnc_init;
        ["BRM_FMK_MapCover_VAR_mapOpacity", "SLIDER", ["MAP COVER -               Opacity", "The opacity of the cover."], "BromA Framework", [0, 1, 0.7, 1], 0, _BRM_FMK_MapCover_fnc_renderMap] call CBA_settings_fnc_init;
        ["BRM_FMK_MapCover_VAR_mapColor", "LIST", ["MAP COVER -                    Color", "The color of the cover."], "BromA Framework", _BRM_FMK_MapCover_VALUES_validColors, 0, _BRM_FMK_MapCover_fnc_renderMap] call CBA_settings_fnc_init;
    }, []] call CBA_fnc_waitUntilAndExecute;
};
