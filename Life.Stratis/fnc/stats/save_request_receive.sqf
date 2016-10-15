// A_stats_fnc_save_request_receive

#include "header.h"


params["_variable", ["_request",null,[[]]]];
	
if (UNDEFINED(_request)) exitWith {null};

_request params[["_uid",null,[""]],["_key",null,[""]],"_value"];
//private _uid = _request select INDEX_SAVE_REQUEST_UID;
//private _key = _request select INDEX_SAVE_REQUEST_KEY;
//private _value = _request select INDEX_SAVE_REQUEST_VALUE;

if (UNDEFINED(_uid)) exitWith {null};
if (UNDEFINED(_key)) exitWith {null};
if (UNDEFINED(_value)) exitWith {null};

_value = [_value];

[_uid, _key, _value] call A_invokeJava_fnc_updatePlayerVariable;