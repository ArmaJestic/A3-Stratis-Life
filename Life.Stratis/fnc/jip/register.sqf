// A_jip_fnc_register

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

if (undefined(_this)) exitWith {};

jip_register_request_buffer = _this;
if (isServer) then {
	["", jip_register_request_buffer] call A_jip_fnc_register_request_receive;
}else{
	publicVariableServer "jip_register_request_buffer";
};
