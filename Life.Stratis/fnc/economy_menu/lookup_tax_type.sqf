// A_economy_menu_fnc_lookup_tax_type

#include "header.h"


params[["_tax_type",null,[""]]];
if UNDEFINED(_tax_type) exitWith {null};

private _tax_data = null;
{
	private _ctax_data = _x;
	private _ctax_type = _ctax_data select DLG_ECON_TAX_INDEX_TYPE;
	if (_tax_type == _ctax_type) exitwith {
		_tax_data = _ctax_data;
	};
} forEach economy_tax_data;

_tax_data