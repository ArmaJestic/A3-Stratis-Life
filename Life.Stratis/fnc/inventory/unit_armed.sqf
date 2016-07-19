// A_inventory_fnc_unit_armed

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

if (count (weapons _this - nonlethalweapons) > 0) then {true}else{false}
