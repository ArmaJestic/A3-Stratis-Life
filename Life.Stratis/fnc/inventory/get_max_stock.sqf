// A_inventory_fnc_get_max_stock

#include "header.h"


ARGV(0,_item);

private["_shopnum"];
_shopnum = (_this select 1);

private["_shoparr", "_shopinv", "_itemnum"];
_shoparr = A_inv_var_itemshops select _shopnum;
_shopinv = _shoparr select 4;
_itemnum = [_item, _shopinv] call A_inventory_fnc_get_shop_item_number;

if (!(typeName _shopnum == "SCALAR" && typename _itemnum == "SCALAR")) exitWith {-1};
if(typename (A_inv_var_ItemMaxStocks select _shopnum) != "ARRAY") exitWith {-1};

((A_inv_var_ItemMaxStocks select _shopnum) select _itemnum)
