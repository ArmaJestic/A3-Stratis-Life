// A_stats_fnc_load_request_send

#include "..\..\includes\macro.h"

private["_uid", "_request", "_response_variable"];

_uid = _this select 0;
_request = [_uid] call A_stats_fnc_build_load_request;
if (undefined(_request)) exitWith {[]};

private["_response_variable"];
_response_variable = _request select A_stats_var_load_request_response_variable;
server setVariable [_response_variable, nil, true];

if (isServer) then {
	//on the server we can call the receive function directly
	["", _request] call A_stats_fnc_load_request_receive;
} else {
	//from the client we have to send request across the network
	stats_load_request_buffer = _request;
	publicVariableServer "stats_load_request_buffer";
};

//wait for the response
private["_data"];

_data = [];
waitUntil {  
	_data = server getVariable _response_variable;
	if (defined(_data) && {typeName _data == "ARRAY"}) exitWith {true};
	false
};
	
_data
