// A_missions_fnc_initwpmissions

#include "..\..\includes\macro.h"


//_handler = [] execVM "workplacesettings.sqf";
//waitUntil {scriptDone _handler};

if (isServer) then {
	//[0,0,0,["serverloop"]] execVM "A_missions_fnc_taxi.sqf";
	[0,0,0,["serverloop"]] call A_missions_fnc_taxi;
	//[0,0,0,["serverloop"]] execVM "A_missions_fnc_assassination.sqf";
	[0,0,0,["serverloop"]] call A_missions_fnc_assassination;
	//[0,0,0,["serverloop"]] execVM "A_missions_fnc_hostage.sqf";
	[0,0,0,["serverloop"]] call A_missions_fnc_hostage;
};
