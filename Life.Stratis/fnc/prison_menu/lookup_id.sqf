// A_prison_menu_fnc_lookup_id

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_id);

if (undefined(_id)) exitWith {null};
private["_prison"];

_prison = null;

{
	private["_cid", "_cprison"];
	_cprison = _x;
	_cid = _cprison select A_prison_menu_var_data_id;
	if (_cid == _id) then {
		_prison = _cprison;
	};
} forEach (A_prison_menu_var_data);

_prison
