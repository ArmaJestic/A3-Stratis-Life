// A_vehicle_storage_fnc_init

#include "../../includes/macro.h"


diag_log format['vehicle_storage_functions: running init'];

if(!(isServer)) exitWith {diag_log format['vehicle_storage_functions: running init exit']; null};
//player groupChat format["A_vehicle_storage_fnc_init %1", _this];

diag_log format['vehicle_storage_functions: running init create impound'];

["impound_lot", "Vehicle Impound Lot"] call A_vehicle_storage_fnc_create;
