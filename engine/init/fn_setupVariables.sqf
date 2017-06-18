
if (isNil "mission_AGM_enabled") then { mission_AGM_enabled = (isClass(configFile >> "CfgPatches" >> "AGM_CORE")) };
if (isNil "mission_ACE3_enabled") then { mission_ACE3_enabled = (isClass(configFile>>"CfgPatches">>"ACE_COMMON")) };

if (isNil "mission_TFAR_enabled") then { mission_TFAR_enabled = (isClass(configFile>>"CfgPatches">>"task_force_radio") || isClass(configFile>>"CfgPatches">>"tfar_core")) };
if (isNil "mission_ACRE2_enabled") then { mission_ACRE2_enabled = (isClass(configFile>>"CfgPatches">>"acre_api")) };

if (isNil "mission_AI_controller") then { mission_AI_controller = false };

if (isNil "side_a_side") then { side_a_side = WEST };
if (isNil "side_a_faction") then { side_a_faction = "NATO" };

if (isNil "side_b_side") then { side_b_side = EAST };
if (isNil "side_b_faction") then { side_b_faction = "CSAT" };

if (isNil "side_c_side") then { side_c_side = RESISTANCE };
if (isNil "side_c_faction") then { side_c_faction = "AAF" };

if (isNil "param_ace3_medical_level") then { param_ace3_medical_level = 0 };