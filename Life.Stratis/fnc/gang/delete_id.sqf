// A_gang_fnc_delete_id

#include "../../includes/macro.h"


ARGV(0,_gang_id);
if (undefined(_gang_id)) exitWith {null};
if (typeName _gang_id != "STRING") exitWith {null};

private["_gang", "_gang_index"];
_gang_index = [_gang_id] call A_gang_fnc_id_2_index;
if (_gang_index < 0) exitWith {null};

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;
_gangs_list set [_gang_index, 0];
_gangs_list = _gangs_list - [0];
[_gangs_list] call A_gang_fnc_set_list;
