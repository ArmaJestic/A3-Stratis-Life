// A_time_functions_fnc_update

#include "../../includes/macro.h"


private ["_game_time", "_rsecs", "_gsecs"];
if (time_loop_exit) exitWith {};

_game_time_number	= call A_time_functions_fnc_game_time_number;

private ["_direction", "_i", "_skipMin", "_seconds"];

_seconds = floor((_game_time_number - (dateToNumber date)) * (DAYSYEAR * SECSDAY));

_skipMin = floor(_seconds / 60);
if (_skipMin == 0) exitWith {null};

//player groupChat format["_skipMin = %1", _skipMin];

//no need to skip a whole day ...
private["_fullDayMin"];
_fullDayMin = (24 * 60);
_skipMin = _skipMin % _fullDayMin;


if (_skipMin > (_fullDayMin/2)) then {
	_skipMin = -1 * (_fullDayMin - _skipMin);
};
if (_skipMin == 0) exitWith {null};

_direction = (_skipMin/(abs(_skipMin)));
_skipMin = abs(_skipMin);

_i = 0;
while { _i < _skipMin } do {
	skipTime ((_direction * 1)/60);
	_i = _i + 1;
	if (time_loop_exit) exitWith {null};
};
