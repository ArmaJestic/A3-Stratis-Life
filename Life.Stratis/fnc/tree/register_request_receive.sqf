// A_tree_fnc_register_request_receive

#include "../../includes/constants.h"
#include "../../includes/macro.h"


[format["A_tree_fnc_register_request_receive %1", _this]] call A_jip_fnc_message;

ARGV(0,_variable);
ARGV(1,_this);
ARGV(0,_tree_id);


if (undefined(_tree_id)) exitWith {};
if (typeName _tree_id != "STRING") exitWith {};
if (_tree_id == "") exitWith {};

tree_registry set [count(tree_registry), _tree_id];
