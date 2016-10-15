// A_inventory_fnc_get_license_1

#include "header.h"

private["_license_1"]; 
_license_1 = (((_this call A_inventory_fnc_get_item_array) select 4) select 1); 
if (UNDEFINED(_license_1)) exitWith {""}; 
_license_1
