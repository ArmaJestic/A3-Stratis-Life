// A_jip_fnc_register_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

if (!(isServer)) exitWith {};

[format["A_jip_fnc_register_setup %1", _this]] call A_jip_fnc_message;
jip_register_request_buffer =  " ";
publicVariableServer "jip_register_request_buffer";
"jip_register_request_buffer" addPublicVariableEventHandler { _this call A_jip_fnc_register_request_receive;};
