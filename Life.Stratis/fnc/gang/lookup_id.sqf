// A_gang_fnc_lookup_id

#include "../../includes/macro.h"


ARGV(0,_gang_id);
if (undefined(_gang_id)) exitWith {null};
if (typeName _gang_id != "STRING") exitWith {null};

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;

private["_gang"];
_gang = null;
{
	private["_cgang", "_cgang_id"];
	_cgang = _x;
	_cA_gang_var_id = _cgang select A_gang_var_id;
	if (_cgang_id == _gang_id) exitWith {
		_gang = _cgang;
	};
} forEach _gangs_list;

_gang
