// A_init_fnc_client2
// second stage of client init

#include "header.h"


diag_log format['A_init_fnc_client2: starting'];

1 fadeSound 0;
player allowDamage false;
player setPosASL[0,0,10000];
cutText["","BLACK OUT",0.0001];

// just run this now to avoid issues
call A_player_fnc_init;
call A_broadcast_fnc_init;


// wait for limbo base to be setup
diag_log format['A_init_fnc_client2: waitUntil'];
[[],{!(isNil "A_bases_var_limbo")},A_init_fnc_client3] call A_frame_fnc_waitUntil;