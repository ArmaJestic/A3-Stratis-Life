// A_mounted_fnc_lookup_class

#include "header.h"


params[["_class",null,[""]]];
if (UNDEFINED(_class)) exitWith {null};

private _entry = null;

{
	private _centry = _x;
	private _cclass = _centry select INDEX_CLASSES;
	if (_class in (_cclass) ) exitWith {
		_entry = _centry;
	};
} forEach A_mounted_var_vehicle_slots;

_entry