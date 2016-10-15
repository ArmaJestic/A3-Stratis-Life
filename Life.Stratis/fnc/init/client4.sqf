// A_init_fnc_client4
// fourth (final) stage of client init

#include "header.h"


diag_log format['A_init_fnc_client4: starting'];

["loading common set..."] call A_loading_fnc_update;
call A_init_fnc_common;

// client specific/cant go in common
["loading client set..."] call A_loading_fnc_update;
call A_bank_fnc_init_pre;
call A_missions_fnc_init_pre;
call A_license_fnc_init_pre;
call A_hud_fnc_init;
call A_bases_fnc_init_client;
call A_inv_fnc_init_shops;
call A_farming_fnc_init_pre;
call A_bank_fnc_init_client;
call A_other_fnc_init_client;
call A_settings_fnc_init;
call A_doors_fnc_init;
call A_shop_menu_fnc_init;
call A_main_menu_fnc_init;
call A_mobile_menu_fnc_init;
call A_prison_menu_fnc_init;
call A_holster_fnc_init;
call A_mounted_fnc_init;
call A_retributions_fnc_init;
call A_speed_gun_fnc_init;
call A_stun_fnc_init;
call A_towing_fnc_init;
call A_salary_fnc_init;
call A_input_fnc_init;
call A_nametags_fnc_init;
call A_markers_fnc_init;

// time loop, needs to also check if player is inside a base on loading
// have to rework
//call call A_time_fnc_loop;

//from A_stats_fnc_init_client (A_stats_fnc_client_setup)
["Fetching stats..."] call A_loading_fnc_update;
private _data = [_uid] call A_stats_fnc_load_request_send;
// compile stats
[_data, player] call A_stats_fnc_compile_loading;

// may have to be done lower down
call A_player_fnc_continuity;

call A_loading_fnc_stop;
// cutText black in
cutText["","BLACK IN",1];

if (([player] call A_player_fnc_blufor) && {["cop_blacklist", (getPlayerUID player)] call A_list_fnc_contains_key}) exitwith {
	systemChat format["WARNING: You have been blacklisted from the blufor side."];
	"player blacklisted from blufor side" call A_err_fnc_end;
};

// from respawn.sqf
["player_rejoin_camera_complete"] call A_player_fnc_wait;
[player] call A_interaction_fnc_stranded_check;
[player,true] call A_player_fnc_spawn;

// client init is finished

diag_log format['A_init_fnc_client4: ending'];