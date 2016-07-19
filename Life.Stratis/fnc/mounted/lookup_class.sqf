// A_mounted_fnc_lookup_class

#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


ARGV(0,_class);
if (undefined(_class)) exitWith {null};
if (typeName _class != "STRING") exitWith {null};

private["_entry"];
_entry = null;

{
	private["_centry", "_cclass", "_cslot_name", "_clots"];
	_centry = _x;
	_cclass = _centry select A_mounted_var_classes;
	if (_class in (_cclass) ) exitWith {
		_entry = _centry;
	};
} forEach A_mounted_var_vehicle_slots;

_entry
