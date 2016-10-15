// A_list_fnc_exists

#include "header.h"


params[["_list_id",null,[""]]];
if (UNDEFINED(_list_id)) exitWith {false};

private _list = [_list_id] call A_server_fnc_get_array;
((count _list) != 0) 