class CfgDebriefing {
	class custom {
		title = "MISSION OVER";
		subtitle = "";
		description = "Thank you for playing.<br/><br/>Made with the BromA Framework.";
		picture = "\broma_framework\assets\images\group-logo.paa";
	};

	class victory: custom {
		title = "MISSION COMPLETED";
		subtitle = "All objectives accomplished - good job.";
	};

	class defeat: custom {
		title = "MISSION FAILED";
		subtitle = "You have failed your objectives.";
	};

	class tvt_end: custom {
		subtitle = "A team is no longer combat effective.";
	};
};
