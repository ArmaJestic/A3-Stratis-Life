// A_time_fnc_update

#include "header.h"


private _game_time_number = call A_time_fnc_game_time_number;
private _seconds = floor((_game_time_number - (dateToNumber date)) * (DAYSYEAR * SECSDAY));
private _skipMin = floor(_seconds / 60);
if (_skipMin == 0) exitWith {};

//no need to skip a whole day ...
private _fullDayMin = (24 * 60);
_skipMin = _skipMin % _fullDayMin;

if (_skipMin > (_fullDayMin/2)) then {
	_skipMin = -1 * (_fullDayMin - _skipMin);
};
if (_skipMin == 0) exitWith {};


private _direction = (_skipMin/(abs(_skipMin)));
_skipMin = abs(_skipMin);

skipTime(_skipMin*((_direction)/60));