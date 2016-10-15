// A_convoy_fnc_loop

#include "header.h"


format["A_convoy_fnc_loop %1", _this] call A_convoy_fnc_debug;
[RESPAWN_TIME*3,[],A_convoy_fnc_loop2] call A_frame_fnc_wait;