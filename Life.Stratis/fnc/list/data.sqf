// A_list_fnc_data

#include "header.h"


params[["_list_id","",[""]]];
if (_list_id == "") exitWith {null};

private _data = [_list_id] call A_server_fnc_get_array;
if ((count _data) == 0) exitWith {null};
(_data)