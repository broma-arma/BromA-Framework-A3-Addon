class BRM_FMK_Endings {
	class victory { // Win in a COOP mission.
		winners[] = {"a"};
		losers[] = {"b", "c"};
		title = "Mission completed!";
		reason = "%1 have completed all their objectives!";
	};

	class defeat: victory { // Lose in a COOP mission.
		winners[] = {"b", "c"};
		losers[] = {"a"};
		title = "Mission failed.";
		reason = "%2 failed the mission.";
	};

	class tvt_end: victory { // Generic win/lose in a TVT mission. Winner is determined from the amount of kills.
		winners[] = {};
		losers[] = {};
		title = "A team has been defeated.";
		reason = "%1 achieved %3 victory over %2.";
	};

	class side_a_victory: victory { // SIDE_A win in a TVT mission.
		winners[] = {"a"};
		losers[] = {"b", "c"};
		title = "Mission over.";
		reason = "%1 won the mission and defeated %2.";
	};

	class side_b_victory: side_a_victory { // SIDE_B win in a TVT mission.
		winners[] = {"b"};
		losers[] = {"a", "c"};
	};

	class side_c_victory: side_a_victory { // SIDE_C win in a TVT mission.
		winners[] = {"c"};
		losers[] = {"b", "a"};
	};

	class side_a_defeat: defeat { // SIDE_A lose in a TVT mission.
		winners[] = {"b", "c"};
		losers[] = {"a"};
		title = "Mission over.";
		reason = "%2 failed their objectives.";
	};

	class side_b_defeat: side_a_defeat { // SIDE_B lose in a TVT mission.
		winners[] = {"a", "c"};
		losers[] = {"b"};
	};

	class side_c_defeat: side_a_defeat { // SIDE_C lose in a TVT mission.
		winners[] = {"b", "a"};
		losers[] = {"c"};
	};
};
