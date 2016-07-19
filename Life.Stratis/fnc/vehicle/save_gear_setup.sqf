// A_vehicle_fnc_save_gear_setup

#include "..\..\includes\macro.h"


if (not(isServer)) exitWith {null};
//player groupChat format["A_vehicle_fnc_save_gear_setup %1", _this];
vehicle_side_gear_request_buffer =  " ";
publicVariableServer "vehicle_side_gear_request_buffer";
"vehicle_side_gear_request_buffer" addPublicVariableEventHandler { _this call A_vehicle_fnc_save_gear_request_receive;};
