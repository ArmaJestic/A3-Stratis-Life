// A_time_fnc_move

#include "..\..\includes\macro.h"


_this spawn {
	ARGV(0,_offset);
	if (undefined(_offset)) exitWith {null};
	if (typeName _offset != "SCALAR") exitWith {null};
	_offset = _offset * 60 * 60;
	server setVariable ["time_offset", ((server getVariable "time_offset") + _offset), true];

	"if (!isServer || (isServer && !isDedicated)) then { call A_time_fnc_init_globals; };" call A_broadcast_fnc_broadcast;
};
