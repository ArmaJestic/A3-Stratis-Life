// A_factory_fnc_lookup_id

#include "header.h"


ARGV(0,_id);
if (UNDEFINED(_id)) exitWith {null};
if (typeName _id != "STRING") exitWith {null};

private["_factory"];
_factory = null;
{
	private["_cfactory", "_cid"];
	_cfactory = _x;
	_cid = _cfactory select INDEX_ID;
	if (_id == _cid) exitWith {
		_factory = _cfactory;
	};
} forEach all_factories;
_factory
