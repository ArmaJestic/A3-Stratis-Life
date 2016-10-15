// A_towing_fnc_line_create_setup

#include "header.h"

if (!(isServer)) exitWith {};

towing_line_create_request_buffer =  " ";
publicVariableServer "towing_line_create_request_buffer";
"towing_line_create_request_buffer" addPublicVariableEventHandler {_this call A_towing_fnc_line_create_request_receive;};
