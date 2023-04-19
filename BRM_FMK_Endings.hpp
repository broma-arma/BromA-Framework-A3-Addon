class GVARMAIN(Endings) {
	class Default {
		winners[] = {"a", "b", "c"};
		losers[] = {"a", "b", "c"};
		title = "The mission is over, maybe?";
		reason = "%1 defeated %2.";

		class Debriefing {
			title = "MISSION OVER";
			subtitle = "";
			description = "Thank you for playing.<br/><br/>Made with the BromA Framework.";
			picture = "\broma_framework\assets\images\group-logo.paa";
		};
	};

	// Win in a COOP mission.
	class victory: Default {
		winners[] = {"a"};
		losers[] = {"b", "c"};
		title = "Mission completed!";
		reason = "%1 have completed all their objectives!";

		class Debriefing: Debriefing {
			title = "MISSION COMPLETED";
			subtitle = "All objectives accomplished - good job.";
		};
	};

	// Lose in a COOP mission.
	class defeat: Default {
		winners[] = {"b", "c"};
		losers[] = {"a"};
		title = "Mission failed.";
		reason = "%2 failed the mission.";

		class Debriefing: Debriefing {
			title = "MISSION FAILED";
			subtitle = "You have failed your objectives.";
		};
	};

	// Generic win/lose in a TVT mission. Winner is determined from the amount of kills.
	class tvt_end: Default {
		winners[] = {};
		losers[] = {};
		title = "A team has been defeated.";
		reason = "%1 achieved %3 victory over %2.";

		class Debriefing: Debriefing {
			subtitle = "A team is no longer combat effective.";
		};
	};

	// SIDE_A win in a TVT mission.
	class side_a_victory: Default {
		winners[] = {"a"};
		losers[] = {"b", "c"};
		title = "Mission over.";
		reason = "%1 won the mission and defeated %2.";
	};

	// SIDE_B win in a TVT mission.
	class side_b_victory: side_a_victory {
		winners[] = {"b"};
		losers[] = {"a", "c"};
	};

	// SIDE_C win in a TVT mission.
	class side_c_victory: side_a_victory {
		winners[] = {"c"};
		losers[] = {"b", "a"};
	};

	// SIDE_A lose in a TVT mission.
	class side_a_defeat: Default {
		winners[] = {"b", "c"};
		losers[] = {"a"};
		title = "Mission over.";
		reason = "%2 failed their objectives.";
	};

	// SIDE_B lose in a TVT mission.
	class side_b_defeat: side_a_defeat {
		winners[] = {"a", "c"};
		losers[] = {"b"};
	};

	// SIDE_C lose in a TVT mission.
	class side_c_defeat: side_a_defeat {
		winners[] = {"b", "a"};
		losers[] = {"c"};
	};
};
