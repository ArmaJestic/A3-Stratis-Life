// A_shop_menu_fnc_get_fuel_price

#include "../../includes/constants.h"
#include "../../includes/macro.h"


private["_price", "_fuel_consumed", "_barrels_consumed"];
//the price of fuel goes up by 0.1 for every barrel of oil that is consumed
_fuel_consumed = call A_shop_menu_fnc_get_fuel_consumed;
_barrels_consumed = _fuel_consumed / fuel_per_barrel;
_price = fuel_base_price + (_barrels_consumed * 0.1);
(round(_price * 100) / 100)
