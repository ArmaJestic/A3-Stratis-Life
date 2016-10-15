// A_prison_menu_fnc_lookup_id

#include "header.h"


ARGV(0,_id);

if (UNDEFINED(_id)) exitWith {null};
private["_prison"];

_prison = null;

{
	private["_cid", "_cprison"];
	_cprison = _x;
	_cid = _cprison select DLG_PRISON_INDEX_ID;
	if (_cid == _id) then {
		_prison = _cprison;
	};
} forEach (A_prison_menu_var_data);

_prison
