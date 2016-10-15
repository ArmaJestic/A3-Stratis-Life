// A_stats_fnc_build_save_request

#include "header.h"


params[["_uid","",[""]],["_variable",null],["_value",null]];

if (_uid == "") exitWith {null};
if (UNDEFINED(_variable)) exitWith {null};
if (UNDEFINED(_value)) exitWith {null};

private _request = [];
_request set [INDEX_SAVE_REQUEST_UID, _uid];
_request set [INDEX_SAVE_REQUEST_KEY, _variable];
_request set [INDEX_SAVE_REQUEST_VALUE, _value];
_request