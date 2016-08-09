// A_towing_fnc_line_create

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_object);
if (undefined(_object)) exitWith {};

towing_line_create_request_buffer = [_object];
if (isServer) then {
	["", towing_line_create_request_buffer] call A_towing_fnc_line_create_request_receive;
}else{
	publicVariable "towing_line_create_request_buffer";
};
