// A_stats_fnc_save_request_send

#include "..\..\includes\macro.h"

diag_log format['A_stats_fnc_save_request_send: %1', _this];

_request = _this call A_stats_fnc_build_save_request;
if (undefined(_request)) exitWith {diag_log format['A_stats_fnc_save_request_send: Exit']; null};
	
if (isServer) then {
	// if we are on server, we can call the receive method directly
	diag_log format['A_stats_fnc_save_request_send: server, call A_stats_fnc_save_request_receive'];
	["", _request] call A_stats_fnc_save_request_receive;
} else {
	// if we are on client, then we need to send it across the network
	diag_log format['A_stats_fnc_save_request_send: client, broadcasting'];
	stats_save_request_buffer = _request;
	publicVariableServer "stats_save_request_buffer";
};
	
diag_log format['A_stats_fnc_save_request_send: complete'];
