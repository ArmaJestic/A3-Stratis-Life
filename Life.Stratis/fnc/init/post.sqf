// A_init_fnc_post
// post-init operations
// runs from postInit=1 in fnc cfg

#include "header.h"


// do check on game multiplayer/server/dedicated
call A_init_fnc_gamecheck;

if (isServer) then {
	call A_init_fnc_server;
}else{
	call A_init_fnc_client;
};