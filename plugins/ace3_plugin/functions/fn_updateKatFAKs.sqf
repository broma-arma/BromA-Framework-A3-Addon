// BRM_FMK_Plugin_ACE3_fnc_updateKatFAKs
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
		_excludeItems pushBack toLowerANSI _x;
	};
} forEach _medicalItems;

private _countOverrides = createHashMap;
_countOverrides set ["ace_surgicalkit", [0, [1, 5] select (ace_medical_treatment_consumeSurgicalKit == 1)] select (ace_medical_treatment_advancedBandages == 2)]; // Surgical Kit, Can Reopen
if (ace_medical_treatment_consumeSurgicalKit != 2) then { // Suture
	_countOverrides set ["ace_suture", 0];
};
if (ace_medical_treatment_consumePAK == 1) then { // Yes
	_countOverrides set ["ace_personalaidkit", 5];
};
if (ace_medical_fractures == 0) then {
	_countOverrides set ["ace_splint", 0];
};
if (!kat_airway_ReusableAirwayItems) then {
	_countOverrides set ["kat_larynx", { _this * 2 }];
	_countOverrides set ["kat_guedel", { _this * 2 }];
};
if (!kat_pharma_IVreuse) then {
	_countOverrides set ["kat_io_fast", { _this * 2 }];
	_countOverrides set ["kat_iv_16", { _this * 2 }];
};
if (!kat_breathing_advPtxEnable) then {
	_countOverrides set ["kat_aatkit", 0];
	_countOverrides set ["kat_ncdkit", 0];
};

private _replaceItems = createHashMap;
if (ace_medical_treatment_advancedBandages == 0) then { // Disabled
	_replaceItems set ["ace_packingbandage", "ACE_fieldDressing"];
	_replaceItems set ["ace_elasticbandage", "ACE_fieldDressing"];
	_replaceItems set ["ace_quikclot", "ACE_fieldDressing"];
};

{
	{
		for "_i" from count _x - 1 to 0 step -1 do {
			private _item = _x select _i;
			_item params ["_name", "_count"];
			_name = toLowerANSI _name;
			if (_name in _excludeItems) then {
				_x deleteAt _i;
			} else {
				private _override = _countOverrides get _name;
				if (!isNil "_override") then {
					if (_override isEqualType {}) then {
						_override = _count call _override;
					};
					if (_override == 0) then {
						_x deleteAt _i;
					} else {
						_item set [1, _override];
					};
				};
				private _replace = _replaceItems get _name;
				if (!isNil "_replace") then {
					_item set [0, _replace];
				};
			};
		};
	} forEach _x;
} forEach [kat_misc_IFAKContents, kat_misc_AFAKContents, kat_misc_MFAKContents];
