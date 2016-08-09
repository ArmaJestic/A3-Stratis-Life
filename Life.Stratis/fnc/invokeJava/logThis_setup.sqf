// A_invokeJava_fnc_logThis_setup

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h" 

if (!(isServer)) exitWith {null};
diag_log format["A_invokeJava_fnc_logThis_setup %1", _this];

logThis_request_buffer =  " ";
publicVariableServer "logThis_request_buffer";
"logThis_request_buffer" addPublicVariableEventHandler { _this call A_invokeJava_fnc_logThis_request_receive;};
