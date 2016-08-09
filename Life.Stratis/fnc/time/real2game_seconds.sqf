// A_time_fnc_real2game_seconds

#include "..\..\includes\macro.h"


private ["_gsecs", "_base_seconds", "_seconds_since_sunrise", "_seconds_since_sunset" ];
ARGV(0,_rsecs);

_game_days = floor(_rsecs / time_full_day);
_gsecs = _game_days  * SECSDAY;

private["_cycle_seconds", "_sunrise_secs"];
_sunrise_secs = _rsecs  % time_full_day;

if (_sunrise_secs <= time_sunrise_to_sunset) then {
	_cycle_seconds = ((_sunrise_secs * (SECSDAY / 2))  / time_sunrise_to_sunset);
}else{
	_sunset_secs = _sunrise_secs - time_sunrise_to_sunset;
	_sunrise_secs = time_sunrise_to_sunset;
	_cycle_seconds = ((_sunrise_secs * (SECSDAY / 2))  / time_sunrise_to_sunset);
	_cycle_seconds = _cycle_seconds + ((_sunset_secs * (SECSDAY / 2))  / time_sunset_to_sunrise);
};

_cycle_seconds = floor(_cycle_seconds);
(_gsecs + _cycle_seconds + time_offset)
