// A_list_fnc_create

#include "header.h"


params[["_list_id",null,[""]],["_list_name",null,[""]]];

if (UNDEFINED(_list_id)) exitWith {null};
if (UNDEFINED(_list_name)) exitWith {null};

if ([_list_id] call A_list_fnc_exists) exitWith {null};

private _data = [];
_data set[INDEX_ID, _list_id];
_data set[INDEX_NAME, _list_name];
_data set[INDEX_KEYS, []];
_data set[INDEX_VALUES, []];

[_list_id, _data] call A_server_fnc_set_array;