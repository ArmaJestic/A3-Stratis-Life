// A_trunk_fnc_open

#include "../../includes/macro.h"



call A_trunk_fnc_close;

ARGV(0,_vehicle);
[_vehicle, "trunk_user_uuid", (call A_trunk_fnc_get_uuid), true] call A_object_fnc_setVariable;
[_vehicle, "trunk_user_name", (name player), true] call A_object_fnc_setVariable;
[player, "vehicle_trunk_used", _vehicle] call A_object_fnc_setVariable; 

//player groupchat format["Opening trunk for %1", _vehicle];

//for redundancy, close the on all other player vehicles
format['[%1, %2] spawn A_trunk_fnc_close_other_trunk;', player, _vehicle] call broadcast;
