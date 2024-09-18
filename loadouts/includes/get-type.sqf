// File is included in mission framework
_type = getText (configOf _unit >> "displayName");

if (count _this > 2) then {
	private _displayName = [[
		//alias           display name
		["co",            "Officer"],
		["sl",            "Squad Leader"],
		["ftl",           "Team Leader"],
		["rifleman",      "Rifleman"],
		["at",            "Rifleman (AT)"],
		["marksman",      "Marksman"],
		["ar",            "Autorifleman"],
		["asstar",        "Asst. Autorifleman"],
		["medic",         "Combat Life Saver"],
		["grenadier",     "Grenadier"],
		["helipilot",     "Helicopter Pilot"],
		["helicrew",      "Helicopter Crew"],
		["engineer",      "Engineer"],
		["crew",          "Crewman"],
		["driver",        "Crewman"],
		["gunner",        "Crewman"],
		["commander",     "Crewman"],
		["loader",        "Crewman"],
		["pilot",         "Pilot"],
		["rto",           "JTAC"],
		["reconleader",   "Recon Team Leader"],
		["recon",         "Recon Scout"],
		["recondemo",     "Recon Demo Specialist"],
		["reconmedic",    "Recon Paramedic"],
		["reconat",       "Recon Scout (AT)"],
		["reconmarksman", "Recon Marksman"],
		["demo",          "Explosive Specialist"],
		["hmg",           "Gunner (HMG)"],
		["staticat",      "Gunner (AT)"],
		["uav",           "UAV Operator"],
		["hmgtripod",     "Asst. Gunner (HMG/GMG)"],
		["attripod",      "Asst. Gunner (AT)"],
		["mortar",        "Gunner (Mk6)"],
		["mortarasst",    "Asst. Gunner (Mk6)"],
		["hat",           "Missile Specialist (AT)"],
		["hatasst",       "Asst. Missile Specialist (AT)"],
		["haa",           "Missile Specialist (AA)"],
		["haaasst",       "Asst. Missile Specialist (AA)"],
		["sniper",        "Sniper"],
		["spotter",       "Spotter"],
		["mmg",           "Heavy Gunner"],
		["mmgasst",       "Ammo Bearer"],
		["reporter",      "Reporter"],
		["cameraman",     "Cameraman"]
	], _this select 2] call BIS_fnc_getFromPairs;

	if (!isNil "_displayName") then {
		_type = _displayName;

		private _unitInit = _unit getVariable ["unitInit", ["MAIN", "*", "*", "*"]];
		_unitInit set [2, _type];
		_unit setVariable ["unitInit", _unitInit, true];
	};
};
