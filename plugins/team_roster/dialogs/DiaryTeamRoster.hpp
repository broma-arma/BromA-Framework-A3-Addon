class BRM_DiaryTeamRoster: RscStructuredText {
	idc = -1;
	onLoad = "['onLoad', _this] call BRM_FMK_TeamRoster_fnc_roster;";
	onUnload = "['onUnload', _this] call BRM_FMK_TeamRoster_fnc_roster;";
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "20.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = 0;
	size = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	shadow = 0;
	fade = 1;
	text = "Team Roster failed to load.";
	class Attributes {
		font = "RobotoCondensed";
		colorLink = "#FFB84D";
		shadow = 0;
		size = 1;
	};
};
