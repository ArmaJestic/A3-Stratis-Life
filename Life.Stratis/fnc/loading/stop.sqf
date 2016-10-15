// A_loading_fnc_stop

#include "header.h"


// only for the server, broadcasts to all clients when done
if (isServer) exitwith {};

["Ending...", 1] call A_loading_fnc_update;

[1,[],A_loading_fnc_stop2] call A_frame_fnc_wait;