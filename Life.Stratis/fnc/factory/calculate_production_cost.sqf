// A_factory_fnc_calculate_production_cost

#include "../../includes/macro.h"
#include "../../includes/constants.h"


//player groupChat format["A_factory_fnc_calculate_production_cost %1", _this];
ARGV(0,_item);
if (undefined(_item)) exitWith {0};
if (typeName _item != "STRING") exitWith {0};

private["_buy_price"];
_buy_price = (_item call A_inventory_fnc_get_item_buy_cost);
_sell_price = (_item call A_inventory_fnc_get_item_sell_cost);


// simple forumla for calculating the production cost
// in order for factory owner, to make a profit, the production cost 
// must be lower than the amount the items sells for ... 
// whatever extra money the factory owner makes after selling the item is
// called the profit margin.
// We are fixing here the profit margin to 10%
private["_profit_margin"];
_profit_margin = 0.1; 

private["_cost"];
_cost = _sell_price - _sell_price * _profit_margin;
(_cost)
