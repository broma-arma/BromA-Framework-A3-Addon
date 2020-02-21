// Strings are case-sensitive and should be lowercase

#define IGNORED_WORDS [\
	"hey", "please", "a", "an",\
	"with",\
	"also", "and",\
	"but", "however",\
	"of",\
	"amounts", "amount",\
	"named", "called",\
	"respawns", "respawn", "reinforcements",\
	"supporting", "assisting", "helping",\
	"in", "on",\
	"network", "id"\
]

#define ALIAS_RANDOM(val) val in ["whatever", "anything", "random"]

#define CASE_BLUFOR "blufor"; case "west"
#define CASE_OPFOR "opfor"; case "redfor"; case "east"
#define CASE_INDFOR "independent"; case "resistance"; case "indfor"; case "guerilla"; case "guer"
#define CASE_CIVILIAN "civilian"; case "civilians"; case "civies"; case "civ"

#define CASE_SKILL_EASY "easy"; case "rookie"; case "amateur"; case "novice"; case "stupid"; case "dumb"
#define CASE_SKILL_NORMAL "normal"; case "average"; case "decent"; case "trained"
#define CASE_SKILL_STEALTH "stealth"; case "stealthy"; case "silent"; case "cowardly"
#define CASE_SKILL_HARD "hard"; case "elite"; case "professional"; case "smart"

#define CASE_GROUP_SIZE_1 "group"; case "groups"; case "unit"; case "units"; case "team"; case "teams"
#define CASE_GROUP_SIZE_2 "fire-team"; case "fire-teams"
#define CASE_GROUP_SIZE_3 "section"; case "sections"
#define CASE_GROUP_SIZE_4 "squad"; case "squads"

#define CASE_INFANTRY "infantry"; case "units"; case "soldiers"
#define CASE_VEHICLES "vehicles"; case "technicals"; case "lavs"
#define CASE_TANKS "tanks"; case "armor"
#define CASE_AIRCRAFTS "aircrafts"; case "helicopters"
#define CASE_ALL "all"; case "both"; case "combined-arms"; case "everything"
