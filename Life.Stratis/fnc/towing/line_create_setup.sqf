// A_towing_fnc_line_create_setup

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (not(isServer)) exitWith {null};

towing_line_create_request_buffer =  " ";
publicVariableServer "towing_line_create_request_buffer";
"towing_line_create_request_buffer" addPublicVariableEventHandler { _this call A_towing_fnc_line_create_request_receive;};
