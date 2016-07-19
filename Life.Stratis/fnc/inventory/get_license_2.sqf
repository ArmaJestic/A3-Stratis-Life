// A_inventory_fnc_get_license_2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

 private["_license_2"]; _license_2 = (((_this call A_inventory_fnc_get_item_array) select 4) select 2); if (undefined(_license_2)) exitWith {""}; _license_2
