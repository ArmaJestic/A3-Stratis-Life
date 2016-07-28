// A_server_fnc_shop_drug_replenish

#include "..\..\includes\macro.h"

private["_shop_id", "_drug", "_amount"];
_shop_id = _this select 0;
_drug = _this select 1;
_amount = _this select 2;

if (undefined(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};
if (undefined(_drug)) exitWith {null};
if (typeName _drug != "STRING") exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};

private["_stock", "_max_stock"];
_stock = [_drug, _shop_id] call A_inventory_fnc_get_stock;
_max_stock = [_drug, _shop_id] call A_inventory_fnc_get_max_stock;
_amount = (_max_stock - _stock) min (_amount);
format['["%1", %2, %3] call A_inventory_fnc_item_stock_update;', _drug, (_stock + _amount), _shop_id] call A_broadcast_fnc_broadcast;
