// A_vehicle_fnc_seize_trunk

#include "..\..\includes\macro.h"


ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_vehicle);

if (not([_player, _vehicle] call A_vehicle_fnc_view_trunk_available)) exitWith {};

private["_storage_name"];
_storage_name = ([_vehicle] call A_vehicle_fnc_storage_name);
[_vehicle, _storage_name] call A_inventory_fnc_storage_remove_illegal;	
