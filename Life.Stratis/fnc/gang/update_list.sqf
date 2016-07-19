// A_gang_fnc_update_list

#include "../../includes/macro.h"


ARGV(0,_gang);
if (undefined(_gang)) exitWith {null};
if (typeName _gang != "ARRAY") exitWith {null};

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;

private["_gang_id", "_gang_index"];
_A_gang_var_id = _gang select A_gang_var_id;
_gang_index = [_gang_id] call A_gang_fnc_id_2_index;
	
if (_gang_index == -1) then {
	_gangs_list = _gangs_list + [_gang];
}
else {
	_gangs_list set [_gang_index, _gang];
};

[_gangs_list] call A_gang_fnc_set_list;
