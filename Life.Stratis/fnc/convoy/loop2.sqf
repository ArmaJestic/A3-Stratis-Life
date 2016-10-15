// A_convoy_fnc_loop2

#include "header.h"


private _message = "There are rumors that a government convoy is leaving in a few minutes.";
_message remoteExecCall ["hint",-2];

[RESPAWN_TIME*3,[],A_convoy_fnc_loop3] call A_frame_fnc_wait;