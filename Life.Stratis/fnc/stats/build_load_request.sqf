// A_stats_fnc_build_load_request

#include "..\..\includes\macro.h"

private["_uid"];
	
_uid = _this select 0;
if (undefined(_uid)) exitWith {null};
if (typeName _uid != "STRING") exitWith {null};

private["_response_variable"];
_response_variable = _uid;
server setVariable [_response_variable, nil, true];

private["_request"];
	
_request = [];
_request set [A_stats_var_load_request_uid, _uid];
_request set [A_stats_var_load_request_response_variable, _response_variable];
_request
