// A_init_fnc_pre
// pre-init operations for init and for other function sets
// runs from preInit=1 in fnc cfg

#include "header.h"


// rename to follow prefixs like all other variables/functions?
// required for function params (and macros undefined/defined)
null = 0xe0ffffef;

// setup onEachFrame
call A_frame_fnc_init;
// setup loading
call A_loading_fnc_init;


// setup MISSION_ROOT
private _arr = toArray str missionConfigFile;
_arr resize (count _arr - 15);
MISSION_ROOT = toString _arr;

enableSaving [false,false];
enableEngineArtillery false;

// setup side relations
// little/no AI, so shouldn't be an issue
// https://community.bistudio.com/wiki/setFriend
// https://community.bistudio.com/wiki/Side_relations
WEST setFriend[WEST,1];
WEST setFriend[EAST,0];
WEST setFriend[RESISTANCE,0];
EAST setFriend[EAST,1];
EAST setFriend[WEST,0];
EAST setFriend[RESISTANCE,0];
RESISTANCE setFriend[RESISTANCE,1];
RESISTANCE setFriend[EAST,0];
RESISTANCE setFriend[WEST,0];
CIVILIAN setFriend[WEST,1];
CIVILIAN setFriend[EAST,1];
CIVILIAN setFriend[RESISTANCE,1];
CIVILIAN setFriend[CIVILIAN,1];


// calls for other function sets
// just for ease of editing/viewing what is being called in the pre-init
// instead of setting each to preInit=1
call A_jip_fnc_init_pre;
call A_eh_fnc_init_pre;
call A_log_fnc_init_pre;
call A_main_fnc_init_pre;
call A_time_fnc_init_pre;
call A_vehicle_fnc_init_pre;
call A_player_fnc_init_pre;
//call A_inv_fnc_init_pre;
call A_isse_str_fnc_init_pre;
call A_inventory_fnc_init_pre;
call A_mine_fnc_init_pre;
call A_quarry_fnc_init_pre;
call A_plant_fnc_init_pre;
call A_bombs_fnc_init_pre;
call A_interaction_fnc_init_pre;
//call A_bank_fnc_init_pre;
//call A_missions_fnc_init_pre;
//call A_license_fnc_init_pre;
//call A_farming_fnc_init_pre;
call A_camera_fnc_init_pre;
call A_economy_menu_fnc_init_pre;
call A_lotto_menu_fnc_init_pre;
call A_voting_menu_fnc_init_pre;
call A_legislation_menu_fnc_init_pre;