if (!mission_KAT_enabled) exitWith {};

private _medicalItems = createHashMap;
private _fnc_isMedicalItem = "getNumber (_x >> ""ACE_isMedicalItem"") isEqualTo 1";
{
	_medicalItems set [configName _x, _x];
} forEach (_fnc_isMedicalItem configClasses (configFile >> "CfgWeapons"));
{
	_medicalItems set [configName _x, _x];
} forEach (_fnc_isMedicalItem configClasses (configFile >> "CfgMagazines"));

// Exclude disabled addon items
private _excludeItems = [];
{
	private _sourceAddon = configSourceAddonList _y param [0, ""];
	if (_sourceAddon != "" && { !(missionNamespace getVariable [format ["%1_%2", _sourceAddon, ["enable", "hypothermiaActive"] select (_sourceAddon == "kat_hypothermia")], true]) }) then {
		_excludeItems pushBack _x;
	};
} forEach _medicalItems;

private _countOverrides = createHashMap;
if (ace_medical_treatment_consumePAK == /*No*/0) then {
	_countOverrides set ["ACE_personalAidKit", 1];
};
if (ace_medical_treatment_consumeSurgicalKit != /*Surgical Kit*/1) then {
	_countOverrides set ["ACE_surgicalKit", 1];
};
if (ace_medical_treatment_consumeSurgicalKit != /*Suture*/2) then {
	_countOverrides set ["ACE_suture", 0];
};
if (kat_airway_ReusableAirwayItems) then {
	_countOverrides set ["kat_larynx", 1];
	_countOverrides set ["kat_guedel", 1];
};
if (kat_pharma_IVreuse) then {
	_countOverrides set ["kat_IO_FAST", 1];
	_countOverrides set ["kat_IV_16", 1];
};
if (!kat_breathing_advPtxEnable) then {
	_countOverrides set ["kat_aatKit", 0];
};

{
	{
		/*_x = [['ACE_packingBandage', 5], ['ACE_quikclot', 5]];*/
		for "_i" from count _x - 1 to 0 step -1 do {
			private _item = _x select _i;
			_item params ["_name", "_count"];
			if (_name in _excludeItems) then {
				_x deleteAt _i;
			} else {
				if (_name in _countOverrides) then {
					_item set [1, _countOverrides get _name];
				}
			};
		};
	} forEach _x;
} forEach [kat_misc_IFAKContents, kat_misc_AFAKContents, kat_misc_MFAKContents];
