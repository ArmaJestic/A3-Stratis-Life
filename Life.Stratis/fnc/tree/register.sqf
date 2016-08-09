// A_tree_fnc_register

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


player groupChat format["A_tree_fnc_register %1", _this];
if (undefined(_this)) exitWith {};

tree_register_request_buffer = _this;
if (isServer) then {
	["", tree_register_request_buffer] call A_tree_fnc_register_request_receive;
}else{
	publicVariableServer "tree_register_request_buffer";
};
