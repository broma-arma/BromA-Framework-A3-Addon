class api {
	file = "\broma_framework\engine\api";
	class reachTarget{};
	class artillery{};
	class cas{};
	class halo{};
	class paratroop{};
};

class api_ai {
	file = "\broma_framework\engine\api\ai";
	class garrisonUnits{};
};

class api_arrays {
	file = "\broma_framework\engine\api\arrays";
	class verboseArray{};
	class appendIndices{};
};

class api_deprecated {
	file = "\broma_framework\engine\api\deprecated";
	class getUnitsArray{};
	class getFactionVehicles{};
	class setVehiclesArray{};
};

class api_faction {
	file = "\broma_framework\engine\api\faction";
	class getFactionInfo {};
};

class api_markers {
	file = "\broma_framework\engine\api\markers";
	class newMarker{};
	class newMarkerArea{};
	class newMarkerIcon{};
};

class api_sides {
	file = "\broma_framework\engine\api\sides";
	class getSideInfo {};
	class checkCasualties{};
};

class api_sounds {
	file = "\broma_framework\engine\api\sounds";
	class playGlobal{};
	class playCfgSound{};
};

class api_strings {
	file = "\broma_framework\engine\api\strings";
	class formatElapsedTime {};
};

class api_triggers {
	file = "\broma_framework\engine\api\triggers";
	class callCodeArea{};
};

class api_ui {
	file = "\broma_framework\engine\api\ui";
	class showText{};
	class colorToHex{};
};

class api_unit {
	file = "\broma_framework\engine\api\unit";
	class alive{};
	class unitFromName{};
};

class api_weapons {
	file = "\broma_framework\engine\api\weapons";
	class weaponAway{};
	class isDisposableLauncher{};
};

class api_zeus {
	file = "\broma_framework\engine\api\zeus";
	class z_setAll{};
	class z_setMode{};
	class z_setSkill{};
	class z_setLoadout{};
};
