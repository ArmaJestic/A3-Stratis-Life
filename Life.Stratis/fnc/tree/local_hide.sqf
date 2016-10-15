// A_tree_fnc_local_hide

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

 _this spawn {
ARGV(0,_tree);
if ([_tree] call A_tree_fnc_dead) exitWith {};	
_tree setVectorDirAndUp [([(vectorDir _tree), -1] call BIS_fnc_vectorMultiply), ([(vectorUp _tree), -1] call BIS_fnc_vectorMultiply)];
[_tree, true] call A_tree_fnc_set_dead;
};
