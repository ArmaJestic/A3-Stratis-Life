// A_vehicle_storage_fnc_get

#include "header.h"


//player groupChat format["A_vehicle_storage_fnc_get %1", _this];
ARGV(0,_id);
ARGV(1,_vehicle_id);
([_id, _vehicle_id] call A_list_fnc_get_value)
