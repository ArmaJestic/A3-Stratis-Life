// init2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (isServer) then {
	[[6638.99,6720.81,-35], "_submerged"] call A_underwater_base_fnc_underwater_base_setup;
	[[8150,50,1.5], "_floating"] call A_underwater_base_fnc_underwater_base_setup;
	
	underwater_base_setup_complete = true;
	publicVariable "underwater_base_setup_complete";
};

if (isClient) then {
	waitUntil {(not(isNil "underwater_base_setup_complete") && {underwater_base_setup_complete})};
	
	respawn_east_proxy = respawn_east_proxy_floating;
	respawn_east_proxy setVariable ["respawn", true];
	respawn_east_proxy setVariable ["radius", 5];
	
	[] call A_underwater_base_fnc_underwater_setup_lights;
};