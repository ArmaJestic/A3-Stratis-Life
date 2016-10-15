// init2

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


if (isServer) then {
	[] call A_tree_fnc_register_setup;
};

if (!isServer) then {
	//wait until the server side has been setup
	waitUntil {(server getVariable ["tree_register_setup_complete", false])};
	[] call A_tree_fnc_joined_sync;
};
