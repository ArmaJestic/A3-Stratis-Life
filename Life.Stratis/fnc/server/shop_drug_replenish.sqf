// A_server_fnc_shop_drug_replenish

#include "header.h"


params[["_shop_id",null,[0]],["_drug",null,[0]],["_amount",null,[0]]];

if (UNDEFINED(_shop_id)) exitWith {null};
if (UNDEFINED(_drug)) exitWith {null};
if (UNDEFINED(_amount)) exitWith {null};

private _stock = [_drug, _shop_id] call A_inventory_fnc_get_stock;
private _max_stock = [_drug, _shop_id] call A_inventory_fnc_get_max_stock;
_amount = (_max_stock - _stock) min (_amount);
format['["%1", %2, %3] call A_inventory_fnc_item_stock_update;', _drug, (_stock + _amount), _shop_id] call A_broadcast_fnc_broadcast;