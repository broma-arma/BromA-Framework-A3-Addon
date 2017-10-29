if (!(isDedicated)) then {
    [{(time > 1)}, {
        constructionMenuOpen = false;

        fnc_generateVehicleCondition = {
            private["_vehicleArray"];

            switch (true) do {
                case (side player == side_a_side): { _vehicleArray = plank_objects_side_a };
                case (side player == side_b_side): { _vehicleArray = plank_objects_side_b };
                case (side player == side_c_side): { _vehicleArray = plank_objects_side_c };
            };
            _return = "";

            if (count _vehicleArray == 0) then {
                _return = "&& false";
            } else {
                _return = "&& ";
                {
                    _vehicle = _x select 0;
                    _distance = _x select 1;

                    _return = _return + "(((_this distance " + _vehicle + ") < " + _distance + ") && (alive " + _vehicle + "))";
                    if ((_forEachIndex + 1) < (count _vehicleArray)) then { _return = _return + " || " };
                } forEach _vehicleArray;
            };
            myReturnVar = _return;

            _return
        };

        fnc_toggleConstruction = { constructionMenuOpen = !(constructionMenuOpen) };

        deployConditionBasic = "((vehicle _this == _this) " + ([] call fnc_generateVehicleCondition) + ")";
        deployCondition = deployConditionBasic + " && (constructionMenuOpen)";

        _openConstructionMenuAction = player addAction ['<t color="#DEA010">Toggle Construction Menu</t>', fnc_toggleConstruction, [], 100, false, false, "", deployConditionBasic];

        if (isPlayer player && hasInterface) then {
            _type = getText (configfile >> "CfgVehicles" >> (typeOf player) >> "displayName");
            switch (_type) do {
                case "Officer": { [player, PLANK_Officer_Objects] call plank_api_fnc_forceAddFortifications; PLANK_FMK_buildSpeed = PLANK_FMK_buildSpeed * 0.7 };
                case "Squad Leader": { [player, PLANK_SL_Objects] call plank_api_fnc_forceAddFortifications };
                case "Team Leader": { [player, PLANK_FTL_Objects] call plank_api_fnc_forceAddFortifications };
                case "Repair Specialist": { [player, PLANK_Specialist_Objects] call plank_api_fnc_forceAddFortifications; PLANK_FMK_buildSpeed = PLANK_FMK_buildSpeed * 2 };
                case "Engineer": { [player, PLANK_Specialist_Objects] call plank_api_fnc_forceAddFortifications; PLANK_FMK_buildSpeed = PLANK_FMK_buildSpeed * 4 };
                default { [player, PLANK_Player_Objects] call plank_api_fnc_forceAddFortifications };
            };
        };
    }, []] call CBA_fnc_waitUntilAndExecute;
};