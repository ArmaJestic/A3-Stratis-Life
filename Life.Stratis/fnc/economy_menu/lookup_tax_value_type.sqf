// A_economy_menu_fnc_lookup_tax_value_type

#include "header.h"


ARGV(0,_tax_type);
if (UNDEFINED(_tax_type)) exitWith {0};

private["_tax_data"];
_tax_data = [_tax_type] call A_economy_menu_fnc_lookup_tax_type;
if (UNDEFINED(_tax_data)) exitWith {0};

(_tax_data select DLG_ECON_TAX_INDEX_VALUE)
