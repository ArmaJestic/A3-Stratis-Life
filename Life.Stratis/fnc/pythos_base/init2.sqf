// init2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (isServer) then {
	call A_pythos_base_fnc_setup;
	[east,"respawn_cp1"] call BIS_fnc_addRespawnPosition;
	pythos_base_setup_complete = true;
	publicVariable "pythos_base_setup_complete";
	
};

if (isClient) then {
	waitUntil {(not(isNil "pythos_base_setup_complete") && {pythos_base_setup_complete})};
	respawn_cp1_proxy setVariable ["respawn", true];
	respawn_cp1_proxy setVariable ["radius", 5];
};