// A_shop_menu_fnc_buy_transaction

#include "header.h"


ARGV(0,_data);

if (UNDEFINED(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};
private ["_total_due", "_sales_tax"];

_total_due = [(_data select INDEX_BUY_TOTAL_DUE)] call A_encoding_fnc_decode_number;
_sales_tax = _data select INDEX_BUY_SALES_TAX;


[player, 'money', -(_total_due)] call A_inventory_fnc_add_item;
[_sales_tax] call A_shop_menu_fnc_update_paid_taxes;
[_data] call A_shop_menu_fnc_buy_update_stocks;
