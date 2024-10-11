if (!isServer) exitWith {};

private _paramTime = 0;
private _paramWeather = 0;
private _paramFog = 0;
private _paramWind = 0;

if (BRM_FMK_Engine_compatVersion == 0) then {
	_paramTime = [34, 34, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 34, 34, 2, 3, 4, 5, 6, 7, 8, 9, 34, 34, 34, 1, 0, 34, 34] param [["p_time_of_day", 32] call BIS_fnc_getParamValue, 34]; // 0="===========", 1=" ", 2="00:00", 3="01:00", 4="02:00", 5="03:00", 6="04:00", 7="05:00", 8="06:00", 9="07:00", 10="08:00", 11="09:00", 12="10:00", 13="11:00", 14="12:00", 15="13:00", 16="14:00", 17="15:00", 18="16:00", 19="17:00", 20="18:00", 21="19:00", 22="20:00", 23="21:00", 24="22:00", 25="23:00", 26=" ", 27="===========", 28=" ", 29="Dawn", 30="Early morning", 31="Morning", 32="Noon", 33="Afternoon", 34="Evening", 35="Dusk", 36="Night", 37=" ", 38="===========", 39=" ", 40="Random", 41="Custom", 42=" ", 43="==========="
	_paramWeatherValues = [6, 6, 2, 3, 4, 5, 6, 6, 6, 1, 0, 6, 6] param [["p_weather", 2] call BIS_fnc_getParamValue, 6]; // 0="===========", 1=" ", 2="Clear", 3="Overcast", 4="Raining", 5="Storm", 6=" ", 7="===========", 8=" ", 9="Random", 10="Mission Settings", 11=" ", 12="==========="
	_paramFogValues = [11, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 11, 11, 1, 0, 11, 11] param [["p_fog", 2] call BIS_fnc_getParamValue, 11]; // 0="===========", 1=" ", 2="Clear", 3="Mist", 4="Low/Thin", 5="Low/Thick", 6="Medium/Thin", 7="Medium/Thick", 8="High/Thin", 9="High/Thick", 10="Extreme", 11=" ", 12="===========", 13=" ", 14="Random", 15="Mission Settings", 16=" ", 17="==========="
	_paramWindValues = [7, 7, 2, 3, 4, 5, 6, 7, 7, 7, 1, 0, 7, 7] param [["p_wind", 2] call BIS_fnc_getParamValue, 7]; // 0="===========", 1=" ", 2="None", 3="Light", 4="Medium", 5="Strong", 6="Extreme", 7=" ", 8="===========", 9=" ", 10="Random", 11="Mission Settings", 12=" ", 13="==========="
} else {
	_paramTime = ["p_time_of_day", 0] call BIS_fnc_getParamValue; // 0="Mission Settings", 1="Random", 2="Dawn", 3="Early morning", 4="Morning", 5="Noon", 6="Afternoon", 7="Evening", 8="Dusk", 9="Night", 10="00:00", 11="01:00", 12="02:00", 13="03:00", 14="04:00", 15="05:00", 16="06:00", 17="07:00", 18="08:00", 19="09:00", 20="10:00", 21="11:00", 22="12:00", 23="13:00", 24="14:00", 25="15:00", 26="16:00", 27="17:00", 28="18:00", 29="19:00", 30="20:00", 31="21:00", 32="22:00", 33="23:00"
	_paramWeather = ["p_weather", 0] call BIS_fnc_getParamValue; // 0="Mission Settings", 1="Random", 2="Clear", 3="Overcast", 4="Raining", 5="Storm"
	_paramFog = ["p_fog", 0] call BIS_fnc_getParamValue; // 0="Mission Settings", 1="Random", 2="Clear", 3="Mist", 4="Low/Thin", 5="Low/Thick", 6="Medium/Thin", 7="Medium/Thick", 8="High/Thin", 9="High/Thick", 10="Extreme"
	_paramWind = ["p_wind", 0] call BIS_fnc_getParamValue; // 0="Mission Settings", 1="Random", 2="None", 3="Light", 4="Medium", 5="Strong", 6="Extreme"
};

// Date
date params ["_year", "_month", "_day"];
if (_paramTime > 9 && _paramTime < 34) then { // 10="00:00" to 33="23:00"
	setDate [_year, _month, _day, _paramTime - 10, 00];
} else {
	setDate (switch (_paramTime) do {
		case 0: { missionNamespace getVariable ["missionCustomDate", date] }; // Mission Settings
		case 1: { [_year, _month, _day, floor random 23, floor random 59] }; // Random
		case 2: { [_year, _month, _day, 4, 50] }; // Dawn
		case 3: { [_year, _month, _day, 5, 50] }; // Early morning
		case 4: { [_year, _month, _day, 9, 00] }; // Morning
		case 5: { [_year, _month, _day, 12, 0] }; // Noon
		case 6: { [_year, _month, _day, 15, 00] }; // Afternoon
		case 7: { [_year, _month, _day, 17, 50] }; // Evening
		case 8: { [_year, _month, _day, 18, 50] }; // Dusk
		case 9: { [_year, _month, _day, 0, 0] }; // Night
		default { [_year, _month, _day, 12, 34] };
	});
};

// Weather
(switch (_paramWeather) do {
	case 0: { missionNamespace getVariable ["missionCustomWeather", [overcast, rain, lightnings, rainbow]] }; // Mission Settings
	case 1: { [random (1), random (1), random (1), random (1)] }; // Random
	case 2: { [0.01, 0, 0, 1] }; // Clear
	case 3: { [0.8, 0, 0.5, 0] }; // Overcast
	case 4: { [0.8, 0.8, 0.5, 0] }; // Raining
	case 5: { [1, 1, 1, 0] }; // Storm
	default { [0, 0, 0, 0] };
}) params ["_overcast", "_rain", "_lightnings", "_rainbow"];

0 setOvercast _overcast;
0 setRain _rain;
0 setLightnings _lightnings;
0 setRainbow _rainbow;

// Fog
0 setFog (switch (_paramFog) do { // base value, decay, altitude
	case 0: { missionNamespace getVariable ["missionCustomFog", fogParams] }; // Mission Settings
	case 1: { [random 1, random 0.1, random 350] }; // Random
	case 2: { [0, 0, 0] }; // Clear
	case 3: { [0.2, 0.01, 100] }; // Mist
	case 4: { [0.1, 0.09, 50] }; // Low/Thin
	case 5: { [0.3, 0.1, 60] }; // Low/Thick
	case 6: { [0.02, 0.09, 150] }; // Medium/Thin
	case 7: { [0.5, 0.09, 150] }; // Medium/Thick
	case 8: { [0.2, 0.01, 300] }; // High/Thin
	case 9: { [0.005, 0.09, 300] }; // High/Thick
	case 10: { [1, 0, 1] }; // Extreme
	default { [0, 0, 0] };
});

// Wind
private _windValues = (switch (_paramWind) do {
	case 0: { missionNamespace getVariable ["missionCustomWind", [windStr, gusts, waves]] }; // Mission Settings
	case 1: { [random 1, random 1, random 1] }; // Random
	case 2: { [0, 0, 0] }; // None
	case 3: { [0.2, 0.2, 0.2] }; // Light
	case 4: { [0.5, 0.5, 0.5] }; // Medium
	case 5: { [0.7, 0.7, 0.7] }; // Strong
	case 6: { [1, 1, 1] }; // Extreme
	default { [0, 0, 0] };
}) params ["_windStr", "_gusts", "_waves"];

0 setWindStr _windStr;
0 setGusts _gusts;
0 setWindForce _gusts;
0 setWaves _waves;
