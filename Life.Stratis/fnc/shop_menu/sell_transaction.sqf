// A_shop_menu_fnc_sell_transaction

#include "header.h"


params[["_data",null,[[]]]];
if (UNDEFINED(_data)) exitWith {null};

private _total_return = _data select INDEX_SELL_TOTAL_RETURN;

[player, 'money', (_total_return)] call A_inventory_fnc_add_item;
[_data] call A_shop_menu_fnc_sell_update_stocks;