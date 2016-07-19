// A_time_functions_fnc_init_remote_globals

#include "../../includes/macro.h"


if (!isServer) exitWith {null};
if (not(undefined(time_remote_globals_defined))) exitWith {null};

time_sunrise_to_sunset_minutes = 120;
time_sunset_to_sunrise_minutes = 10;
time_offset = 0;

server setVariable ["time_sunrise_to_sunset_minutes", time_sunrise_to_sunset_minutes, true];
server setVariable ["time_sunset_to_sunrise_minutes", time_sunset_to_sunrise_minutes, true];
server setVariable ["time_offset", time_sunset_to_sunrise_minutes, true];

time_remote_globals_defined = true;
