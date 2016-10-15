// A_inventory_fnc_get_vehicle_max_kg

#include "header.h"

 
private["_item_array"];
_item_array = (_this call A_inventory_fnc_get_item_array);
if (UNDEFINED(_item_array) || {count(_item_array) == 0}) exitWith {
	server globalChat format["WARNING: A_inventory_fnc_get_vehicle_max_kg: could not find item %1", _this];
	0
};
((_item_array select 4) select 3)
