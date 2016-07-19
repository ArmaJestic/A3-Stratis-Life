// A_factory_fnc_lookup_id

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_id);
if (undefined(_id)) exitWith {null};
if (typeName _id != "STRING") exitWith {null};

private["_factory"];
_factory = null;
{
	private["_cfactory", "_cid"];
	_cfactory = _x;
	_cid = _cfactory select factory_id;
	if (_id == _cid) exitWith {
		_factory = _cfactory;
	};
} forEach all_factories;
_factory
