// A_trunk_fnc_close

#include "../../includes/macro.h"



_vehicle = [player, "vehicle_trunk_used"] call A_object_fnc_getVariable;
if (undefined(_vehicle)) exitWith {null};

//player groupchat format["Closing trunk for %1", _vehicle];
_vehicle = [player, "vehicle_trunk_used"] call A_object_fnc_getVariable;
[_vehicle, "trunk_user_uuid", "0", true] call A_object_fnc_setVariable;
[_vehicle, "trunk_user_name", "Unknown", true] call A_object_fnc_setVariable;
[player, "vehicle_trunk_used", null] call A_object_fnc_setVariable; 
