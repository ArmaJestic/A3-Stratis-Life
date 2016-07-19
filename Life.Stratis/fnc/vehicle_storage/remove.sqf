// A_vehicle_storage_fnc_remove

#include "../../includes/macro.h"


//player groupChat format["A_vehicle_storage_fnc_remove %1", _this];
ARGV(0,_id);
ARGV(1,_vehicle_id);

([_id, _vehicle_id] call A_list_fnc_remove_key)
