// A_inventory_fnc_item_stock_update

#include "header.h"


ARGV(0,_item);
ARGV(1,_stock);
ARGV(2,_shopnum);

private["_shoparr", "_shopinv", "_itemnum"];
_shoparr  = A_inv_var_itemshops select _shopnum;
_shopinv  = (_shoparr select 4);
_itemnum  = [_item, _shopinv] call A_inventory_fnc_get_shop_item_number;

if (UNDEFINED(_shopnum)) exitWith {null};
if (typeName _shopnum != "SCALAR") exitWith {null};
if (UNDEFINED(_itemnum)) exitWith {null};
if (typeName _itemnum != "SCALAR") exitWith {null};

(A_inv_var_ItemStocks select _shopnum) SET [_itemnum, _stock];