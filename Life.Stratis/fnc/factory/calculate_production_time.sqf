// A_factory_fnc_calculate_production_time

#include "../../includes/macro.h"
#include "../../includes/constants.h"


//player groupChat format["A_factory_fnc_calculate_production_time %1", _this];
ARGV(0,_item);
ARGV(1,_workers);

if (undefined(_item)) exitWith {0};
if (undefined(_workers)) exitWith {0};
if (typeName _item != "STRING") exitWith {0};
if (typeName _workers != "SCALAR") exitWith {0};

if (_workers <= 0) exitWith {0};

private["_item_cost"];

_item_cost = (_item call A_inventory_fnc_get_item_buy_cost);

// simple linear formula for calculating the production time ... 
// the more workers you have, the lower the production time
// the more expensive the item is the higher the production time
private["_eta"];
_eta = (_item_cost * 0.01125);
_eta = (_eta) min( maxmanitime);
_eta = (_eta * 5) / _workers;
_eta = round(_eta);
_eta	
