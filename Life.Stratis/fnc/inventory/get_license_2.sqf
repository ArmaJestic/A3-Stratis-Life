// A_inventory_fnc_get_license_2

#include "header.h"

private["_license_2"]; 
_license_2 = (((_this call A_inventory_fnc_get_item_array) select 4) select 2); 
if (UNDEFINED(_license_2)) exitWith {""}; 
_license_2
