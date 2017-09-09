
private _allowedClasses = [
    "co", "sl", "ftl", "rifleman", "at", "marksman", "ar", "asstar", "medic", "grenadier",
    "helipilot", "helicrew", "engineer", "crew", "pilot", "RTO", "reconleader", "recon", "recondemo",
    "reconmedic", "demo", "hmg", "uav", "hmgtripod", "attripod", "mortar", "mortarasst", "hat",
    "hatast", "sniper", "spotter", "mmg", "mmgasst"
];
_allowedClasses = [_allowedClasses, { toLower(_x) }, false] call CBA_fnc_filter;