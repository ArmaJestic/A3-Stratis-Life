// A_vehicle_fnc_save_gear_request_receive

#include "../../includes/macro.h"


/*
private["_str"];
_str = format["A_vehicle_fnc_save_gear_request_receive %1", _this];
player groupChat _str;
diag_log _str;
*/

ARGV(0,_variable);
ARGV(1,_request);

if (undefined(_request)) exitWith {null};
if (typeName _request != "ARRAY") exitWith {null};

private["_vehicle"];
_vehicle = _request select 0;
private["_gear", "_weapons", "_magazines"];
//diag_log format["getting gear for %1", _vehicle];
_gear = [_vehicle] call A_vehicle_fnc_get_gear;
if (undefined(_gear)) exitWith {null};
//diag_log format["saving %1, %2", _vehicle, _gear];
_weapons = _gear select A_vehicle_var_gear_weapons_cargo;
_magazines = _gear select A_vehicle_var_gear_magazines_cargo;
[_vehicle, "weapons", _weapons] call A_vehicle_fnc_set_array;
[_vehicle, "magazines", _magazines] call A_vehicle_fnc_set_array;
