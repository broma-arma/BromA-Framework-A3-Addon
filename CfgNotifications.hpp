#include "\a3\ui_f\hpp\defineCommonColors.inc"
class CfgNotifications {
	class Alert {
		title = "ALERT";
		description = "%1";
		iconPicture = "\A3\ui_f\data\map\markers\military\warning_ca.paa";
		priority = 9;
	};

	class AlertBLU: Alert {
		colorIconPicture[] = Map_BLUFOR_RGBA;
	};

	class AlertOP: Alert {
		colorIconPicture[] = Map_OPFOR_RGBA;
	};

	class AlertIND: Alert {
		colorIconPicture[] = Map_Independent_RGBA;
	};

	class AlertCIV: Alert {
		colorIconPicture[] = Map_Civilian_RGBA;
	};

	class AlertUNK: Alert {
		colorIconPicture[] = Map_Unknown_RGBA;
	};

	class Timer: Alert {
		iconPicture = "\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
	};

	class MissionBegins: Timer {
		title = "MISSION";
		description = "Mission begins in %1.";
		priority = 1;
	};
};
