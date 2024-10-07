#ifdef BRM_PARAMS_CONDITIONS
	#ifndef MISCONDITIONS_PARAM_TIME
	#define MISCONDITIONS_PARAM_TIME 41
	#endif
	#ifndef MISCONDITIONS_PARAM_WEATHER
	#define MISCONDITIONS_PARAM_WEATHER 10
	#endif
	#ifndef MISCONDITIONS_PARAM_FOG
	#define MISCONDITIONS_PARAM_FOG 15
	#endif
	#ifndef MISCONDITIONS_PARAM_WIND
	#define MISCONDITIONS_PARAM_WIND 11
	#endif

	class p_time_of_day {
		title = "Time";
		values[] = {               41,       40,     29,              30,        31,     32,          33,        34,     35,      36,       2,       3,       4,       5,       6,       7,       8,       9,      10,      11,      12,      13,      14,      15,      16,      17,      18,      19,      20,      21,      22,      23,      24,      25};
		texts[] = {"Mission Settings", "Random", "Dawn", "Early morning", "Morning", "Noon", "Afternoon", "Evening", "Dusk", "Night", "00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"};
		default = MISCONDITIONS_PARAM_TIME;
	};

	class p_weather {
		title = "Weather";
		values[] = {               10,        9,       2,          3,         4,       5};
		texts[] = {"Mission Settings", "Random", "Clear", "Overcast", "Raining", "Storm"};
		default = MISCONDITIONS_PARAM_WEATHER;
	};

	class p_fog {
		title = "Fog";
		values[] = {               15,       14,       2,      3,          4,           5,             6,              7,           8,            9,        10};
		texts[] = {"Mission Settings", "Random", "Clear", "Mist", "Low/Thin", "Low/Thick", "Medium/Thin", "Medium/Thick", "High/Thin", "High/Thick", "Extreme"};
		default = MISCONDITIONS_PARAM_FOG;
	};

	class p_wind {
		title = "Wind";
		values[] = {               11,       10,      2,       3,        4,        5,         6};
		texts[] = {"Mission Settings", "Random", "None", "Light", "Medium", "Strong", "Extreme"};
		default = MISCONDITIONS_PARAM_WIND;
	};
#endif
