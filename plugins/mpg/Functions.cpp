class BRM_FMK_MPGarage {
	class general {
		file = "\broma_framework\plugins\mpg\functions";
		class open {};

		class loadLeftContent {};

		class loadRightContent {};

		class getPylons {};
		class setPylonLoadout {};
	};
	class eventHandlers {
		file = "\broma_framework\plugins\mpg\functions\events";

		class onGarageEvent {};

		class onLeftTabSelect {};
		class onRightTabSelect {};

		class onLeftListSelected {};
		class onLeftSortChanged {};
		class onRightListSelected {};

		class onSearch {};

		class onMenuBar {};

		class onPylonConfigChanged {};

		class onSavesEvent {};
	};
};
