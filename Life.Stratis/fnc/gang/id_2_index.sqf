// A_gang_fnc_id_2_index

#include "../../includes/macro.h"


ARGV(0,_gang_id);
if (undefined(_gang_id)) exitWith {-1};
if (typeName _gang_id != "STRING") exitWith {-1};

private["_i", "_gangs_list", "_gang_index"];
_i = 0;
_gang_index = -1;
_gangs_list = call A_gang_fnc_get_list;
while { _i < (count _gangs_list) } do {
	private["_cgang", "_cgang_id"];
	_cgang = _gangs_list select _i;
	_cA_gang_var_id = _cgang select A_gang_var_id;
	if (_cgang_id == _gang_id) exitWith {
		_gang_index = _i;
	};
	_i = _i + 1;
};

_gang_index
