// A_tree_fnc_delete_object

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_tree);
if (UNDEFINED(_tree)) exitWith {};

private["_variable_name"];
_variable_name = netId _tree;

private["_tree_soul"];
_tree_soul = server getVariable [_variable_name, objNull];

if (isNull _tree_soul) exitWith {};
player groupChat format["CLEANING TREE: %1", _variable_name];
deleteVehicle _tree_soul;
