// A_tree_fnc_register_setup

#include "../../includes/constants.h"
#include "../../includes/macro.h"


if (not(isServer)) exitWith {};

[format["A_tree_fnc_register_setup %1", _this]] call A_jip_fnc_message;
tree_register_request_buffer =  "";
publicVariableServer "tree_register_request_buffer";
"tree_register_request_buffer" addPublicVariableEventHandler { _this call A_tree_fnc_register_request_receive;};
server setVariable ["tree_register_setup_complete", true, true];
