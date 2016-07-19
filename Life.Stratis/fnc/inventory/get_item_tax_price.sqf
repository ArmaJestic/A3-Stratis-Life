// A_inventory_fnc_get_item_tax_price

#include "../../includes/constants.h"
#include "../../includes/macro.h"


private ["_type", "_preis", "_result"];
_type  = (_this select 0) call A_inventory_fnc_get_item_type;
_preis = (_this select 1);
[_preis, ([_type] call A_economy_menu_fnc_lookup_tax_value_type)] call A_inventory_fnc_add_percent;
