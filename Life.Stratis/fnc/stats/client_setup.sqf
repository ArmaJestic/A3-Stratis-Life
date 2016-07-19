// A_stats_fnc_client_setup

#include "../../includes/macro.h"

[] call A_stats_fnc_client_server_setup_wait;
private["_uid"];
_uid = [] call A_stats_fnc_client_wait_uid;
private["_data"];
_data = [_uid] call A_stats_fnc_load_request_send;
[_data, player] call A_stats_fnc_compile_loading;
[A_stats_var_main_libraries, "Loading client libraries"] call A_stats_fnc_load_library_list;
[] call A_player_fnc_continuity;
[] call A_jip_fnc_load;
