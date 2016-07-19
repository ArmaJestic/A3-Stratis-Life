// A_inventory_fnc_get_max_stock

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_item);

private["_shopnum"];
_shopnum = (_this select 1);

private["_shoparr", "_shopinv", "_itemnum"];
_shoparr = INV_ItemShops select _shopnum;
_shopinv = _shoparr select 4;
_itemnum = [_item, _shopinv] call A_inventory_fnc_get_shop_item_number;

if (not(typeName _shopnum == "SCALAR" && typename _itemnum == "SCALAR")) exitWith {-1};
if(typename (INV_ItemMaxStocks select _shopnum) != "ARRAY") exitWith {-1};

((INV_ItemMaxStocks select _shopnum) select _itemnum)
