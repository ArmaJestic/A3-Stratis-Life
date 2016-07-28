// A_inventory_fnc_get_stock

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_item);

private["_shopnum"];
_shopnum = (_this select 1);

private["_shoparr", "_shopinv", "_itemnum"];
_shoparr = A_inv_var_itemshops select _shopnum;
_shopinv = _shoparr select 4;
_itemnum = [_item, _shopinv] call A_inventory_fnc_get_shop_item_number;

if (not( typeName _shopnum == "SCALAR" && typeName _itemnum == "SCALAR")) exitWith {-1};
if(typeName (INV_ItemMaxStocks select _shopnum) != "ARRAY")exitwith{-1};

(INV_ItemStocks select _shopnum) select _itemnum
