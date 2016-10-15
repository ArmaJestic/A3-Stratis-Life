// A_gang_fnc_lookup_name

#include "header.h"


ARGV(0,_gang_name);
if (UNDEFINED(_gang_name)) exitWith {null};
if (typeName _gang_name != "STRING") exitWith {null};

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;

private["_gang"];
_gang = null;
{
	private["_cgang", "_cgang_name"];
	_cgang = _x;
	_cGANG_INDEX_NAME = _cgang select GANG_INDEX_NAME;
	if (_cgang_name == _gang_name) exitWith {
		_gang = _cgang;
	};
} forEach _gangs_list;

if (UNDEFINED(_gang)) exitWith {null};
_gang
