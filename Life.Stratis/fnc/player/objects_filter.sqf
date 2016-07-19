// A_player_fnc_objects_filter

#include "..\..\includes\macro.h"


ARGV(0,_target);
ARGV(1,_objects);
ARGV(2,_filter_function);

if (typeName _objects != "ARRAY") exitWith {[]};
if (undefined(_filter_function)) exitWith {[]};
if (typeName _filter_function != "CODE") exitWith {[]};

private["_result"];
_result = [];
{
	private["_cobject", "_evaluation"];
	_cobject = _x;		
	_evaluation = ([_target, _cobject] call _filter_function);
	if (_evaluation) then {
		_result = _result + [_cobject];
	};
} forEach _objects;

(_result)
