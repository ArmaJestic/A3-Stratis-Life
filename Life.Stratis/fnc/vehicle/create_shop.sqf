// A_vehicle_fnc_create_shop

#include "..\..\includes\macro.h"


ARGV(0,_logic);
ARGV(1,_class);
ARGV(2,_item);

([_logic, _class, _item, !(isPlayer _logic)] call A_vehicle_fnc_create_shop_extended)
