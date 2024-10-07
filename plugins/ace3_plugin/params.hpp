#ifdef BRM_PARAMS_PLAYER
	#ifndef ACE3_PARAM_LIVES
	#define ACE3_PARAM_LIVES 3
	#endif
	#ifndef ACE3_PARAM_MEDICS
	#define ACE3_PARAM_MEDICS 0
	#endif

	class p_ace3_second_chances {
		title = "Second chances";
		values[] = {        0,   1,   3,   5,         -1};
		texts[] = {"Disabled", "1", "3", "5", "Infinite"};
		default = ACE3_PARAM_LIVES;
	};

	class p_ace3_everyone_medic {
		title = "Everyone medic";
		values[] = {        0,         1};
		texts[] = {"Disabled", "Enabled"};
		default = ACE3_PARAM_MEDICS;
	};
#endif
