// A_tree_fnc_create_item

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_position);
private["_object"];
_object = createVehicle ["Land_WoodPile_F", _position, [] , 0, "NONE"];
[_object, true] call A_object_fnc_baptize;
[_object, "wood", 1] call A_object_fnc_item_set_data;