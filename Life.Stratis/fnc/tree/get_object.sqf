// A_tree_fnc_get_object

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_tree);
if (UNDEFINED(_tree)) exitWith {};

private["_variable_name"];
_variable_name = netId _tree;

private["_tree_soul"];
_tree_soul = server getVariable [_variable_name, objNull];
if (isNull _tree_soul) then {
	_tree_soul =  "Sign_Sphere25cm_F" createVehicle[0,0,10000]; 
	server setVariable[_variable_name, _tree_soul, true];
	player groupChat format["SPAWNING TREE: %1", _variable_name];
	_tree_soul setVariable["health", 1, true];
};
_tree_soul
