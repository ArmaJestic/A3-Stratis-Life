// A_time_fnc_game_time_number

#include "..\..\includes\macro.h"


private ["_rsecs", "_gsecs"];

if (undefined(init_date)) then {
	init_date = [YEAR, 01, 27, 10, 30];
};
_rsecs = floor(serverTime);

_isecs = (dateToNumber init_date);
_gsecs = ([_rsecs] call A_time_fnc_real2game_seconds) / (DAYSYEAR * SECSDAY);

_result = (_isecs + _gsecs);
_date =  numberToDate [YEAR, _result];
//player groupChat format["_date = %1", _date];
_result
