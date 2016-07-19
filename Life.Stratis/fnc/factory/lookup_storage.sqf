// A_factory_fnc_lookup_storage

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_storage_name);

if (undefined(_storage_name)) exitWith {null};
if (typeName _storage_name != "STRING") exitWith {null};

private["_factory"];
_factory = null;
{
	private["_cfactory", "_cstorage_name"];
	_cfactory = _x;
	_cstorage_name = _cfactory select factory_storage;
	if (_storage_name == _cstorage_name) exitWith {
		_factory = _cfactory;
	};
} forEach all_factories;
_factory
