if (!is3DEN) exitWith {
	["Function must be called in 3DEN editor."] call BIS_fnc_error;
};

#include "\a3\3DEN\UI\dikcodes.inc"

#define POS [1000, 1000, 10000]
#define CAM_POS [995.165, 997.905, 10002.5]

#define IDC_LEFTPANELBACKGROUND 1000
#define IDC_MOUSEAREA 1001
#define IDC_TITLE 1002
#define IDC_FACTIONLISTTITLE 1003
#define IDC_FACTIONLIST 1004
#define IDC_CAMOLISTTITLE 1005
#define IDC_CAMOLIST 1006
#define IDC_BUTTONSTRUCTURE 1007
#define IDC_BUTTONMOD 1008
#define IDC_INFOBOX 1009
#define IDC_LAST IDC_INFOBOX

#define IDC_INFOBOX_INFONAME 1100

params [["_mode", "", [""]], ["_params", []]];

_this = _params;

private _display = uiNamespace getVariable ["BRM_FMK_3DEN_fnc_loadoutViewer_display", displayNull];

switch (_mode) do {
	case "": {
		if (isNull _display) then {
			(if (is3DEN) then {
				findDisplay getNumber (configFile >> "Display3DEN" >> "idd")
			} else {
				[] call BIS_fnc_displayMission
			}) createDisplay "BRM_FMK_3DEN_DisplayLoadoutViewer";
		};
	};
	case "onLoad": {
		params ["_display"];

		if (is3DEN) then {
			BRM_FMK_Engine_initialized = true; BRM_FMK_Engine_compatVersion = 1; // Trick framework into allowing assignLoadout to be called
			["showInterface", false] call BIS_fnc_3DENInterface;
		};
		uiNamespace setVariable ["BRM_FMK_3DEN_fnc_loadoutViewer_display", _display];

		_display setVariable ["viewDistance", viewDistance];
		setViewDistance 1;
		private _camera = "CamCurator" camCreate ASLToAGL CAM_POS;
		_camera setVectorDirAndUp [[0.563808, 0.655341, -0.502652], [0.327821, 0.381042, 0.864487]];
		_camera cameraEffect ["Internal", "BACK"];
		_camera camCommand "maxPitch 89";
		_camera camCommand "minPitch -89";
		_camera camCommand "speedDefault 0.05";
		_camera camCommand "speedMax 1";
		_camera camCommand "ceilingHeight 10050";
		_camera camCommand "atl off";
		_camera camCommand "surfaceSpeed off";
		_display setVariable ["camera", _camera];

		private _ctrlFactionList = _display displayCtrl IDC_FACTIONLIST;
		{
			private _configName = configName _x;
			_ctrlFactionList lbSetValue [_ctrlFactionList lbAdd toUpper _configName, parseNumber (_configName == "default")];
		} forEach configProperties [configFile >> "BRM_FMK" >> "Factions", "true", true];
		_ctrlFactionList lbSortBy ["VALUE", false, false, false, true];

		_display setVariable ["ehDraw3D", addMissionEventHandler ["Draw3D", { ["Draw3D", _this] call BRM_FMK_3DEN_fnc_loadoutViewer }]];

		private _units = [];
		_display setVariable ["units", _units];
		private _pos = POS vectorAdd [-9 / 2, 0, 0];
		{
			private _posXOffset = _forEachIndex;
			{
				private _posYOffset = _forEachIndex;

				_x params ["_type", "_label", ["_role", "*"]];
				private _unitPos = _pos vectorAdd [_posXOffset, _posYOffset];
				private _unit = createVehicleLocal [_type, _unitPos, [], 0, "CAN_COLLIDE"];
				_units pushBack _unit;
				_unit setVariable ["label", _label];
				_unit setVariable ["role", _role];
				_unit setPosASL _unitPos;
				_unit setDir 180;
				_unit enableSimulation false;
			} forEach _x;
		} forEach [
			[
				["B_officer_F", "Officer"],
				["B_Soldier_SL_F", "Squad Leader"],
				["B_Soldier_TL_F", "Team Leader"]
			],
			[
				["B_recon_JTAC_F", "Recon JTAC"],
				["B_medic_F", "Combat Life Saver"],
				["B_soldier_UAV_F", "UAV Operator"]
			],
			[
				["B_Soldier_F", "Rifleman"],
				["B_soldier_LAT_F", "Rifleman (AT)"],
				["B_soldier_M_F", "Marksman"], //["B_Sharpshooter_F", "Sharpshooter"],
				["B_Soldier_GL_F", "Grenadier"],
				["B_soldier_AR_F", "Autorifleman"],
				["B_soldier_AAR_F", "Asst. Autorifleman"]
			],
			[
				["B_recon_TL_F", "Recon Team Leader"],
				["B_recon_medic_F", "Recon Paramedic"],
				["B_recon_F", "Recon Scout"],
				["B_recon_LAT_F", "Recon Scout (AT)"],
				["B_recon_M_F", "Recon Marksman"],
				["B_recon_exp_F", "Recon Demo Specialist"]
			],
			[
				["B_soldier_AT_F", "Missile Specialist (AT)"],
				["B_soldier_AAT_F", "Asst. Missile Specialist (AT)"],
				["B_soldier_AA_F", "Missile Specialist (AA)"],
				["B_soldier_AAA_F", "Asst. Missile Specialist (AA)"]
			],
			[
				["B_support_MG_F", "Gunner (HMG)"],
				["B_support_AMG_F", "Asst. Gunner (HMG/GMG)"],
				["B_support_Mort_F", "Gunner (Mk6)"],
				["B_support_AMort_F", "Asst. Gunner (Mk6)"],
				["B_Soldier_F", "Gunner (AT)", "staticat"],
				["B_Soldier_F", "Asst. Gunner (AT)", "attripod"]
			],
			[
				["B_sniper_F", "Sniper"],
				["B_spotter_F", "Spotter"]
			],
			[
				["B_HeavyGunner_F", "Heavy Gunner"],
				["B_Soldier_A_F", "Ammo Bearer"]
			],
			[
				["B_engineer_F", "Engineer"], //["B_soldier_repair_F", "Repair Specialist"],
				["B_soldier_exp_F", "Explosive Specialist"]
			],
			[
				["B_crew_F", "Crewman"],
				["B_Helipilot_F", "Helicopter Pilot"],
				["B_helicrew_F", "Helicopter Crew"],
				["B_Pilot_F", "Pilot"]
			]
		];
	};
	case "onUnload": {
		{ deleteVehicle _x } forEach (_display getVariable "units");

		removeMissionEventHandler ["Draw3D", _display getVariable "ehDraw3D"];

		setViewDistance (_display getVariable "viewDistance");
		private _camera = _display getVariable "camera";
		_camera cameraEffect ["Terminate", "BACK"];
		camDestroy _camera;

		if (is3DEN) then {
			BRM_FMK_Engine_initialized = nil; BRM_FMK_Engine_compatVersion = nil;
			get3DENCamera cameraEffect ["Internal", "BACK"];
			["showInterface", true] call BIS_fnc_3DENInterface;
		};
		uiNamespace setVariable ["BRM_FMK_3DEN_fnc_loadoutViewer_display", nil];
	};
	case "onLoadStructure": {
		params ["_dialog"];

		_dialog displayCtrl 1000 ctrlSetText (_display getVariable ["structureString", ""]);
	};
	case "onUnloadStructure": {
		params ["_dialog", "_exitCode"];

		if (_exitCode == 1) then {
			private _code = ctrlText (_dialog displayCtrl 1000);
			_display setVariable ["structureString", _code];
			_code = _code call BRM_FMK_3DEN_fnc_preprocessStringComments;
			_display setVariable ["structureCode", if (trim _code != "") then { compile _code } else { nil }];

			private _ctrlFactionList = _display displayCtrl IDC_FACTIONLIST;
			private _curSel = lbCurSel _ctrlFactionList;
			if (_curSel != -1) then {
				private _faction = _ctrlFactionList lbText _curSel;

				private _ctrlCamoList = _display displayCtrl IDC_CAMOLIST;
				_curSel = lbCurSel _ctrlCamoList;
				if (_curSel != -1) then {
					private _camo = if (_curSel > 0) then { _ctrlCamoList lbText _curSel } else { "" };
					["assignLoadout", [_faction, _camo]] call BRM_FMK_3DEN_fnc_loadoutViewer;
				};
			};
		};
	};
	case "onLoadMod": {
		params ["_dialog"];

		_dialog displayCtrl 1000 ctrlSetText (_display getVariable ["modString", ""]);
	};
	case "onUnloadMod": {
		params ["_dialog", "_exitCode"];

		if (_exitCode == 1) then {
			private _code = ctrlText (_dialog displayCtrl 1000);
			_display setVariable ["modString", _code];
			_code = _code call BRM_FMK_3DEN_fnc_preprocessStringComments;
			_display setVariable ["modCode", if (trim _code != "") then { compile _code } else { nil }];

			private _ctrlFactionList = _display displayCtrl IDC_FACTIONLIST;
			private _curSel = lbCurSel _ctrlFactionList;
			if (_curSel != -1) then {
				private _faction = _ctrlFactionList lbText _curSel;

				private _ctrlCamoList = _display displayCtrl IDC_CAMOLIST;
				_curSel = lbCurSel _ctrlCamoList;
				if (_curSel != -1) then {
					private _camo = if (_curSel > 0) then { _ctrlCamoList lbText _curSel } else { "" };
					["assignLoadout", [_faction, _camo]] call BRM_FMK_3DEN_fnc_loadoutViewer;
				};
			};
		};
	};
	case "onStructureButtonOkClick": {
		params ["_control"];

		private _dialog = ctrlParent _control;
		private _code = ctrlText (_dialog displayCtrl 1000);
		if (trim _code != "") then {
			private _processed = _code call BRM_FMK_3DEN_fnc_preprocessStringComments;

			BRM_FMK_3DEN_fnc_loadoutViewer_scriptError = nil;
			private _scriptErrorEH = addMissionEventHandler ["ScriptError", {
				params ["_errorText", "_sourceFile", "_lineNumber", "_errorPos", "_content", "_stackTraceOutput"];
				BRM_FMK_3DEN_fnc_loadoutViewer_scriptError = format ["%1 @ line %2", _errorText, _lineNumber];
			}];
			private _result = compile _processed;
			removeMissionEventHandler ["ScriptError", _scriptErrorEH];
			if (isNil "BRM_FMK_3DEN_fnc_loadoutViewer_scriptError") then {
				closeDialog 1;
			} else {
				[BRM_FMK_3DEN_fnc_loadoutViewer_scriptError, "Script Error", true, false, _dialog] spawn BIS_fnc_guiMessage;
			};
		} else {
			closeDialog 1;
		};
	};
	case "assignLoadout": {
		params ["_faction", ["_camo", ""]];

		missionNamespace setVariable ["BRM_FMK_LoadoutCamo_" + _faction, if (_camo != "") then { _camo } else { nil }];
		private _modCode = _display getVariable "modCode";
		if (!isNil "_modCode") then { BRM_FMK_Engine_fnc_toolLoadoutMod = _modCode; };
		private _structureCode = _display getVariable "structureCode";
		if (!isNil "_structureCode") then { BRM_FMK_Engine_fnc_toolStructure = _structureCode; };

		{
			[_x, _faction, _x getVariable ["role", "*"]] call BRM_FMK_fnc_assignLoadout;
		} forEach (_display getVariable "units");

		if (!isNil "_modCode") then { BRM_FMK_Engine_fnc_toolLoadoutMod = nil; };
		if (!isNil "_structureCode") then { BRM_FMK_Engine_fnc_toolStructure = nil; };
		if (_camo != "") then { missionNamespace setVariable ["BRM_FMK_LoadoutCamo_" + _faction, nil]; };
	};
	case "onFactionLBSelChanged": {
		params ["_control", "_curSel"];

		private _faction = _control lbText _curSel;
		["assignLoadout", [_faction]] call BRM_FMK_3DEN_fnc_loadoutViewer;

		private _camos = switch (_faction) do {
			case "AAF": { ["plain", "camo"] };
			case "AFGHANISTAN": { ["ana", "anp"] };
			case "ANZAC": { ["DPDU", "DPCU"] };
			case "BAF": { ["mpt", "dpm", "ddpm"] };
			case "CAF": { ["CADPATD", "CADPATW"] };
			case "CSAT": { ["BRN", "GRY"] };
			case "FINLAND": { ["sum", "frost"] };
			case "FRANCE": { ["CCE", "DAGUET", "WINTER"] };
			case "GERMAN": { ["FLECK", "TROPEN"] };
			case "JSDF": { ["JIEITAIW", "JIEITAID"] };
			case "MARINES": { ["UCP", "OCP"] };
			case "NATO": { ["sand", "black"] };
			case "PLA": { ["UNI", "NAVY", "ARTY", "PLAT"] };
			case "POLAND": { ["wdl", "des"] };
			case "ROKA": { ["GRANITE", "ROKMC", "DESERT"] };
			case "RUSSIA": { ["emr", "emrd"] };
			case "SOVIETS": { ["vsr", "afg", "khk"] };
			case "SWEDEN": { ["m90w", "m90d"] };
			case "USARMY": { ["ucp", "ocp"] };
			case "USARMY80": { ["wdl", "des"] };
			default { [] };
		};

		private _ctrlCamoList = _display displayCtrl IDC_CAMOLIST;
		lbClear _ctrlCamoList;
		{
			_ctrlCamoList lbAdd _x;
		} forEach _camos;
		if (count _camos > 0) then {
			_ctrlCamoList lbSetCurSel 0;
		};
	};
	case "onCamoLBSelChanged": {
		params ["_control"];

		private _ctrlCamoList = _display displayCtrl IDC_CAMOLIST;
		private _curSel = lbCurSel _ctrlCamoList;
		if (_curSel != -1) then {
			private _ctrlFactionList = _display displayCtrl IDC_FACTIONLIST;
			private _faction = _ctrlFactionList lbText lbCurSel _ctrlFactionList;
			private _camo = if (_curSel > 0) then { _ctrlCamoList lbText _curSel } else { "" };
			["assignLoadout", [_faction, _camo]] call BRM_FMK_3DEN_fnc_loadoutViewer;
		};
	};
	case "onButtonCloseClick": { _display closeDisplay 2; };
	case "onButtonStructureClick": { createDialog ["BRM_FMK_3DEN_DialogLoadoutViewerStructure", true]; };
	case "onButtonModClick": { createDialog ["BRM_FMK_3DEN_DialogLoadoutViewerMod", true]; };
	case "onMouseEnter": { (_display getVariable "camera") camCommand "manual on"; };
	case "onMouseExit": { (_display getVariable "camera") camCommand "manual off"; };
	case "onMouseButtonDown": {
		params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
		if (_button == 1) then { // Set focus on right-click.
			ctrlSetFocus _control;
		};
	};
	case "onMouseButtonDblClick": {
		params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

		private _mouseOver = _display getVariable ["mouseOver", objNull];
		if (!isNull _mouseOver) then {
			(_display getVariable "camera") camCommand "manual off";
			if (isClass (configFile >> "CfgPatches" >> "ace_arsenal")) then {
				_display setVariable ["ace_arsenal_displayClosedEH", ["ace_arsenal_displayClosed", {
					private _display = uiNamespace getVariable "BRM_FMK_3DEN_fnc_loadoutViewer_display";
					["ace_arsenal_displayClosed", _display getVariable "ace_arsenal_displayClosedEH"] call CBA_fnc_removeEventHandler;
					_display spawn {
						waitUntil { isNil "ace_arsenal_camera" };
						private _camera = _this getVariable "camera";
						_camera cameraEffect ["Internal", "BACK"];
						if (is3DEN) then {
							["showInterface", false] call BIS_fnc_3DENInterface;
						};
						_camera camCommand "manual on";
					}
				}] call CBA_fnc_addEventHandler];
				ace_arsenal_center = _mouseOver;
				ace_arsenal_currentBox = _mouseOver;
				ace_arsenal_virtualItems = +(uiNamespace getVariable "ace_arsenal_configItems");
				ace_arsenal_virtualItemsFlat = +(uiNamespace getVariable "ace_arsenal_configItemsFlat");
				ace_arsenal_ignoredVirtualItems = true;
				_display createDisplay "ace_arsenal_display";
			} else {
				[missionNamespace, "arsenalClosed", {
					[missionNamespace, "arsenalClosed", _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
					private _display = uiNamespace getVariable "BRM_FMK_3DEN_fnc_loadoutViewer_display";
					private _camera = _display getVariable "camera";
					_camera cameraEffect ["Internal", "BACK"];
					if (is3DEN) then {
						["showInterface", false] call BIS_fnc_3DENInterface;
					};
					_camera camCommand "manual on";
				}] call BIS_fnc_addScriptedEventHandler;
				BIS_fnc_arsenal_fullArsenal = true;
				BIS_fnc_arsenal_cargo = objNull;
				BIS_fnc_arsenal_center = _mouseOver;
				[missionNamespace, "arsenalPreOpen", [_display, _mouseOver]] call BIS_fnc_callScriptedEventHandler;
				_display createdisplay "RscDisplayArsenal";
			};
		};
	};
	case "ToggleInterface": {
		private _show = param [1, !ctrlShown (_display displayctrl IDC_LEFTPANELBACKGROUND), [false]];
		for "_i" from IDC_LEFTPANELBACKGROUND to IDC_LAST do {
			_display displayCtrl _i ctrlShow _show;
		};
	};
	case "KeyDown": {
		params ["_display", "_key", "_shift", "_ctrl", "_alt"];

		switch (_key) do {
			case DIK_BACKSPACE: { ["ToggleInterface"] call BRM_FMK_3DEN_fnc_loadoutViewer; true };
			case DIK_ESCAPE: { _display closeDisplay 2; true };
			default { false };
		}
	};
	case "Draw3D": {
		private _pos = ASLToAGL POS;

		private _camera = uiNamespace getVariable "BRM_FMK_3DEN_fnc_loadoutViewer_display" getVariable "camera";
		private _cameraPos = getPosASL _camera;
		private _vectorDiff = _cameraPos vectorDiff CAM_POS;
		private _distSqr = vectorMagnitudeSqr _vectorDiff;
		if (_distSqr > /*50*/2500) then {
			_camera setPosASL (CAM_POS vectorAdd (vectorNormalized _vectorDiff vectorMultiply 50))
		};

		private _ctrlInfoBox = _display displayCtrl IDC_INFOBOX;
		private _ctrlInfoName = _display displayCtrl IDC_INFOBOX_INFONAME;

		// Note: lineIntersectsObjs nor lineIntersectsWith seem to work here
		private _mouseOver = lineIntersectsSurfaces [_cameraPos, _cameraPos vectorAdd (_camera screenToWorldDirection getMousePosition vectorMultiply 100), _camera] param [0, []] param [3, objNull];
		_display setVariable ["mouseOver", _mouseOver];
		private _isMouseOver = !isNull _mouseOver;
		_ctrlInfoBox ctrlShow _isMouseOver;
		if (_isMouseOver) then {
			_ctrlInfoName ctrlSetText (_mouseOver getVariable "label");
		};
	};
};
