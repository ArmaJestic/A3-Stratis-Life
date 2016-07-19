// A_jip_fnc_get_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

if (not(isServer)) exitWith {};
[format["A_jip_fnc_get_setup %1", _this]] call A_jip_fnc_message;
jip_get_request_buffer =  " ";
publicVariableServer "jip_get_request_buffer";
"jip_get_request_buffer" addPublicVariableEventHandler { _this call A_jip_fnc_get_request_receive;};
