// A_stats_fnc_save_request_send

#include "header.h"


private _request = _this call A_stats_fnc_build_save_request;
if (UNDEFINED(_request)) exitWith {null};
	
if (isServer) then {
	// if we are on server, we can call the receive method directly
	["", _request] call A_stats_fnc_save_request_receive;
} else {
	// if we are on client, then we need to send it across the network
	stats_save_request_buffer = _request;
	publicVariableServer "stats_save_request_buffer";
};