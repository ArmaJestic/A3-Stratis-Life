// init2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

if (isServer) then {
	[] call A_airfield_base_fnc_setup;
	[west, "respawn_west"] call BIS_fnc_addRespawnPosition;
	airfield_base_setup_complete = true;
	publicVariable "airfield_base_setup_complete";
	
};

if (isClient) then {
	waitUntil {(!(isNil "airfield_base_setup_complete") && {airfield_base_setup_complete})};
	respawn_west_proxy setVariable ["respawn", true];
	respawn_west_proxy setVariable ["radius", 5];
};
