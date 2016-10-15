// A_init_fnc_client3
// third stage of client init

#include "header.h"


diag_log format['A_init_fnc_client3: starting'];

// move to limbo area
[player] call A_bases_fnc_limbo_enter;

// wait until server init is finished
["waiting for server to finish..."] call A_loading_fnc_start;
diag_log format['A_init_fnc_client3: waitUntil'];
[[],{!isNil "A_init_var_server"},A_init_fnc_client4] call A_frame_fnc_waitUntil;