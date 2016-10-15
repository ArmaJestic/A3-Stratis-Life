// A_time_fnc_game_time_number

#include "header.h"


private _rsecs = floor(serverTime);
private _isecs = (dateToNumber INIT_DATE);
private _gsecs = ([_rsecs] call A_time_fnc_real2game_seconds) / (DAYSYEAR * SECSDAY);

private _result = (_isecs + _gsecs);
//private _date =  numberToDate [YEAR, _result];

_result