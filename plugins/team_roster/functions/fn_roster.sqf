disableSerialization;

params ["_mode", "_args"];

switch (_mode) do {
	case "onLoad": {
		_args params ["_control"];

		uiNamespace setVariable ["BRM_FMK_TeamRoster_control", _control];

		// BIS_fnc_onDiaryChanged doesn't work, so we have to do it...
		[_control] spawn {
			disableSerialization;

			params ["_control"];

			// Wait for the DiaryTopicList and DiaryTopicListIndex to init/load.
			waitUntil { !(isNull (ctrlParent _control displayCtrl 1001) || isNull (ctrlParent _control displayCtrl 1002)) };

			private _mapDisplay = ctrlParent _control;
			private _diaryTopicList = _mapDisplay displayCtrl 1001;
			private _diaryTopicListIndex = _mapDisplay displayCtrl 1002;

			RscDiary_menu0Selected = "";
			RscDiary_menu1Selected = "";

			_diaryTopicList ctrlAddEventHandler ["LBSelChanged", {
				params ["_ctrl", "_lbIndex"];

				RscDiary_menu0Selected = _ctrl lbData _lbIndex;
				if (RscDiary_menu0Selected != "Diary") then {
					if (ctrlFade (uiNamespace getVariable "BRM_FMK_TeamRoster_control") < 1) then {
						["Hide"] call BRM_FMK_Plugin_TeamRoster_fnc_roster;
					};
				};
			}];

			_diaryTopicListIndex ctrlAddEventHandler ["LBSelChanged", {
				if (RscDiary_menu0Selected != "Diary") exitWith {};

				params ["_ctrl", "_lbIndex"];

				RscDiary_menu1Selected = _ctrl lnbText [_lbIndex, 0];
				if (RscDiary_menu1Selected == "Team Roster") then {
					if ((ctrlFade (uiNamespace getVariable "BRM_FMK_TeamRoster_control")) > 0) then {
						["Show"] call BRM_FMK_Plugin_TeamRoster_fnc_roster;
					};
				} else {
					if ((ctrlFade (uiNamespace getVariable "BRM_FMK_TeamRoster_control")) < 1) then {
						["Hide"] call BRM_FMK_Plugin_TeamRoster_fnc_roster;
					};
				};
			}];

			addMissionEventHandler ["Map", {
				params ["_opened", "_forced"];

				if (RscDiary_menu0Selected == "Diary" && RscDiary_menu1Selected == "Team Roster") then {
					[["Hide", "Show"] select _opened] call BRM_FMK_Plugin_TeamRoster_fnc_roster;
				};
			}];
		};
	};

	case "Show": {
		private _control = uiNamespace getVariable "BRM_FMK_TeamRoster_control";

		// Show and Update BRM_DiaryTeamRoster
		_control ctrlSetFade 0;
		_control ctrlCommit 0;
		["Update"] call BRM_FMK_Plugin_TeamRoster_fnc_roster;

		// Hide CA_Diary
		private _diaryHtml = ctrlParent _control displayctrl 1003;
		_diaryHtml ctrlSetFade 1;
		_diaryHtml ctrlCommit 0;

		// Spawn updater, if not already running.
		if (isNil "BRM_FMK_TeamRoster_update" || {scriptDone BRM_FMK_TeamRoster_update}) then {
			BRM_FMK_TeamRoster_update = 0 spawn {
				disableSerialization;

				while {visibleMap && !isNull (uiNamespace getVariable ["BRM_FMK_TeamRoster_control", controlNull])} do {
					uiSleep 1;
					["Update"] call BRM_FMK_Plugin_TeamRoster_fnc_roster;
				};
			};
		};
	};

	case "Update": {
		// Update the roster.
		private _control = uiNamespace getVariable "BRM_FMK_TeamRoster_control";
		private _ctrlPos = ctrlPosition _control;

		private _aliasAUTO = ["*", "AUTO", "ANY"];
		private _traits = [
			// getUnitTrait			CfgVehicleIcons		getVariable (ACE3)
			["explosiveSpecialist",	"pictureExplosive",	"ACE_isEOD"],
			["medic",				"pictureHeal",		"ace_medical_medicClass"],
			["engineer",			"pictureRepair",	"ACE_IsEngineer"]
			//["UAVHacker",			"",					""]
		];

		private _roster = "";
		{
			private _groupID = groupID _x;
			if (_groupID != "Dead") then {
				_roster = _roster + format["%1<t font='RobotoCondensedBold' size='1.2'>%2</t><br />", ["", "<br />"] select (_forEachIndex > 0), _groupID];
				{
					private _unit = _x;
					if (_unit call BRM_FMK_fnc_alive) then {
						private _unitInit = _unit getVariable ["unitInit", ["MAIN", "*", "*", "*"]];

						private _pad = ["    ", "  "] select isFormationLeader _unit;

						private _rank = "<img image='" + getText (configFile >> "CfgRanks" >> (str rankId _unit) >> "texture") + "' /> ";

						private _name = name _unit;

						private _role = _unitInit select 2;
						if (toUpper _role in _aliasAUTO) then {
							_role = getText (configOf _unit >> "displayName");
						};

						private _icons = "";
						{
							_x params ["_trait", "_icon", "_var"];

							private _value = _unit getVariable [_var, _unit getUnitTrait _trait];
							if (_value isEqualType 0) then { _value = _value > 0; };
							if (_value) then {
								_icons = _icons + format [" <img image='%1' />", getText (configfile >> "CfgVehicleIcons" >> _icon)];
							};
						} forEach _traits;

						private _color = [_unitInit select 0] call BRM_FMK_fnc_colorToHex;

						_roster = _roster + format ["%1%2<t color='%6'>%3</t> - %4%5<br />", _pad, _rank, _name, _role, _icons, _color];
					};
				} forEach units _x;
			};
		} forEach (allGroups select { side _x == side group player && (!isMultiplayer || {{ isPlayer _x } count units _x > 0}) });

		_control ctrlSetStructuredText parseText _roster;

		// Resize BRM_DiaryTeamRoster
		private _controlTextHeight = ctrlTextHeight _control;
		if (_controlTextHeight != _ctrlPos select 3) then {
			_ctrlPos set [3, _controlTextHeight];
			_control ctrlSetPosition _ctrlPos;
			_control ctrlCommit 0;
		};
	};

	case "Hide": {
		private _control = uiNamespace getVariable "BRM_FMK_TeamRoster_control";

		// Show CA_Diary
		private _diaryHtml = ctrlParent _control displayctrl 1003;
		_diaryHtml ctrlSetFade 0;
		_diaryHtml ctrlCommit 0;

		// Resize and hide BRM_DiaryTeamRoster
		private _ctrlPos = ctrlPosition _control;
		_ctrlPos set [3, 0];
		_control ctrlSetPosition _ctrlPos;
		_control ctrlSetFade 1;
		_control ctrlCommit 0;

		if !(isNil "BRM_FMK_TeamRoster_update" || {scriptDone BRM_FMK_TeamRoster_update}) then {
			terminate BRM_FMK_TeamRoster_update;
		};
	};

	case "onUnload": {
		uiNamespace setVariable ["BRM_FMK_TeamRoster_control", nil];
	};
};
