// A_server_fnc_init

#include "header.h"


call A_server_fnc_setup_vendors;
call A_server_fnc_group_loop_init;
call A_server_fnc_stationrob_init;
call A_server_fnc_drug_replenish_init;
call A_server_fnc_druguse_init;
call A_server_fnc_robpool_init;