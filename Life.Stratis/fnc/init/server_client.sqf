// A_init_fnc_server_client
// handles client start on server

#include "header.h"


// wait until A_init_fnc_server is finished
waitUntil {!isNil "A_init_var_server"};