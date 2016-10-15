// A_gang_fnc_lookup_id

#include "header.h"


ARGV(0,_gang_id);
if (UNDEFINED(_gang_id)) exitWith {null};
if (typeName _gang_id != "STRING") exitWith {null};

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;

private["_gang"];
_gang = null;
{
	private["_cgang", "_cgang_id"];
	_cgang = _x;
	_cGANG_INDEX_ID = _cgang select GANG_INDEX_ID;
	if (_cgang_id == _gang_id) exitWith {
		_gang = _cgang;
	};
} forEach _gangs_list;

_gang
