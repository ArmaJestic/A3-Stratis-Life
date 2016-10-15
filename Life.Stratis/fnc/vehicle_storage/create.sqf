// A_vehicle_storage_fnc_create

#include "header.h"


//player groupChat format["A_vehicle_storage_fnc_create %1", _this];
diag_log format['A_vehicle_storage_fnc_create: %1', _this];

ARGV(0,_id);
ARGV(1,_name);

diag_log format['A_vehicle_storage_fnc_create: exit check'];
if ([_id] call A_vehicle_storage_fnc_exists) exitWith {diag_log format['A_vehicle_storage_fnc_create: exit']; null};

diag_log format['A_vehicle_storage_fnc_create: calling A_list_fnc_create'];
[_id, _name] call A_list_fnc_create;

diag_log format['A_vehicle_storage_fnc_create: complete'];
