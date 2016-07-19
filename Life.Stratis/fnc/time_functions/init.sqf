// A_time_functions_fnc_init

#include "..\..\includes\macro.h"


ARGV(0,_quiet,false);
if (undefined(_quiet)) then {_quiet = false;};
init_date = null;
time_loop_exit = false;
[] call A_time_functions_fnc_init_globals;
_game_time_number = call A_time_functions_fnc_game_time_number;
_new_date = numberToDate [YEAR, _game_time_number];

if (not(_quiet)) then {
	player groupChat  format["Synchronizing time with server @ %1, %2m day, %3m night", _new_date, time_sunrise_to_sunset_minutes, time_sunset_to_sunrise_minutes];
};

setDate _new_date;
