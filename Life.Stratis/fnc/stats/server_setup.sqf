// A_stats_fnc_server_setup

#include "..\..\includes\macro.h"

onPlayerDisconnected { [_id, _name, _uid] call A_stats_fnc_server_player_disconnected };
	
//setup event listener for players trying to load their stats	
	
stats_load_request_buffer =  " ";
publicVariableServer "stats_load_request_buffer";
"stats_load_request_buffer" addPublicVariableEventHandler { _this call A_stats_fnc_load_request_receive;};

//setup event lister for players trying to save their stats
stats_save_buffer = " ";
publicVariableServer "stats_save_buffer";
"stats_save_buffer" addPublicVariableEventhandler { _this call A_stats_fnc_save_request_receive; };

//load the SERVER's own variables
private["_data"];
_data = [A_stats_var_server_uid] call A_stats_fnc_load_request_send;
[_data, server] call A_stats_fnc_compile_sequential;


//keep a count of how many times the server has restarted
private["_restart_count"];
_restart_count = server getVariable "restart_count";
_restart_count = if (undefined(_restart_count)) then {0} else {_restart_count};
_restart_count = if (typeName _restart_count != "SCALAR") then {0} else {_restart_count};
_restart_count = _restart_count + 1;
server setVariable ["restart_count", _restart_count, true];
["restart_count", _restart_count] call A_stats_fnc_server_save;

// Not used anymore
/*
if (!(isClient)) then {
	//special case to avoid loading the client libraries twice
	[A_stats_var_main_libraries, "Loading client libraries"] call A_stats_fnc_load_library_list;
};
*/

server setVariable ["stats_server_setup_complete", true, true];
