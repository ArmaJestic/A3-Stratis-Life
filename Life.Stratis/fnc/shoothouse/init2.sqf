// A_shoothouse_fnc_init2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (isServer) then {
	[[1763.11,5308.78,0.43],[91.997,0,0]] call A_shoothouse_fnc_base_setup;
	shoothouse_base_setup_complete = true;
	publicVariable "shoothouse_base_setup_complete";
	
};

if (isClient) then {
	waitUntil {(not(isNil "shoothouse_base_setup_complete") && {shoothouse_base_setup_complete})};
};