// A_list_fnc_exists

#include "../../includes/macro.h"


ARGV(0,_list_id);
if (undefined(_list_id)) exitWith {false};
if (typeName _list_id != "STRING") exitWith {false};

private["_list"];
_list = [_list_id] call A_server_fnc_get_array;

if ((count _list) == 0) exitWith {false};

(true)
