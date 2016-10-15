// A_shop_menu_fnc_buy_update_stocks

#include "header.h"


ARGV(0,_data);
if (UNDEFINED(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};

_item = _data select INDEX_BUY_KEY;
_max_stock = _data select INDEX_BUY_MAX_STOCK;
_amount = _data select INDEX_BUY_AMOUNT;
_supply = _data select INDEX_BUY_SUPPLY;
_shop_id = _data select INDEX_BUY_SHOP_ID;
_isOilBarrel = (_item == "OilBarrel");

if (_isOilBarrel) exitWith {
	[(_amount * A_main_var_fuel_per_barrel)] call A_shop_menu_fnc_update_fuel_consumed;
};

if (_max_stock < 0) exitWith {null};
_new_supply = _supply - _amount;
format['["%1", %2, %3] call A_inventory_fnc_item_stock_update;', _item, _new_supply, _shop_id] call A_broadcast_fnc_broadcast;
