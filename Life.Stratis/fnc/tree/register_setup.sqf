// A_tree_fnc_register_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


if (!(isServer)) exitWith {};

tree_register_request_buffer =  "";
publicVariableServer "tree_register_request_buffer";
"tree_register_request_buffer" addPublicVariableEventHandler { _this call A_tree_fnc_register_request_receive;};
server setVariable["tree_register_setup_complete", true, true];