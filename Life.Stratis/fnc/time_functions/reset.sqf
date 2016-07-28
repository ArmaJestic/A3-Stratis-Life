// A_time_functions_fnc_reset

#include "..\..\includes\macro.h"


_this spawn {
	ARGV(0,_sunrise);
	ARGV(1,_sunset);
	
	if (undefined(_sunrise)) exitWith {null};
	if (undefined(_sunset)) exitWith {null};
	
	if (typeName _sunrise != "SCALAR") exitWith {null};
	if (typeName _sunset != "SCALAR") exitWith {null};
	
	"if (!isServer || (isServer && !isDedicated)) then { time_loop_exit = true; };" call A_broadcast_fnc_broadcast;
	sleep 3;
		
	server setVariable ["time_sunrise_to_sunset_minutes", _sunrise, true];
	server setVariable ["time_sunset_to_sunrise_minutes", _sunset, true];
	sleep 3;
	"if (!isServer || (isServer && !isDedicated)) then { [true] spawn A_time_functions_fnc_loop;};" call A_broadcast_fnc_broadcast;
};
