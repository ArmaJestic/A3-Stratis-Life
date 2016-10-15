// A_tree_fnc_register_request_receive

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_variable);
ARGV(1,_this);
ARGV(0,_tree_id);

if (UNDEFINED(_tree_id)) exitWith {};
if (typeName _tree_id != "STRING") exitWith {};
if (_tree_id == "") exitWith {};

A_tree_var_registry pushBack _tree_id;
