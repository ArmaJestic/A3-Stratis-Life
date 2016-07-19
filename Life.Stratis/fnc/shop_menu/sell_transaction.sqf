// A_shop_menu_fnc_sell_transaction

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_data);

if (undefined(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};
private ["_total_return", "_sales_tax"];

_total_return = _data select A_shop_menu_var_sell_item_total_return;

[player, 'money', (_total_return)] call A_inventory_fnc_add_item;
[_data] call A_shop_menu_fnc_sell_update_stocks;
