if (!isServer) exitWith {};

private _paramTimeOfDay = ["p_time_of_day", 32] call BIS_fnc_getParamValue; // 0="===========", 1=" ", 2="00:00", 3="01:00", 4="02:00", 5="03:00", 6="04:00", 7="05:00", 8="06:00", 9="07:00", 10="08:00", 11="09:00", 12="10:00", 13="11:00", 14="12:00", 15="13:00", 16="14:00", 17="15:00", 18="16:00", 19="17:00", 20="18:00", 21="19:00", 22="20:00", 23="21:00", 24="22:00", 25="23:00", 26=" ", 27="===========", 28=" ", 29="Dawn", 30="Early morning", 31="Morning", 32="Noon", 33="Afternoon", 34="Evening", 35="Dusk", 36="Night", 37=" ", 38="===========", 39=" ", 40="Random", 41="Custom", 42=" ", 43="==========="
private _paramWeatherValues = ["p_weather", 2] call BIS_fnc_getParamValue; // 0="===========", 1=" ", 2="Clear", 3="Overcast", 4="Raining", 5="Storm", 6=" ", 7="===========", 8=" ", 9="Random", 10="Mission Settings", 11=" ", 12="==========="
private _paramFogValues = ["p_fog", 2] call BIS_fnc_getParamValue; // 0="===========", 1=" ", 2="Clear", 3="Mist", 4="Low/Thin", 5="Low/Thick", 6="Medium/Thin", 7="Medium/Thick", 8="High/Thin", 9="High/Thick", 10="Extreme", 11=" ", 12="===========", 13=" ", 14="Random", 15="Mission Settings", 16=" ", 17="==========="
private _paramWindValues = ["p_wind", 2] call BIS_fnc_getParamValue; // 0="===========", 1=" ", 2="None", 3="Light", 4="Medium", 5="Strong", 6="Extreme", 7=" ", 8="===========", 9=" ", 10="Random", 11="Mission Settings", 12=" ", 13="==========="

// ============================================================================
//  Date                                                                       |
// ============================================================================

date params ["_year", "_month", "_day"];

if ((_paramTimeOfDay > 1) && (_paramTimeOfDay < 26)) then {
	setDate [_year, _month, _day, (_paramTimeOfDay) - 2, 00];
} else {
	switch (_paramTimeOfDay) do {

		// Dawn
		case 29: { setDate [_year, _month, _day, 4, 50] };

		// Early Morning
		case 30: { setDate [_year, _month, _day, 5, 50] };

		// Morning
		case 31: { setDate [_year, _month, _day, 9, 00] };

		// Noon
		case 32: { setDate [_year, _month, _day, 12, 0] };

		// Afternoon
		case 33: { setDate [_year, _month, _day, 15, 00] };

		// Evening
		case 34: { setDate [_year, _month, _day, 17, 50] };

		// Dusk
		case 35: { setDate [_year, _month, _day, 18, 50] };

		// Night
		case 36: { setDate [_year, _month, _day, 0, 0] };

		// Random
		case 40: { setDate [_year, _month, _day, floor (random (23)), floor (random (59))] };

		// Custom
		case 41: { setDate missionCustomDate };

		default { setDate [_year, _month, _day, 12, 34] };
	};
};
// ============================================================================
//  Weather, Fog, and Wind Conditions                                          |
// ============================================================================

private ["_weatherValues", "_fogValues", "_windValues"];

_weatherValues = [0, 0, 0, 0];
_fogValues = [0, 0, 0];
_windValues = [0, 0, 0];

switch (_paramWeatherValues) do {

	// overcast, rain, lightnings, rainbow

	// Clear
	case 2: { _weatherValues = [0.01, 0, 0, 1] };

	// Overcast
	case 3: { _weatherValues = [0.8, 0, 0.5, 0] };

	// Raining
	case 4: { _weatherValues = [0.8, 0.8, 0.5, 0] };

	// Storm
	case 5: { _weatherValues = [1, 1, 1, 0] };

	// Random
	case 9: { _weatherValues = [random (1), random (1), random (1), random (1)] };

	// Mission Custom
	case 10: { _weatherValues = missionCustomWeather };
};

switch (_paramFogValues) do {

	// base value, decay, altitude

	// CLEAR
	case 2: { _fogValues = [0, 0, 0] };

	// MIST
	case 3: { _fogValues = [0.2, 0.01, 100] };

	// LOW THIN
	case 4: { _fogValues = [0.1, 0.09, 50] };

	// LOW THICK
	case 5: { _fogValues = [0.3, 0.1, 60] };

	// MEDIUM THIN
	case 6: { _fogValues = [0.02, 0.09, 150] };

	// MEDIUM THICK
	case 7: { _fogValues = [0.5, 0.09, 150] };

	// HIGH THIN
	case 8: { _fogValues = [0.2, 0.01, 300] };

	// HIGH THICK
	case 9: { _fogValues = [0.005, 0.09, 300] };

	// EXTREME
	case 10: { _fogValues = [1, 0, 1] };

	// Random
	case 14: { _fogValues = [random (1), random (0.1), random (350)] };

	// Mission Custom
	case 15: { _fogValues = missionCustomFog };
};

switch (_paramWindValues) do {

	// windStr, gusts, waves

	// None
	case 2: { _windValues = [0, 0, 0] };

	// Light
	case 3: { _windValues = [0.2, 0.2, 0.2] };

	// Medium
	case 4: { _windValues = [0.5, 0.5, 0.5] };

	// Heavy
	case 5: { _windValues = [0.7, 0.7, 0.7] };

	// Extreme
	case 6: { _windValues = [1, 1, 1] };

	// Random
	case 10: { _windValues = [random (1), random (1), random (1)] };

	// Mission Custom
	case 11: { _windValues = missionCustomWind };
};

0 setOvercast (_weatherValues select 0);
0 setRain (_weatherValues select 1);
0 setLightnings (_weatherValues select 2);
0 setRainbow (_weatherValues select 3);

0 setWindStr  (_windValues select 0);
0 setGusts (_windValues select 1);
0 setWindForce (_windValues select 1);
0 setWaves (_windValues select 2);

0 setFog _fogValues;
