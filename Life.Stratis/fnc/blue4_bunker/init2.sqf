// init2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

if (isServer) then {
	["Blue4 Bunker", [2446.85,5686.52,8000]] call A_blue4_bunker_fnc_create;
	[west,"respawn_blue4"] call BIS_fnc_addRespawnPosition;
	blue4_bunker_setup_complete = true;
	publicVariable "blue4_bunker_setup_complete";
};

if (isClient) then {
	waitUntil {(!(isNil "blue4_bunker_setup_complete") && {blue4_bunker_setup_complete})};
	respawn_blue4_proxy setVariable ["respawn", true];
	respawn_blue4_proxy setVariable ["radius", 5];
};