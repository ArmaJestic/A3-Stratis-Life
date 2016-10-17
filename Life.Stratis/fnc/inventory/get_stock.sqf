// A_inventory_fnc_get_stock

#include "header.h"


params["_item","_shopnum"];

private _shoparr = A_inv_var_itemshops select _shopnum;
private _shopinv = _shoparr select 4;
private _itemnum = [_item, _shopinv] call A_inventory_fnc_get_shop_item_number;

if ((typeName _shopnum != "SCALAR") && {typeName _itemnum != "SCALAR"}) exitWith {-1};
if(typeName (A_inv_var_ItemMaxStocks select _shopnum) != "ARRAY")exitwith{-1};

(A_inv_var_ItemStocks select _shopnum) select _itemnum