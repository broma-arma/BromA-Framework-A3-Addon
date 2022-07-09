class CfgNotifications {
	class Alert {
		title = "ALERT";
		description = "%1";
		iconPicture="\A3\ui_f\data\map\markers\military\warning_ca.paa";
		duration = 3;
		priority = 9;
	};

	class AlertBLU: Alert {
		color[] = {0.2, 0.2, 0.6, 1};
	};

	class AlertOP: Alert {
		color[] = {0.6, 0.2, 0.2, 1};
	};

	class AlertIND: Alert {
		color[] = {0.2, 0.6, 0.2, 1};
	};

	class Timer: Alert {
		iconPicture="\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
	};

	class MissionBegins: Timer {
		title = "MISSION";
		description = "Mission begins in %1.";
		priority = 1;
	};
};
