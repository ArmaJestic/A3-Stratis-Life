// A_factory_fnc_lookup_storage

#include "header.h"


ARGV(0,_storage_name);

if (UNDEFINED(_storage_name)) exitWith {null};
if (typeName _storage_name != "STRING") exitWith {null};

private["_factory"];
_factory = null;
{
	private["_cfactory", "_cstorage_name"];
	_cfactory = _x;
	_cstorage_name = _cfactory select INDEX_STORAGE;
	if (_storage_name == _cstorage_name) exitWith {
		_factory = _cfactory;
	};
} forEach all_factories;
_factory
