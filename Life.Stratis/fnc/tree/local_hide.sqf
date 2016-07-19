// A_tree_fnc_local_hide

#include "../../includes/constants.h"
#include "../../includes/macro.h"

 _this spawn {
player groupChat format["A_tree_fnc_local_hide %1", _this];
ARGV(0,_tree);
if ([_tree] call A_tree_fnc_dead) exitWith {};	
_tree setVectorDirAndUp [([(vectorDir _tree), -1] call BIS_fnc_vectorMultiply), ([(vectorUp _tree), -1] call BIS_fnc_vectorMultiply)];
[_tree, true] call A_tree_fnc_set_dead;
};
