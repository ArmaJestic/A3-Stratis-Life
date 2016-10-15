// A_vehicle_fnc_save_gear

#include "header.h"


ARGV(0,_vehicle);
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

vehicle_side_gear_request_buffer = [_vehicle];
if (isServer) then {
	["", vehicle_side_gear_request_buffer] call A_vehicle_fnc_save_gear_request_receive;
}else{
	publicVariable "vehicle_side_gear_request_buffer";
};
