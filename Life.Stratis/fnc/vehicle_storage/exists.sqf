// A_vehicle_storage_fnc_exists

#include "header.h"


ARGV(0,_id);
if (UNDEFINED(_id)) exitWith {false};
if (typeName _id != "STRING") exitWith {false};

([_id] call A_list_fnc_exists)
