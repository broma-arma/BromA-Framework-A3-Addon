// ============================================================================
//  These are the default credits to everyone who contributed in order to make |
//                        this framework complete.                             |
//                                                                             |
//        I sincerely urge you not to remove this from your mission.           |
//                                                                             |
//              And most importantly, don't forget to add your name            |
//                        and mission version below!                           |
// ============================================================================

private _missionAuthorNameVerbose = [mission_author_name] call BRM_FMK_fnc_verboseArray;

player createDiaryRecord ["Diary", ["Credits","
Current mission version " + mission_version + " made by " + _missionAuthorNameVerbose + ".
<br/>
<br/>
<img image='\broma_framework\assets\images\framework-logo.paa' width='512' height='128'/><br/>
Made possible using the BromA Framework, assembled by the BromA Mission Making Team @ http://bro.ma
- all credits given to their respective creators."]];
