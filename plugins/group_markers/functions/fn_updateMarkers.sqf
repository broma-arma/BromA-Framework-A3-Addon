private _markers = [];

private _defaultIcon = "\A3\ui_f\data\map\markers\nato\%1_unknown.paa";

private _defaultSquadIcons = [
	"\A3\ui_f\data\map\markers\nato\%1_hq.paa", // 0: Zero
	"\A3\ui_f\data\map\markers\nato\%1_inf.paa", // 1: Alpha
	"\A3\ui_f\data\map\markers\nato\%1_inf.paa", // 2: Bravo
	"\A3\ui_f\data\map\markers\nato\%1_inf.paa", // 3: Charlie
	"\A3\ui_f\data\map\markers\nato\%1_inf.paa", // 4: Delta
	"\A3\ui_f\data\map\markers\nato\%1_recon.paa", // 5: Razor
	"\A3\ui_f\data\map\markers\nato\%1_support.paa", // 6: Sierra
	"\A3\ui_f\data\map\markers\nato\%1_support.paa", // 7: Wizard
	"\A3\ui_f\data\map\markers\nato\%1_maint.paa", // 8: Shocker
	"\A3\ui_f\data\map\markers\nato\%1_med.paa", // 9: Paradise
	"\A3\ui_f\data\map\markers\nato\%1_mortar.paa", // 10: Meteor
	"\A3\ui_f\data\map\markers\nato\%1_mech_inf.paa", // 11: Lancer
	"\A3\ui_f\data\map\markers\nato\%1_armor.paa", // 12: Titan
	"\A3\ui_f\data\map\markers\nato\%1_air.paa", // 13: Havoc
	"\A3\ui_f\data\map\markers\nato\%1_plane.paa" // 14: Pegasus
];

private _playerSide = player call BIS_fnc_objectSide;
{
	private _groupVar = _x getVariable "BRM_FMK_Engine_fnc_groupVar";
	if (!isNil "_groupVar") then {
		private _side = side _x;
		private _sideID = _side call BIS_fnc_sideID;
		private _leader = leader _x;
		if (_sideID < 3 && { (!isMultiplayer || isPlayer _leader) && { _playerSide == _side }}) then {
			private _icon = _x getVariable "marker";
			if (isNil "_icon") then {
				_icon = _defaultSquadIcons param [parseNumber (_groupVar splitString "_" select 1), _defaultIcon];
			};
			if (_icon != "") then {
				_icon = format [_icon, ["o", "b", "n", "c", "c", "c", "c", "c", "c", "c"] select _sideID];
				_markers pushBack [groupId _x, getPosASLVisual _leader, _icon, [_side] call BIS_fnc_sideColor];
			};
		};
	};
} forEach allGroups;

BRM_FMK_Plugin_GroupMarkers_markers = _markers;
