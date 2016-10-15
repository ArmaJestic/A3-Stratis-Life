// A_inventory_fnc_get_item_tax

#include "header.h"


private ["_type", "_item", "_result"];
_type = _this call A_inventory_fnc_get_item_type;
_cost = _this call A_inventory_fnc_get_item_buy_cost;
[_cost, ([_type] call A_economy_menu_fnc_lookup_tax_value_type)] call A_inventory_fnc_add_percent;
