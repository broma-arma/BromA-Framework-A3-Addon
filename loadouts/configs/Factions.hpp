#define QUOTE(VAR) #VAR
#define FACTION_ID(ID,FILE) ID = QUOTE(\broma_framework\loadouts\factions\FILE.sqf)
#define FACTION(FILE) FACTION_ID(FILE,FILE)
#define FACTION_MOD(ID,PARENT,FILE) ID[] = {QUOTE(PARENT), QUOTE(\broma_framework\loadouts\factions\FILE.sqf)}
class Factions {
	FACTION_ID(default,template);

	FACTION(aaf);
	FACTION(csat);
	FACTION(fia);
	FACTION(ldf);
	FACTION(nato);
	FACTION(natop);
	FACTION(sprg);

	FACTION(afghanistan);
	FACTION(afrenian);
	FACTION(african_army);
	FACTION(african_rebels);
	FACTION(anzac);
	FACTION(baf);
	FACTION(caf);
	FACTION(cdf);
	FACTION(chedaki);
	FACTION(estonia);
	FACTION(finland);
	FACTION(france);
	FACTION(german);
	FACTION(india);
	FACTION(ionpmc);
	FACTION(isis);
	FACTION(jsdf);
	FACTION(lingor_army);
	FACTION(lingor_rebels);
	FACTION(marines);
	FACTION(mec);
	FACTION(napa);
	FACTION(norway);
	FACTION(ofpfia);
	FACTION(pakistan);
	FACTION(pla);
	FACTION(poland);
	FACTION(portugal);
	FACTION(racs);
	FACTION(roka);
	FACTION(russia);
	FACTION(sla);
	FACTION(slovenia);
	FACTION(soviets);
	FACTION(sweden);
	FACTION(tkarmy);
	FACTION(tkmilitia);
	FACTION(ukraine);
	FACTION(un);
	FACTION(usarmy);
	FACTION(usarmy80);
	FACTION(usfs);
	FACTION(yugo);
};
