class RscStructuredText;

class RscDisplayMainMap {
	class controls {
		// Note: Experienced issues with the CA_DiaryGroup changing Z-order, so include all controls to prevent it.
		class BriefingIntroBackgroundLayer;
		class BriefingIntroGraphicsLayer;
		class BriefingIntroVideoLayer;
		class Tooltip;
		class CA_MouseOver;
		class CA_MainBackground;
		class CA_MainBackgroundGradient;
		class CA_TopicsBackground;
		class CA_SubTopicsBackground;
		class CA_ContentBackgroundd;
		class ButtonBack;
		class CA_MissionName;
		class TopRight;
		class ButtonTexturesReal;
		class DiaryList;
		class CA_DiaryIndex;
		class ButtonPlayers;
		class SortPlayers;
		class MuteAll;
		class CA_DiaryGroup {
			class controls {
				class CA_Diary;
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
			};
		};
		class GPS;
		class FadeEffect;
		class RespawnControlsGroup;
		class RespawnDetailsControlsGroup;
		class HC_tooltip_back;
		class HC_tooltip_text;
	};
};
