// A_shop_menu_fnc_buy_transaction

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_data);

if (undefined(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};
private ["_total_due", "_sales_tax"];

_total_due = [(_data select A_shop_menu_var_buy_item_total_due)] call A_encoding_fnc_decode_number;
_sales_tax = _data select A_shop_menu_var_buy_item_sales_tax;


[player, 'money', -(_total_due)] call A_inventory_fnc_add_item;
[_sales_tax] call A_shop_menu_fnc_update_paid_taxes;
[_data] call A_shop_menu_fnc_buy_update_stocks;
