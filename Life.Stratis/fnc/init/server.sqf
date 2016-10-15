// A_init_fnc_server
// handles server init

#include "header.h"


call A_stats_fnc_server_setup;

call A_player_fnc_init;
call A_broadcast_fnc_init;

// load common
call A_init_fnc_common;

// server specific/cant go in common
call A_bases_fnc_init;
call A_bank_fnc_init_pre;
call A_missions_fnc_init_pre;
call A_license_fnc_init_pre;
call A_inv_fnc_init_shops;
call A_farming_fnc_init_pre;
call A_server_fnc_init;
call A_vehicle_storage_fnc_init;
call A_bank_fnc_init_server;
call A_convoy_fnc_init;
call A_hunting_fnc_init;
call A_misc_fnc_init;

// server init is done
missionNamespace setVariable["A_init_var_server",true,true];