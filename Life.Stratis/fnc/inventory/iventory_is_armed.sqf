// A_inventory_fnc_iventory_is_armed

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

if (count (weapons player - nonlethalweapons) > 0) then {true}else{false}
