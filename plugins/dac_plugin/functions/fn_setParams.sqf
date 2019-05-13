DAC_AI_Level = (_this select 0) + 1;

mission_DAC_AI_skill = [0.5,0.5];

switch (_this select 0) do {
    case 0: { mission_DAC_AI_skill = [0.2,0.3] };
    case 1: { mission_DAC_AI_skill = [0.4,0.5] };
    case 2: { mission_DAC_AI_skill = [0.6,0.7] };
    case 3: { mission_DAC_AI_skill = [0.8,0.9] };
};
