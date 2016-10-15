// A_stats_fnc_build_load_request

#include "header.h"


params[["_uid",null,[""]]];

if (UNDEFINED(_uid)) exitWith {null};

private _response_variable = _uid;
server setVariable[_response_variable, nil, true];

private _request = [];
_request set[INDEX_LOAD_REQUEST_UID, _uid];
_request set[INDEX_LOAD_REQUEST_RESPONSE_VARIABLE, _response_variable];
_request