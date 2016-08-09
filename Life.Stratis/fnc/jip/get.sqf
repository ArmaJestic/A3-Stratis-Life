// A_jip_fnc_get

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

ARGV(0,_object);
ARGV(1,_jip_variable);

jip_get_request_buffer = [_object,_jip_variable];
if (isServer) then {
	["", jip_get_request_buffer] call A_jip_fnc_get_request_receive;
}else{
	publicVariableServer "jip_get_request_buffer";
};
