// A_list_fnc_data

#include "..\..\includes\macro.h"


ARGV(0,_list_id);
if (undefined(_list_id)) exitWith {null};
if (typeName _list_id != "STRING") exitWith {null};
if (_list_id == "") exitWith {null};

private["_data"];
_data = [_list_id] call A_server_fnc_get_array;
if ((count _data) == 0) exitWith {null};
(_data)
