#include "component.hpp"

params ["_aiSkill"];

DAC_AI_Level = _aiSkill + 1;

mission_DAC_AI_skill = switch (_aiSkill) do {
	case 0: { [0.2, 0.3] }; // Very Low
	case 1: { [0.4, 0.5] }; // Low
	case 2: { [0.6, 0.7] }; // Medium
	case 3: { [0.8, 0.9] }; // High
	default { [0.5, 0.5] };
};
