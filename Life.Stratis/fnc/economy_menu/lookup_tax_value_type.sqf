// A_economy_menu_fnc_lookup_tax_value_type

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_tax_type);
if (undefined(_tax_type)) exitWith {0};

private["_tax_data"];
_tax_data = [_tax_type] call A_economy_menu_fnc_lookup_tax_type;
if (undefined(_tax_data)) exitWith {0};

(_tax_data select A_economy_menu_var_tax_value)
