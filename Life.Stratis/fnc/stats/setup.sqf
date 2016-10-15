// A_stats_fnc_setup

#include "header.h"


if (isServer) then {
	[] call A_stats_fnc_server_setup;
};

if (!isServer) then {
	[] call A_stats_fnc_client_setup;
};