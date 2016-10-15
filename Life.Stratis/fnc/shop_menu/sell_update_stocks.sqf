// A_shop_menu_fnc_sell_update_stocks

#include "header.h"


params[["_data",null,[[]]]];
if (UNDEFINED(_data)) exitWith {null};

private _item = _data select INDEX_SELL_KEY;
private _max_stock = _data select INDEX_SELL_MAX_STOCK;
private _amount = _data select INDEX_SELL_AMOUNT;
private _supply = _data select INDEX_SELL_SUPPLY;
private _shop_id = _data select INDEX_SELL_SHOP_ID;
private _isOilBarrel = (_item == "OilBarrel");

if (_isOilBarrel) exitWith {
	[-(_amount * A_main_var_fuel_per_barrel)] call A_shop_menu_fnc_update_fuel_consumed;
};

if (_max_stock < 0) exitWith {null};
_new_supply = _supply + _amount;
format['["%1", %2, %3] call A_inventory_fnc_item_stock_update;', _item, _new_supply, _shop_id] call A_broadcast_fnc_broadcast;
