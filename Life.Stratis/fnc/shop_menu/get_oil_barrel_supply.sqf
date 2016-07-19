// A_shop_menu_fnc_get_oil_barrel_supply

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_demand", "_supply", "_max_stock"];
_demand = call A_shop_menu_fnc_get_oil_barrel_demand;
_max_stock = call shop_get_oil_barrel_stock;
_supply = _max_stock - _demand;
_supply
