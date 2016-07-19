// A_economy_menu_fnc_lookup_tax_type

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_tax_type);
if (undefined(_tax_type)) exitWith {null};
if (typeName _tax_type != "STRING") exitWith {null};

private["_tax_data"];
_tax_data = null;
{
	private["_ctax_type", "_ctax_data", "_ctax_value"];
	_ctax_data = _x;
	_ctax_type = _ctax_data select A_economy_menu_var_tax_type;
	if (_tax_type == _ctax_type) then {
		_tax_data = _ctax_data;
	};
} forEach economy_tax_data;

_tax_data
