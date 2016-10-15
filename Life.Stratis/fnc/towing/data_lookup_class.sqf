// A_towing_fnc_data_lookup_class

#include "header.h"


ARGV(0,_class);

if (UNDEFINED(_class)) exitWith {null};

if (_class isKindOf "Man") then {
	_class = "Man";
};

private["_entry"];
_entry = null;

{
	private["_centry", "_cclass"];
	_centry = _x;
	_cclass = _centry select INDEX_CLASS;
	if (_cclass == _class) then {
		_entry = _centry;
	};
} forEach towing_data;
_entry
