// A_init_fnc_client
// handles client init

#include "header.h"


// look into if this is necessary, remnant of old mission file
// wait until player object is all setup?
diag_log format['A_init_fnc_client: waitUntil'];
[[],{!(isNull player)&&{isPlayer player}&&{(getPlayerUID player) != ""}},A_init_fnc_client2] call A_frame_fnc_waitUntil;