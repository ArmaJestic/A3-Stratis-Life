// A_vehicle_storage_fnc_data

#include "..\..\includes\macro.h"


//player groupChat format["A_vehicle_storage_fnc_data %1", _this];
ARGV(0,_id);
if (!([_id] call A_vehicle_storage_fnc_exists)) exitWith {null};
([_id] call A_list_fnc_data)
