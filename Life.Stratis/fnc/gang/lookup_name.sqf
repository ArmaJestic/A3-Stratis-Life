// A_gang_fnc_lookup_name

#include "..\..\includes\macro.h"


ARGV(0,_gang_name);
if (undefined(_gang_name)) exitWith {null};
if (typeName _gang_name != "STRING") exitWith {null};

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;

private["_gang"];
_gang = null;
{
	private["_cgang", "_cgang_name"];
	_cgang = _x;
	_cA_gang_var_name = _cgang select A_gang_var_name;
	if (_cgang_name == _gang_name) exitWith {
		_gang = _cgang;
	};
} forEach _gangs_list;

if (undefined(_gang)) exitWith {null};
_gang
