class BRM_FMK_Round_System {
	class init {
		file = "\broma_framework\plugins\round_system\functions";
		class preInit {};
		class setParams {};
		class postInit {};
	};
	
	class general {
		file = "\broma_framework\plugins\round_system\functions";
		class beginMatch {};
	};
	
	class server {
		file = "\broma_framework\plugins\round_system\functions\server";
		class roundEnd {};
		class roundHandleResults {};
		class resetRoundVariables {};
		class roundStart {};
		class checkRoundEnd {};
		class setMatchVariables {};
		class CasualtiesCapCheck {};			
	};
	
	class player {
		file = "\broma_framework\plugins\round_system\functions\player";
		class roundEndPlayer {};
		class roundStartPlayer {};
		class displayWinner {};
		class moveToRespawn {};
		class registerZone {};
		class setupZone {};
	};
}; 