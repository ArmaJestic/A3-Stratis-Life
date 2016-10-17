// A_inventory_fnc_item_stock_update

#include "header.h"


params["_item","_stock",["_shopnum",null,[0]]];
if UNDEFINED(_shopnum) exitWith {null};

private _shoparr  = A_inv_var_itemshops select _shopnum;
private _shopinv  = (_shoparr select 4);
private _itemnum  = [_item, _shopinv] call A_inventory_fnc_get_shop_item_number;

if UNDEFINED(_itemnum) exitWith {null};
if (typeName _itemnum != "SCALAR") exitWith {null};

(A_inv_var_ItemStocks select _shopnum) SET[_itemnum, _stock];