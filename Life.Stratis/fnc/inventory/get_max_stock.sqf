// A_inventory_fnc_get_max_stock

#include "header.h"


params["_item",["_shopnum",null,[0]]];

private _shoparr = A_inv_var_itemshops select _shopnum;
private _shopinv = _shoparr select 4;
private _itemnum = [_item, _shopinv] call A_inventory_fnc_get_shop_item_number;

if ((typeName _shopnum != "SCALAR") && (typename _itemnum != "SCALAR")) exitWith {-1};
if(typename (A_inv_var_ItemMaxStocks select _shopnum) != "ARRAY") exitWith {-1};

((A_inv_var_ItemMaxStocks select _shopnum) select _itemnum)