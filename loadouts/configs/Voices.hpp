class Voices {
	class Altian {
		male01gre = "Male01GRE";
		male02gre = "Male02GRE";
		male03gre = "Male03GRE";
		male04gre = "Male04GRE";
		male05gre = "Male05GRE";
		male06gre = "Male06GRE";
	};
	class American {
		male01eng = "Male01ENG";
		male02eng = "Male02ENG";
		male03eng = "Male03ENG";
		male04eng = "Male04ENG";
		male05eng = "Male05ENG";
		male06eng = "Male06ENG";
		male07eng = "Male07ENG";
		male08eng = "Male08ENG";
		male09eng = "Male09ENG";
		male10eng = "Male10ENG";
		male11eng = "Male11ENG";
		male12eng = "Male12ENG";
	};
	class British {
		male01engb = "Male01ENGB";
		male02engb = "Male02ENGB";
		male03engb = "Male03ENGB";
		male04engb = "Male04ENGB";
		male05engb = "Male05ENGB";
	};
	class Chinese {
		male01chi = "Male01CHI"; // Expansion
		male02chi = "Male02CHI"; // Expansion
		male03chi = "Male03CHI"; // Expansion
	};
	class Farsi {
		male01per = "Male01PER";
		male02per = "Male02PER";
		male03per = "Male03PER";
	};
	class French {
		male01fre = "Male01FRE"; // Expansion
		male02fre = "Male02FRE"; // Expansion
		male03fre = "Male03FRE"; // Expansion
	};
	class FrenchEnglish {
		male01engfre = "Male01ENGFRE"; // Expansion
		male02engfre = "Male02ENGFRE"; // Expansion
	};
	class Polish {
		male01pol = "Male01POL"; // Enoch
		male02pol = "Male02POL"; // Enoch
		male03pol = "Male03POL"; // Enoch
	};
	class Russian {
		male01rus = "Male01RUS"; // Enoch
		male02rus = "Male02RUS"; // Enoch
		male03rus = "Male03RUS"; // Enoch
	};
};

/*
private _voice = "Male01RUS"; 
private _cfgWordsNormal = configFile >> getText (configfile >> "CfgVoice" >> _voice >> "protocol") >> "Words" >> "Normal"; 
//private _cfgWord = _cfgWordsNormal select floor random count _cfgWordsNormal; 
private _cfgWord = _cfgWordsNormal >> "SuppressiveFire"; 
private _file = format ["%1%2",  getArray (configFile >> "CfgVoice" >> _voice >> "directories")#0,  getArray _cfgWord#0]; 
playSound3D [_file, player, false, getPosASL player, 5, 1, 10, 0, true]; 
[configName _cfgWord, _file]
*/
