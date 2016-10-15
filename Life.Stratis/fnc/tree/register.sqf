// A_tree_fnc_register

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


if (UNDEFINED(_this)) exitWith {};

tree_register_request_buffer = _this;
if (isServer) then {
	["", tree_register_request_buffer] call A_tree_fnc_register_request_receive;
}else{
	publicVariableServer "tree_register_request_buffer";
};
