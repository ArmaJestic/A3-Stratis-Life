// A_stats_fnc_setup

#include "../../includes/macro.h"

diag_log format["A_stats_fnc_setup starting, server: %1", isServer];

// Not used anymore
//diag_log format["A_stats_fnc_setup: Loading core"];
//[A_stats_var_core_libraries, "Loading core libraries"] call A_stats_fnc_load_library_list;

if (isClient) then {
	diag_log format["A_stats_fnc_setup: Loading client 1"];
	[player] call A_limbo_base_fnc_enter;
};

if (isServer) then {
	diag_log format["A_stats_fnc_setup: Loading server"];
	[] call A_stats_fnc_server_setup;
};

if (isClient) then {
	diag_log format["A_stats_fnc_setup: Loading client 2"];
	[] call A_stats_fnc_client_setup;
};

diag_log format["A_stats_fnc_setup Complete"];
