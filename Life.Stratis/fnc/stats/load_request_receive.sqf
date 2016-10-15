// A_stats_fnc_load_request_receive

#include "header.h"


diag_log format['A_stats_fnc_load_request_receive (%1): start', _this];
params["_variable", ["_request",null,[[]]]];

if (UNDEFINED(_request)) exitWith {null};

private _uid = _request select INDEX_LOAD_REQUEST_UID;
private _response_variable = _request select INDEX_LOAD_REQUEST_RESPONSE_VARIABLE;

if (UNDEFINED(_uid)) exitWith {null};
if (typeName _uid != "STRING") exitWith {null};
if (UNDEFINED(_response_variable)) exitWith {null};
if (typeName _response_variable != "STRING") exitWith {null};

private _data = [_uid] call A_invokeJava_fnc_getAllPlayerVariables;
server setVariable[_response_variable, _data, true];