// A_shop_menu_fnc_get_market_adjustment

#include "header.h"


ARGV(0,_item);
ARGV(1,_amount);
ARGV(2,_base_price);
ARGV(3,_supply);
ARGV(4,_max_stock);

private["_market_adjust"];
_market_adjust = 0;
	
if (_max_stock < 0) exitWith { 0 };

private["_stock_sold", "_percent_stock_sold"];
_stock_sold = (_max_stock - _supply);
_percent_stock_sold = (_stock_sold / _max_stock);
_market_adjust = (_amount * _base_price) * 0.25 * _percent_stock_sold;

_market_adjust
