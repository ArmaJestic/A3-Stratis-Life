// A_time_fnc_start

#include "header.h"


private _game_time_number = call A_time_fnc_game_time_number;
private _new_date = numberToDate[YEAR, _game_time_number];

setDate _new_date;