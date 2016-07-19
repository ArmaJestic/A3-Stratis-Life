// A_stats_fnc_load_request_receive

#include "..\..\includes\macro.h"

private["_variable", "_request"];
	
_variable = _this select 0;
_request = _this select 1;

//player groupChat format["LOAD_REQUEST_RECV: %1", _request];

if (undefined(_request)) exitWith {null};
if (typeName _request != "ARRAY") exitWith {null};

private["_uid", "_response_variable"];
_uid = _request select A_stats_var_load_request_uid;
_response_variable = _request select A_stats_var_load_request_response_variable;


if (undefined(_uid)) exitWith {null};
if (typeName _uid != "STRING") exitWith {null};
if (undefined(_response_variable)) exitWith {null};
if (typeName _response_variable != "STRING") exitWith {null};

private["_data"];
_data = [_uid] call A_invokeJava_fnc_getAllPlayerVariables;
server setVariable[_response_variable, _data, true];
