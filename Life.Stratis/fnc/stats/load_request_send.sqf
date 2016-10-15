// A_stats_fnc_load_request_send

#include "header.h"


params["_uid"];

private _request = [_uid] call A_stats_fnc_build_load_request;
if (UNDEFINED(_request)) exitWith {[]};

private _response_variable = _request select INDEX_LOAD_REQUEST_RESPONSE_VARIABLE;
server setVariable[_response_variable, nil, true];

if (isServer) then {
	//on the server we can call the receive function directly
	["", _request] call A_stats_fnc_load_request_receive;
}else{
	//from the client we have to send request across the network
	stats_load_request_buffer = _request;
	publicVariableServer "stats_load_request_buffer";
};

private _data = [];
waitUntil {
	_data = server getVariable _response_variable;
	(DEFINED(_data) && {typeName _data == "ARRAY"})
};

_data