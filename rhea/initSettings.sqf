["nfe_rhea_password", "EDITBOX", ["Password", "Password to login\nEmpty disables logging in with a password"], "Rhea", ["rhea", true], 1] call CBA_fnc_addSetting;
["nfe_rhea_autoSteam", "EDITBOX", ["Auto-allow steamID64s", "SteamID64s of players that can login without a password, comma seperated"], "Rhea", ["", true, {
	_this splitString "," apply { [_x] call CBA_fnc_trim } select { _x != "" } joinString ","
}], 1] call CBA_fnc_addSetting;
["nfe_rhea_autoLoggedAdmins", "CHECKBOX", ["Auto-allow logged-in admins", "Logged in admins can login without a password?"], "Rhea", false, 1] call CBA_fnc_addSetting;
["nfe_rhea_autoVotedAdmins", "CHECKBOX", ["Auto-allow voted-in admins", "Voted in admins can login without a password?"], "Rhea", false, 1] call CBA_fnc_addSetting;
["nfe_rhea_zeusCount", "SLIDER", ["Zeus slots", "Max number of consecutive Zeuses"], "Rhea", [0, 10, 5, -1], 1, nil, true] call CBA_fnc_addSetting;
