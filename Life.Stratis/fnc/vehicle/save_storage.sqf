// A_vehicle_fnc_save_storage

#include "header.h"


/*
private["_str"];
_str =  format["A_vehicle_fnc_save_storage %1", _this];
player groupChat _str;
diag_log _str;
*/

ARGV(0,_vehicle);

private["_storage_name"];
_storage_name = [_vehicle] call A_vehicle_fnc_storage_name;

if (_storage_name == "") exitWith {null};
private["_storage_variable"];
_storage_variable = [_vehicle, _storage_name] call A_vehicle_fnc_get_array;

/*
private["_str"];
_str =  format["A_vehicle_fnc_save_storage %1, %2, %3", _vehicle, _storage_name, _storage_variable];
player groupChat _str;
diag_log _str;
*/
	
[_vehicle, _storage_name, _storage_variable, false] call A_vehicle_fnc_set_array_checked;
