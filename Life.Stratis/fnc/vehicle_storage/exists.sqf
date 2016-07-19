// A_vehicle_storage_fnc_exists

#include "../../includes/macro.h"


ARGV(0,_id);
if (undefined(_id)) exitWith {false};
if (typeName _id != "STRING") exitWith {false};

([_id] call A_list_fnc_exists)
