// A_shop_menu_fnc_buy_update_stocks

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_data);
if (undefined(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};

_item = _data select A_shop_menu_var_buy_item_key;
_max_stock = _data select A_shop_menu_var_buy_item_max_stock;
_amount = _data select A_shop_menu_var_buy_item_amount;
_supply = _data select A_shop_menu_var_buy_item_supply;
_shop_id = _data select A_shop_menu_var_buy_item_shop_id;
_isOilBarrel = (_item == "OilBarrel");

if (_isOilBarrel) exitWith {
	[(_amount * fuel_per_barrel)] call A_shop_menu_fnc_update_fuel_consumed;
};

if (_max_stock < 0) exitWith {null};
_new_supply = _supply - _amount;
format['["%1", %2, %3] call A_inventory_fnc_item_stock_update;', _item, _new_supply, _shop_id] call broadcast;
