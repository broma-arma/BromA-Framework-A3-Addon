class BRM_FMK_Endings {
	class victory: { // Win in a COOP mission.
		winners[] = {"a"};
		losers[] = {"b", "c"};
		title = "Mission completed!";
		reason = "%1 have completed all their objectives!";
	};

	class defeat: { // Lose in a COOP mission.
		winningSides[] = {"b", "c"};
		losingSides[] = {"a"};
		title = "Mission failed.";
		reason = "%2 failed the mission.";
	};

	class tvt_end: { // Generic win/lose in a TVT mission. Winner is determined from the amount of kills.
		winningSides[] = {};
		losingSides[] = {};
		title = "A team has been defeated.";
		reason = "%1 achieved %3 victory over %2.";
	};

	class side_a_victory: { // SIDE_A win in a TVT mission.
		winningSides[] = {"a"};
		losingSides[] = {"b", "c"};
		title = "Mission over.";
		reason = "%1 won the mission and defeated %2.";
	};

	class side_b_victory: side_a_victory { // SIDE_B win in a TVT mission.
		winningSides[] = {"b"};
		losingSides[] = {"a", "c"};
	};

	class side_c_victory: side_a_victory { // SIDE_C win in a TVT mission.
		winningSides[] = {"c"};
		losingSides[] = {"b", "a"};
	};

	class side_a_defeat: { // SIDE_A lose in a TVT mission.
		winningSides[] = {"b", "c"};
		losingSides[] = {"a"};
		title = "Mission over.";
		reason = "%2 failed their objectives.";
	};

	class side_b_defeat: side_a_defeat { // SIDE_B lose in a TVT mission.
		winningSides[] = {"a", "c"};
		losingSides[] = {"b"};
	};

	class side_c_defeat: side_a_defeat { // SIDE_C lose in a TVT mission.
		winningSides[] = {"b", "a"};
		losingSides[] = {"c"};
	};
};
