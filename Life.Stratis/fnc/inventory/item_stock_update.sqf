// A_inventory_fnc_item_stock_update

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_item);
ARGV(1,_stock);
ARGV(2,_shopnum);

private["_shoparr", "_shopinv", "_itemnum"];
_shoparr  = INV_ItemShops select _shopnum;
_shopinv  = (_shoparr select 4);
_itemnum  = [_item, _shopinv] call A_inventory_fnc_get_shop_item_number;

if (undefined(_shopnum)) exitWith {null};
if (typeName _shopnum != "SCALAR") exitWith {null};
if (undefined(_itemnum)) exitWith {null};
if (typeName _itemnum != "SCALAR") exitWith {null};

(INV_ItemStocks select _shopnum) SET [_itemnum, _stock];
