// A_time_functions_fnc_init2

#include "..\..\includes\macro.h"


[] call A_time_functions_fnc_init_remote_globals;

[] call A_time_functions_fnc_init_globals;

if (!isServer || (isServer && !isDedicated)) then {
	//[false] call A_time_functions_fnc_init;
//	[true] spawn A_time_functions_fnc_loop;
};
