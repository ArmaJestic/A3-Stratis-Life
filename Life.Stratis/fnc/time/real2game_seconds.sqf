// A_time_fnc_real2game_seconds

#include "header.h"


params["_rsecs"];

private _game_days = floor(_rsecs / VAR_TIME_FULL_DAY);
private _gsecs = _game_days  * SECSDAY;

private _cycle_seconds = 0;
private _sunrise_secs = _rsecs  % VAR_TIME_FULL_DAY;

if (_sunrise_secs <= VAR_TIME_RISE_TO_SET) then {
	_cycle_seconds = ((_sunrise_secs * (SECSDAY / 2))  / VAR_TIME_RISE_TO_SET);
}else{
	_sunset_secs = _sunrise_secs - VAR_TIME_RISE_TO_SET;
	_sunrise_secs = VAR_TIME_RISE_TO_SET;
	_cycle_seconds = ((_sunrise_secs * (SECSDAY / 2))  / VAR_TIME_RISE_TO_SET);
	_cycle_seconds = _cycle_seconds + ((_sunset_secs * (SECSDAY / 2))  / VAR_TIME_SET_TO_RISE);
};

_cycle_seconds = floor(_cycle_seconds);
(_gsecs + _cycle_seconds + VAR_TIME_OFFSET)