// A_stats_fnc_build_save_request

#include "../../includes/macro.h"

private["_uid", "_variable", "_value"];
	
_uid = _this select 0;
_variable = _this select 1;
_value = _this select 2;

if (undefined(_uid)) exitWith {null};
if (undefined(_variable)) exitWith {null};
if (undefined(_value)) exitWith {null};

if (typeName _uid != "STRING") exitWith {null};
if (_uid == "") exitWith {null};
if (typeName _variable != "STRING") exitWith {null};

private["_request"];
_request = [];
_request set [A_stats_var_save_request_uid, _uid];
_request set [A_stats_var_save_request_key, _variable];
_request set [A_stats_var_save_request_value, _value];
_request
