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
				#include "DiaryTeamRoster.hpp"
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

class RscDisplayGetReady: RscDisplayMainMap {
	class controls {
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
				#include "DiaryTeamRoster.hpp"
			};
		};
		class GPS;
		class Copyright;
		class WalkieTalkie;
		class FadeEffect;
		class ButtonContinue;
		class ButtonCancel;
	};
};

class RscDisplayClientGetReady: RscDisplayGetReady {
	class controls {
		class PlayersTitle;
		class Players;
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
				#include "DiaryTeamRoster.hpp"
			};
		};
		class GPS;
		class Copyright;
		class WalkieTalkie;
		class FadeEffect;
		class ButtonContinue;
		class ButtonCancel;
	};
};

class RscDisplayServerGetReady: RscDisplayGetReady {
	class controls {
		class PlayersTitle;
		class Players;
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
				#include "DiaryTeamRoster.hpp"
			};
		};
		class GPS;
		class Copyright;
		class WalkieTalkie;
		class FadeEffect;
		class ButtonContinue;
		class ButtonCancel;
	};
};
