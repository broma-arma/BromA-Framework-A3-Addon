#define QUOTE(VAR) #VAR
#define STRUCTURE_ID(ID,FILE) ID = QUOTE(\broma_framework\loadouts\factions\structures\FILE.sqf)
#define STRUCTURE(FILE) STRUCTURE_ID(FILE,FILE)
#define DEPRECATED_STRUCTURE(DEP,ID) DEP[] = {#ID}
class Structures {
	STRUCTURE_ID(default,high);

	STRUCTURE(high);
	STRUCTURE(mid);
	STRUCTURE(low);
	STRUCTURE(france);
	STRUCTURE(us);

	DEPRECATED_STRUCTURE(high_tier,high);
	DEPRECATED_STRUCTURE(mid_tier,mid);
	DEPRECATED_STRUCTURE(low_tier,low);
	DEPRECATED_STRUCTURE(france_structure,france);
	DEPRECATED_STRUCTURE(us_structure,us);
};
