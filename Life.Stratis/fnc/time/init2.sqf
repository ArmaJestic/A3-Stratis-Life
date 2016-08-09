// A_time_fnc_init2

#include "..\..\includes\macro.h"


[] call A_time_fnc_init_remote_globals;

[] call A_time_fnc_init_globals;

if (!isServer) then {
	//[false] call A_time_fnc_init;
//	[true] spawn A_time_fnc_loop;
};
